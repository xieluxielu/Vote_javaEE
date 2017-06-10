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
<title></title>
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
		margin: 50px 100px;
		width: 680px;
		text-align: left;
	}
	input[type='button'],input[type='submit']{
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
	
	
</style>
</head>
<body>
<div class="main">
	<%	
	request.setCharacterEncoding("utf-8");
		String account = request.getParameter("account"); 
		userDAO userdao = new userDAO();
		user user = userdao.getUser(account);
	%>
	<h1><%=user.getUsername() %>，欢迎您！</h1>
	<%		
		ArrayList<voteproject> list = userdao.getUservoteproject(user.getUsername());
	%>
	<table align="left">
	<% for(int i = 0;i<list.size();i++){%>
		<tr>
			<td><%=list.get(i).getTitle()%></td>
			<td><%=list.get(i).getUsername()%></td>
			<td>截止到<%=list.get(i).getTime().toString()%></td>
			<td><input type="button" value="查看结果" onclick="window.location.href('/Vote/UserviewResult.jsp?id=<%=list.get(i).getId()%>&account=<%=account%>')"></td>
			<td><input type="button" value="禁止投票" onclick="window.location.href('/Vote/servlet/banVoteServlet?id=<%=list.get(i).getId()%>&ban=yes&account=<%=account%>')"></td>
			<td><input type="button" value="取消禁止投票" onclick="window.location.href('/Vote/servlet/banVoteServlet?id=<%=list.get(i).getId()%>&ban=no&account=<%=account%>')"></td>
		</tr>
	<%} %>
	</table>
	<br><br><a href="/Vote/Userindex.jsp?account=<%=request.getParameter("account")%>">返回首页</a>
</div>
</body>
</html>