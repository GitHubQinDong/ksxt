<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<title>大学生问卷调查系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link href="css/main.css" rel="stylesheet" type="text/css" />
	<link href="css/test.css" rel="stylesheet" type="text/css" />    
</head>
<body>
<div class="main">
<div class="test_main">
 <form action="user" method="post">
  <div class="nr_left">
   <div class="test">
     <div class="test_content">
     <div class="test_content_title">
		<h2>选择题</h2>
		<p><span>共</span><i class="content_lit">30</i><span>题 </span><%--<span>合计</span><i class="content_fs">60</i><span>分</span></p>--%>
	 </div>
	 </div>
	 <div class="test_content_nr">
	 <ul>
	  <c:forEach var="i" items="${sc }" varStatus="vs">
	  <li id="qu_0_${vs.index }">
		<div class="test_content_nr_tt">
			<i>${vs.count }</i><font>${i.title }</font>
		</div>
		<div class="test_content_nr_main">
		<ul>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="a" id="0_answer_${vs.count }_option_1"/>
				<label for="0_answer_${vs.count }_option_1">A.<p class="ue" style="display: inline;">${i.optionA }</p>
				</label>
			</li>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="b" id="0_answer_${vs.count }_option_2"/>
				<label for="0_answer_${vs.count }_option_2">B.<p class="ue" style="display: inline;">${i.optionB }</p>
				</label>
			</li>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="c" id="0_answer_${vs.count }_option_3"/>
				<label for="0_answer_${vs.count }_option_3">C.<p class="ue" style="display: inline;">${i.optionC }</p>
				</label>
			</li>
			<c:if test='${i.optionD!=null }'>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="d" id="0_answer_${vs.count }_option_4"/>
				<label for="0_answer_${vs.count }_option_4">D.<p class="ue" style="display: inline;">${i.optionD }</p>
				</label>
			</li>
			</c:if>
			<c:if test='${i.optionE!=null }'>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="e" id="0_answer_${vs.count }_option_5"/>
				<label for="0_answer_${vs.count }_option_5">E.<p class="ue" style="display: inline;">${i.optionE }</p>
				</label>
			</li>
			</c:if>
			<c:if test='${i.optionF!=null }'>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="f" id="0_answer_${vs.count }_option_6"/>
				<label for="0_answer_${vs.count }_option_6">F.<p class="ue" style="display: inline;">${i.optionF }</p>
				</label>
			</li>
			</c:if>
			<c:if test='${i.optionG!=null }'>
			<li class="option">
				<input type='${i.type==0?"radio":"checkbox" }' class="radioOrCheck" name="answer${vs.count }" value="g" id="0_answer_${vs.count }_option_7"/>
				<label for="0_answer_${vs.count }_option_7">G.<p class="ue" style="display: inline;">${i.optionG }</p>
				</label>
			</li>
			</c:if>
		</ul>
		</div>
	</li>
	</c:forEach>
	</ul></div>
	<div class="test_content">
		<div class="test_content_title">
			<h2>简答题</h2>
			<p><span>共</span><i class="content_lit">4</i><span>题</span>
			</p>
		</div>
	</div>
	<div class="test_content_nr">
	  <ul>
		<c:forEach var="i" items="${sb }" varStatus="vs">	
			<li id="qu_1_${vs.index }">
				<div class="test_content_nr_tt">
					<i>${vs.count }</i><font>${i.title }</font>
				</div>
				<div class="test_content_nr_main">
					<textarea style="resize:none" rows="5" cols="90" name="brief${vs.count }"></textarea>
				</div>
			</li>
		</c:forEach>
	   </ul>
 	  </div>
  	 </div>
 	</div>
	<div class="nr_right">
		<div class="nr_rt_main">
			<div class="rt_nr1">
				<div class="rt_nr1_title">
					<h1>答题卡</h1><p class="test_time"><b class="alt-1">01:40</b></p>
				</div>
				<div class="rt_content">
					<div class="rt_content_tt">
						<h2>选择题</h2><p><span>共</span><i class="content_lit">30</i><span>题</span></p>
					</div>
					<div class="rt_content_nr answerSheet">
						<ul>
							<c:forEach begin="0" end="29" var='i'>
								<li><a href="#qu_0_${i }">${i+1 }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="rt_content">
					<div class="rt_content_tt">
						<h2>简答题</h2><p><span>共</span><i class="content_lit">4</i><span>题</span></p>
					</div>
					<div class="rt_content_nr answerSheet">
						<ul>
							<c:forEach begin="0" end="3" var='i'>
								<li><a href="#qu_1_${i }">${i+1 }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="rt_nr1_title test_title">
					<font><input type="submit" name="method" value="交卷" onclick="return confirm('是否确认提交？')" ></font>
				</div>
			</div>
		</div>
	</div>
  </form>
 </div>
</div>
</body>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.easy-pie-chart.js"></script>
<script src="js/jquery.countdown.js"></script>
<script>
	window.jQuery(function($) {
		"use strict";
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
	});
	$(function() {
		$('li.option label').click(function() {
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			if(!cardLi.hasClass('hasBeenAnswer')){// 设置已答题
				cardLi.addClass('hasBeenAnswer');
			}
		});
	});
</script>
</html>
