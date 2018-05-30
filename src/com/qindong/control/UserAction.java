package com.qindong.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qindong.util.DBUtil;

public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String username;
	private static List<Map<String,Object>> sc=DBUtil.query("select * from subject_choice");//所有选择题
	private static List<Map<String,Object>> sb=DBUtil.query("select * from subject_brief");//所有简答题
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		try {
			Method m=UserAction.class.getDeclaredMethod(method,HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this,request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String role=request.getParameter("role");
		String msg="登录失败，用户名或者密码错误，请重新登录";
		List<Map<String, Object>> l=DBUtil.query("select * from user where role=? and name=? and pwd=?",role,name,pwd);
		if(l.size()>0){
			HttpSession hs=request.getSession();
			if(hs.getAttribute("sc") == null&&sc.size()!=0){
				hs.setAttribute("sc",sc);hs.setAttribute("sb",sb);
			}
			if(hs.getAttribute("per_c") == null&&"teacher".equals(l.get(0).get("role")))hs.setAttribute("per_c",统计());
			hs.setAttribute("user",l.get(0));
			username=(String)l.get(0).get("name");
			request.getRequestDispatcher("WEB-INF/"+("teacher".equals(l.get(0).get("role"))?"admin.jsp":"index.jsp")).forward(request, response);
		}else{
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	
	public void 交卷(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		StringBuffer answer_c=new StringBuffer();//选择题答案,每个选项以空格分割,未答题填充x
		StringBuffer answer_b=new StringBuffer();//简答题答案，每个题目以双分号分割
		for(int i=1;i<=30;i++){
			String stype=(String) sc.get(i-1).get("type");
			String answer=request.getParameter("answer"+i);
			StringBuffer s=new StringBuffer();
			if(answer==null)s.append("x");
			else if("1".equals(stype)){
				s.setLength(0);
				for(String str:request.getParameterValues("answer"+i))s.append(str);
			}else s.append(answer);
			answer_c.append(s+" ");
		}
		for(int i=1;i<=4;i++)
			answer_b.append(request.getParameter("brief"+i)+" ;;");
		DBUtil.update("insert answer(s_name,sub_title,answer_c,answer_b) values(?,'大学生学习情况问卷调查',?,?)",username,answer_c.toString(),answer_b.toString());
		response.sendRedirect(request.getContextPath());
	}
	
	public static Map<String, List<Integer>> 统计(){
		List<Map<String, Object>> sub_c= DBUtil.query("select answer_c from answer where stat=0 and sub_title='大学生学习情况问卷调查'");
		List<Map<String, Integer>> per_c=new ArrayList<Map<String, Integer>>();
		for(Map<String, Object> m:sub_c){
			String[] strs=m.get("answer_c").toString().split(" ");
			for(int j=0;j<strs.length;j++){
				if(per_c.size()==j){
					per_c.add(j, new HashMap<String, Integer>());
					for(int i=0;i<7;i++)
						per_c.get(j).put((char)('A'+i)+"",0);
					per_c.get(j).put("未选择",0);
				}
				Map<String, Integer> n=per_c.get(j);
				for(int i=0;i<7;i++)
					if(strs[j].indexOf((char)('a'+i)+"")>-1)n.put((char)('A'+i)+"",n.get((char)('A'+i)+"")+1);
				if(strs[j].indexOf("x")>-1)n.put("未选择",n.get("未选择")+1);
			}
		}
		Map<String, List<Integer>> per_opts=new HashMap<String, List<Integer>>();
		for(Map<String, Integer> m:per_c)
			for(String key:m.keySet()){
				if(!per_opts.containsKey(key))per_opts.put(key,new ArrayList<Integer>());
				per_opts.get(key).add(m.get(key));
			}
		return per_opts;
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getSession().invalidate();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	public void zhuce(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		DBUtil.update("insert into user(name,pwd) values(?,?)",name,pwd);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	public void jiaoyan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String name=request.getParameter("name");
			List<Map<String, Object>> l= DBUtil.query("select * from user where name=? and role='student'",name);
			String flag="false";	//名字是否重复的标志位，默认为false代表不重复
			if(l.size()>0)flag="true";
			PrintWriter pw=response.getWriter();
			pw.write(flag);
			pw.flush();
			pw.close();
	}
	
	public static void main(String[] args) {
		Map<String, Object> m=new HashMap<String, Object>();
		System.out.println(m.get("a"));
		System.out.println(UserAction.统计());
	}
}