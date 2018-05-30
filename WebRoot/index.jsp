<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>大学生问卷调查系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/snow.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
 </head>
 <body>
  	<div class="snow-container">
	  <div class="snow foreground"></div>
	  <div class="snow foreground layered"></div>
	  <div class="snow middleground"></div>
	  <div class="snow middleground layered"></div>
	  <div class="snow background"></div>
	  <div class="snow background layered"></div>
	</div>
	<div class="top-buttons-agileinfo">
		<a href="#"  class="active">登录</a><a href="signup.jsp">注册</a>
	</div>
	<h1>大学生在线问卷调查</h1>
	<div class="main-agileits">
		<div class="form-w3-agile">
			<h2 class="sub-agileits-w3layouts">登录</h2>
			<form action="user" method="post">
					<input type="hidden" name="method" value="login">
					<input type="text" name="name" placeholder="用户" required="" />
					<input type="password" name="pwd" placeholder="密码" required="" />
					<input type="radio" name="role" value="student" checked id='stu'>
						<label style='color:white' for="stu">学&nbsp;&nbsp;生</label>
	                <input type="radio" name="role" value="teacher" id='tea' >
	                	<label style='color:white' for="tea">教&nbsp;&nbsp;&nbsp;师</label>
					<a href="#" class="forgot-w3layouts">忘记密码 ?请联管理员或相关老师！</a>
				<div class="submit-w3l">
					<input type="submit" value="登   录">
				</div>
				<p class="p-bottom-w3ls"><a href="signup.jsp">点击注册</a>如果你没有一个帐户</p>
			</form>
		</div>
		</div>
	<!-- copyright -->
	<div class="copyright w3-agile">
		<div class="copyright w3-agile">
		<p> © 2018 Internship Sign In & Sign Up Form . All rights reserved | Design by 
		<a href="http://www.highcom.com.cn/" target="_blank">highcom</a></p>
	</div>
	</div>
  </body>
</html>
