<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<title>管理员页面</title>
	<link  type="text/css" rel="stylesheet"  href="css/style.css"/>
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
       		<option>搜用户&nbsp;&nbsp;
       		<option>搜试题&nbsp;&nbsp;
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
      <p class="zcd" id="zcd5">管理用户</p>
      <p class="zcd" id="zcd6">流程批准</p>
      <p class="zcd" id="zcd7">用户统计</p>
     </div>
    </li>
    <li class="menu-list-02">
     <p class="fumenu">试题管理</p>
     <img class="xiala" src="img/xiala.png" />
     <div class="list-p">
      <p class="zcd" id="zcd5">选择题</p>
      <p class="zcd" id="zcd6">填空题</p>
      <p class="zcd" id="zcd7">简答题</p>
      <p class="zcd" id="zcd7">试题信息</p>
     </div>
    </li>
   </ul>
  </div>
 </div>
 <div class="right-menu">
    <div class="l-tab-links">
     <ul style="left:0;">
      <li class="l-select">
       <a href="#" style="padding:0 25px;">首页</a>
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
            data : ['周一','周二','周三','周四','周五','周六','周日']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'A',
            type:'bar',
            stack:'选项',
            data:[320, 332, 301, 334, 390, 330, 320]
        },
        {
            name:'B',
            type:'bar',
            stack:'选项',
            data:[120, 132, 101, 134, 90, 230, 210]
        },
        {
            name:'C',
            type:'bar',
            stack:'选项',
            data:[220, 182, 191, 234, 290, 330, 310]
        },
        {
            name:'D',
            type:'bar',
            stack:'选项',
            data:[150, 232, 201, 154, 190, 330, 410]
        },
        {
            name:'E',
            type:'bar',
            stack:'选项',
            data:[862, 1018, 964, 1026, 1679, 1600, 1570],
        },
        {
            name:'F',
            type:'bar',
            stack:'选项',
            data:[620, 732, 701, 734, 1090, 1130, 1120]
        },
        {
            name:'G',
            type:'bar',
            stack:'选项',
            data:[120, 132, 101, 134, 290, 230, 220]
        },
        {
            name:'未选择',
            type:'bar',
            stack:'选项',
            data:[60, 72, 71, 74, 190, 130, 110]
        }
    ]
};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
</script>
</html>