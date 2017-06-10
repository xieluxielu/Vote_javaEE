<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录失败</title>
<style type="text/css">
	body{
		background: url('/Vote/bg.jpg') no-repeat;
		background-size: 100%;
		font-size: 20px;
        color: #333;
	}
	.main{
		background-color: #D6C391;
		width: 880px;
		height:580px;
		margin: 50px auto;
		text-align: center;
		padding-top: 80px;
		line-height: 2em;
		box-sizing: border-box;
	}
	input[type='button'],input[type='submit'],input[type='reset']{
		background-color: #BBA073;
		border: none;
		color: #DECDAA;
		padding: 7px;
		cursor: pointer;
		font-size: 16px;
	}
	input[type='text'],input[type='password']{
		background-color:#DECDAA;
		border: none;
		margin-right: 8px;
		height: 30px;
		width: 300px;
		text-indent: 1em;
	}
	a{
		text-decoration: none;
		color: #333;
	}
	a:hover{
		text-decoration: underline;
	} 
	
	
</style>
</head>
<body>
<div class="main">
	<h1>登录失败！找不到该账号！</h1>
	<span id = "clock"></span>秒后自动跳转到<a href="login.jsp"><strong>登录</strong></a>界面......
</div>
<script type="text/javascript">
	var time = 3;
	function count() {	
		document.getElementById("clock").innerHTML = time;
		setTimeout(count, 1000);
		time--;
		if(time==(-1)){
			window.location.href="login.jsp";
		}
	}		
	count();
</script>
</body>
</html>