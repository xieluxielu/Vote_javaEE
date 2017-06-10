<%@page import="entity.voteproject"%>
<%@page import="dao.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>开始投票</title>
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
	<h1>开始投票</h1>

	<script type="text/javascript">  
		function test() {
			 var isVote = "<%=session.getAttribute("isVote") %>";  
		       if(isVote=="true")
		    	   {
		    	   		alert("此会话已经投过票了，无法再投！"); 
		    	   		return false;
		    	   }
		       else return true;
		}
       
       </script> 
	
	<%
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id")); 
		userDAO userdao = new userDAO();
		voteproject voteproject = userdao.getItem(id);
	%>
	<%
		String[] temp1 = voteproject.getVotenumber().split(",");
		String[][] temp2 = new String[temp1.length][2];
		for(int i = 0;i<temp1.length;i++){
			String[] temp3 = temp1[i].split("-");
				temp2[i][0]=temp3[0];
				temp2[i][1]=temp3[1];
		}
	%>

	<form action="servlet/dealVoteServlet?id=<%=id %>" method="post" onsubmit="return test();">
	<table>
		<tr style="color:#755316">
			<td ><%=voteproject.getTitle() %></td><td width="70"><%=voteproject.getUsername() %></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<%for(int i = 0;i<temp1.length;i++){ %>
		<tr>
			<td><%=temp2[i][0]%></td>
			<%if(voteproject.getVotetype().equals("1")) {%>
			<td><input type="radio" name="vote" value="<%=temp2[i][0]%>"></td>
			<%} %>
			<%if(voteproject.getVotetype().equals("2"))	{%>
			<td><input type="checkbox" name="vote"value="<%=temp2[i][0]%>"></td>
			<%} %>
		</tr>
		<%} %>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<%if(voteproject.getVotetype().equals("1")) {%>
			<td><input type="submit" value="投票" >（只能选择一个选项）</td>
			<%} %>
			<%if(voteproject.getVotetype().equals("2"))	{%>
			<td><input type="submit" value="投票">（可以选择多个选项，但是如果一个也没有选，则不提交）</td>
			<%} %>
		</tr>
	</table>
	</form>
</div>
</body>
</html>