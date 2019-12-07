<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>用户登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
<%@
include
file="./css/login.css"
%>

</style>

<script type="text/javascript">
		if(window.parent != window){
			window.open('adminLogin.jsp', '_top');
		}
</script>
</head>

<body>
	<div id="header">
		<nav>
			<div class="shouye">
				<a href="servlet/MainPageServlet">Paper</a>
			</div>
		</nav>
	</div>
	<div class="login">
		<h2>用户登录</h2>
		<div class="login-top">
			<h1>登录窗口</h1>
			<form action="servlet/AdminLoginServlet" method="post">
				<input type="text" name="adminname" placeholder="username">
				<input type="password" name="adminpassword" placeholder="password">
				<div class="forgot">
					<div class="error">${error }</div>
					<input style="cursor: pointer" type="submit" value="登录">
				</div>
			</form>
		</div>
		<div class="login-bottom"></div>
	</div>
</body>
</html>
