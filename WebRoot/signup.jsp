<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
	<script  src="js/jquery-1.11.3.min.js"></script>
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
		<a href="index.jsp">登录</a><a href="#" class="active">注册</a>
	</div>
	<h1>大学生在线问卷调查</h1>
	<div class="main-agileits">
		<div class="form-w3-agile">
			<h2 class="sub-agileits-w3layouts">注&nbsp;&nbsp;&nbsp;册</h2>
			<form action="user" method="post" onsubmit="return xmky">
					<input type="hidden" name="method" value="zhuce">
					<input type="text" name="name" onkeyup="jy(this)" placeholder="用户名" required id='name'/>
					<input type="password" name="pwd" placeholder="密码" required />
					<!-- <input type="password" name="Password" placeholder="确认密码" required=""  -->
				<div class="submit-w3l">
					<input type="submit" value="注 &nbsp;&nbsp;&nbsp;册">
				</div>
			</form>
		</div>
		</div>
	<!-- copyright -->
	<div class="copyright w3-agile">
		<p> © 2018 Internship Sign In & Sign Up Form . All rights reserved | Design by 
		<a href="http://www.highcom.com.cn/" target="_blank">highcom</a></p>
	</div>
  </body>
  <script type="text/javascript">
  var xmky=false; //姓名可用状态
  function jy(obj){
  	$.post('user',{method:'jiaoyan',name:obj.value}, function(data) {
  		if(data=='true'){
  			$('#name').attr('style','color:red');
  			xmky=false;
  		}else{
  			$('#name').attr('style','color:white');
  			xmky=true;
  		}
  	})
  }
  </script>
</html>
