<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
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
	<form action="servlet/loginServlet" method="post">
		<table align="center">
			<tr>
				<td>账号：</td><td><input type="text" name="account"></td>
			</tr>
			<tr>
				<td>密码：</td><td><input type="password" name="password"></td>
			</tr>
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</div>
	
</body>
</html>