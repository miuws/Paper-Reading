<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户界面left</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
<%@
include
 
file="./css/adminLeft.css"%>
</style>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$(".menu .span").click(function(){
				$(this).next().slideToggle("slow");
			});

			$("ul li").click(function(){
				$(this).css("background-color","#0066ee");
				$("ul li").not(this).css("background-color","#ddeeff");
			});
		});
	</script>
</head>

<body>
	<div class="menu">
		<a href="adminIndex.jsp" target="rightFrame"> <span class="span1">
				<img src="./images/lefticon01.png" /> <span class="title">首页</span>
		</span>
		</a>
		<div class="span">
			<img src="./images/lefticon01.png" />
			<div class="title">paper</div>
		</div>
		<ul>
			<li><a href="paper.jsp" target="rightFrame">Paper&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
		<div class="span">
			<img src="./images/lefticon01.png" />
			<div class="title">Samples</div>
		</div>
		<ul>
			<li><a href="servlet/AdminShowNewsServlet" target="rightFrame">Samples&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
		<div class="span">
			<img src="./images/lefticon01.png" />
			<div class="title">Statistics</div>
		</div>
		<ul>
			<li><a href="servlet/AdminShowResumeServlet" target="rightFrame">Statistics</a></li>
		</ul>
		
	</div>
</body>
</html>
