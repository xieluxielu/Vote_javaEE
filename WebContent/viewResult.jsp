<%@page import="entity.voteproject"%>
<%@page import="dao.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>投票结果</title>
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
		padding-top: 50px;
		box-sizing: border-box;
	}
	table{
		margin: 10px 50px 50px 230px;
		width: 420px;
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
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO userdao = new userDAO();
		voteproject voteproject = userdao.getItem(id);
	%>
	<%
		int sum = 0;//总票数
		String[] temp1 = voteproject.getVotenumber().split(",");
		String[][] temp2 = new String[temp1.length][2];
		for(int i = 0;i<temp1.length;i++){
			String[] temp3 = temp1[i].split("-");
				temp2[i][0]=temp3[0];
				temp2[i][1]=temp3[1];
				sum+=Integer.parseInt(temp3[1]);
		}
	%>
	<table><!-- 显示投票的结果 -->
		<h2><%=voteproject.getTitle() %></h2>
		<%for(int i = 0;i<temp1.length;i++){ %>
		<tr>
			<td><%=temp2[i][0]%></td>
			<td><%=temp2[i][1]%>&nbsp;票</td>
		</tr>
		<%} %>
		<tr><td>&nbsp;</td></tr>
		<tr style="color:#755316"><td colspan="2">总票数:<%=sum %></td></tr>
		<tr style="color:#755316"><td>发起人：<%=voteproject.getUsername() %></td></tr>
		<tr style="color:#755316"><td>截止时间:<%=voteproject.getTime() %></td></tr>
	</table>
	<a href="/Vote/index.jsp">返回首页</a>
</div>
</body>
</html>