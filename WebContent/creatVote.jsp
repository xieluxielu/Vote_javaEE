<%@page import="entity.voteproject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.user"%>
<%@page import="dao.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发起一项投票</title>
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
		padding-top: 20px;
	}
	table{
		margin: 10px 150px;
		width: 680px;
		text-align: left;
		line-height: 2em;
	}
	input[type='button'],input[type='reset'],input[type='submit']{
		background-color: #BBA073;
		border: none;
		color: #DECDAA;
		padding: 7px;
		cursor: pointer;
		font-size: 16px;
	}
	input[type='text']{
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
	.in_date input{
		width: 70px;
	} 
	
	
</style>
</head>
<body>
<div class="main">
	<%	
		request.setCharacterEncoding("utf-8");
		String account = request.getParameter("account"); 
		userDAO userdao = new userDAO();
		user user = userdao.getUser(account);//user是这个发起人
	%>
	<h1><%=user.getUsername() %></h1>
	<form action="/Vote/servlet/creatVoteServlet?account=<%=account %>" method="post">
		<table align="left" >
		<tr>
			<td>主题：</td><td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>发起人：</td><td><input type="text" name="username" value="<%=user.getUsername()%>"></td>
		</tr>
		<tr class="in_date">
			<td>截止时间：</td><td><input type="text" name="year" value="2017" size="4">年<input type="text" name="month"size="4">月<input type="text" name="day"size="4">日</td>
		</tr>
		<tr>
			<td>投票类型：</td><td><input type="radio" name="votetype" value="1">单选<input type="radio" name="votetype" value="2">多选</td>
		</tr>
		<tr>
			<td>多个投票项：</td><td><input type="text" name="votenumber" size="55">（用‘，’隔开）</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="发起投票">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置信息"></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>