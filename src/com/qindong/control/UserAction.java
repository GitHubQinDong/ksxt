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
	private static List<Map<String,Object>> sc=DBUtil.query("select * from subject_choice");//����ѡ����
	private static List<Map<String,Object>> sb=DBUtil.query("select * from subject_brief");//���м����
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
		String msg="��¼ʧ�ܣ��û�������������������µ�¼";
		List<Map<String, Object>> l=DBUtil.query("select * from user where role=? and name=? and pwd=?",role,name,pwd);
		if(l.size()>0){
			HttpSession hs=request.getSession();
			if(hs.getAttribute("sc") == null){
				hs.setAttribute("sc",sc);hs.setAttribute("sb",sb);
			}
			request.getSession().setAttribute("user",l.get(0));
			username=(String)l.get(0).get("name");
			request.getRequestDispatcher("WEB-INF/"+("teacher".equals(l.get(0).get("role"))?"admin.jsp":"index.jsp")).forward(request, response);
		}else{
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("denglu.jsp").forward(request, response);
		}
	}
	
	public void ����(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		StringBuffer answer_c=new StringBuffer();//ѡ�����,ÿ��ѡ���Կո�ָ�,δ�������x
		StringBuffer answer_b=new StringBuffer();//�����𰸣�ÿ����Ŀ��˫�ֺŷָ�
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
		DBUtil.update("insert answer(s_name,sub_title,answer_c,answer_b,ct) values(?,'��ѧ��ѧϰ����ʾ�����',?,?,now())",username,answer_c.toString(),answer_b.toString());
		response.sendRedirect(request.getContextPath());
	}
	
	public void ͳ��(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Map<String, Object>> sub_c= DBUtil.query("select answer_c from answer where stat=0 and sub_title='��ѧ��ѧϰ����ʾ�����'");
		List<Map<String, Integer>> per_c=new ArrayList<Map<String, Integer>>();
		for(Map<String, Object> m:sub_c){
			String[] strs=m.get("answer_c").toString().split(" ");
			for(int j=0;j<strs.length;j++){
				if(per_c.size()<=j){
					per_c.set(j, new HashMap<String, Integer>());
					for(int i=0;i<7;i++)
						per_c.get(j).put((char)('A'+i)+"",0);
				}
				for(int i=0;i<7;i++)
					if(strs[j].indexOf((char)('A'+i)+"")>-1)per_c.get(j).put((char)('A'+i)+"",per_c.get(j).get((char)('A'+i)+"")+1);
			}
		}
					
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getSession().invalidate();
		request.getRequestDispatcher("denglu.jsp").forward(request, response);
	}
	public void zhuce(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		DBUtil.update("insert into user(username,password) values(?,?)",name,pwd);
		//���ݿ�洢��Ӧ�û�
		request.getSession().setAttribute("user",name);
		request.getRequestDispatcher("denglu.jsp").forward(request, response);
	}
	public void jiaoyan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String name=request.getParameter("name");
			List<Map<String, Object>> l= DBUtil.query("select * from user where username=?",name);
			String flag="false";	//�����Ƿ��ظ��ı�־λ��Ĭ��Ϊfalse�������ظ�
			if(l.size()>0)
				flag="true";
			PrintWriter pw=response.getWriter();
			pw.write(flag);
			pw.flush();
			pw.close();
	}
	public static void main(String[] args) {
		System.out.println("abc".indexOf("a")>-1);
	}
}