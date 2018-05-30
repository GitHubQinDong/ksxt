<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<% String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<title>管理员页面</title>
	<link  type="text/css" rel="stylesheet"  href="css/style1.css"/>
	<link  type="text/css" rel="stylesheet"  href="css/index.css"/>
	<script  src="js/jquery-1.11.3.min.js"></script>
	<script  src="js/menu.js"></script><!-- 动态菜单JS -->
</head>
<body>
<div class="container">
 <div class="cont-top">
  <div class="companyname">大学生问卷调查与考试系统</div>
  <div class="cont-top-rg">
   <ul class="advanced-menu">
    <li>
     <div class="top-search">
      <div class="t-s-l">
       <span class="left-line"></span>
       <select>
       		<option>搜&nbsp;用&nbsp;户&nbsp;</option>
       		<option>搜&nbsp;试&nbsp;题&nbsp;</option>
       </select>
      </div>
      <div class="t-s-l">
       <input type="text" placeholder="请输入用户名称或试题标题" class="search-dt" autocomplete="off"> 
       <span class="right-line"></span>
       <span class="right-icon"><img src="img/search-icon.png"></span>
      </div>
     </div>
    </li>
    <li class="default" style="position:relative;">
     <span class="user"><img src="img/user.png"></span>
     <a  href="#" class="special">${user.name }</a> <i><img src="img/xl.png"></i>
     <div class="drop-down-wrap" style="width:180px;left:15px;display: none;">
      <div class="drop-down">
       <span class="triangle-border"></span>
       <span class="triangle-bg"></span>
       <ul class="del-ul">
        <li><a href="#" class="hot">首耀照明</a></li>
        <li><a href="#">小丫头</a></li>
        <li><a href="#">操作日志</a></li>       
       </ul>
      </div>
     </div>
    </li>    
   </ul>
   <ul class="advanced-menu">
    <li><a href="#"><img src="img/top-icon1.png"></a></li>
    <li><a href="#"><img src="img/top-icon2.png"></a></li>
    <li><a href="#"><img src="img/top-icon3.png"></a></li>
    <li><a href="#"><img src="img/top-icon4.png"></a></li>
    <li><a href="user?method=logout" onclick="return confirm('是否确认退出系统？')"><img  src="img/top-icon5.png"></a></li>
   </ul>
  </div>
 </div>
 <div class="left-menu">
  <div class="menu-list">
   <ul>
    <li class="menu-list-01" >
     <p class="fumenu">用户管理</p>
     <img class="xiala" src="img/xiala.png" />
     <div class="list-p">
      <p class="zcd" id="zcd1">管理用户</p>
      <p class="zcd" id="zcd2">流程批准</p>
      <p class="zcd" id="zcd3">用户统计</p>
     </div>
    </li>
    <li class="menu-list-02">
     <p class="fumenu">试题管理</p>
     <img class="xiala" src="img/xiala.png" />
     <div class="list-p">
      <p class="zcd" id="zcd4">选择题</p>
      <p class="zcd" id="zcd5">填空题</p>
      <p class="zcd" id="zcd6">简答题</p>
      <p class="zcd" id="zcd7">试题信息</p>
     </div>
    </li>
    <li class="menu-list-01" >
     <p class="fumenu">答题查询</p>
     <img class="xiala" src="img/xiala.png" />
     <div class="list-p">
      <p class="zcd" id="zcd8">管理用户</p>
      <p class="zcd" id="zcd9">流程批准</p>
     </div>
    </li>
   </ul>
  </div>
 </div>
 <div class="right-menu">
    <div class="l-tab-links">
     <ul style="left:0;">
      <li class="l-select">
       <span style="padding:0 25px;">问卷调查结果统计</span>
      </li>
     </ul>
    </div>
    <div class="l-tab-content">
     <div class="tab-content-item" >
      <div class="home" id='container'>
      	
      </div>
     </div>
    </div>
 </div>
 </div>
</body>
<script src="js/echarts.js"></script>
<script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
option = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
        data:['A','B','C','D','E','F','G','未选择']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : [<c:forEach var="i" begin="1" end="${fn:length(per_c['A'])}">'${i}',</c:forEach>]
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
		<c:forEach var="i" items='${per_c}'>
        {
            name:'${i.key}',
            type:'bar',
            stack:'选项',
            data:${i.value}
        },
        </c:forEach>
    ]
};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
</script>
</html>