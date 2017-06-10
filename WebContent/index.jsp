<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="entity.voteproject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>投票网站</title>
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
		border-radius:5px;
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
		<h2>华南农业大学投票网站</h2>
		&nbsp;&nbsp;<a href="sign.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="login.jsp">登录</a><br><br>
		<form action="/Vote/servlet/findServlet" method="post">
		<input type="text" name="find" value=""><input type="submit" value="搜索">
		</form>
		<%		
			request.setCharacterEncoding("utf-8");
			userDAO userdao = new userDAO();
			ArrayList<voteproject> list = userdao.getAllvoteproject();
			int n = list.size();
			for(int i = 0;i<list.size()-1; i++){
				for(int j = i+1;j<list.size();j++){
					if(list.get(i).getTime().getTime()<list.get(j).getTime().getTime()){
						Collections.swap(list, i, j);
					}
				}
			}
		%>
		<table align="left">
			<thead>
				<th>投票主题</th>
				<th>发起人</th>
				<th>结束时间</th>
				<th>进入投票</th>
				<th>查看结果</th>
			</thead>
		<% for(int i = 0;i<list.size();i++){	%>
			<tr>
				<td><%=list.get(i).getTitle()%></td>
				<td><%=list.get(i).getUsername()%></td>
				<td>截止到<%=list.get(i).getTime().toString()%></td>
				<%if(list.get(i).getBan().equals("no")) {%>		
				<td><input type="button" value="进入投票" onclick="window.location.href('enterVote.jsp?id=<%=list.get(i).getId()%>')"></td>
				<%} %>
				<%if(list.get(i).getBan().equals("yes")) {%>		
				<td>已禁止投票</td>
				<%} %>
				<td><input type="button" value="查看结果" onclick="window.location.href('/Vote/viewResult.jsp?id=<%=list.get(i).getId()%>')"></td>
			</tr>
		<%} %>
		</table>
		<p style="margin-bottom: 0;font-size: 13px;color:#755316;">版权所有 &copy; yiying_wang</p>
	</div>
	
</body>
</html>