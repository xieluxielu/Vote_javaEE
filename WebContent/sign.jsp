<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
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
<script type="text/javascript">

	var request = new XMLHttpRequest();
	function check() {
		var account = document.getElementById("account1").value;
		var url = "signServlet?account=" + account;
		request.open("GET",url,true);
		request.send(null);//get请求就发送null，post请求就发送参数
		request.onreadystatechange = function(){
			if(request.readyState == 4){//判断请求状态
				if(request.status = 200){//请求成功，开始处理响应
				document.getElementById("account2").innerHTML = request.responseText;
				}
				else{				
				}
			}
		}
	}


</script>
</head>
<body>
	<div class="main">
		<form action="servlet/signServlet" method="post">
			<table align="center" border="0">
				<tr>
					<td>账号：</td>
					<td>
						<input type="text" id="account1" name="account" onchange="check()">
					</td>
					<th><span id="account2"></span></th>
				</tr>
				<tr>
					<td>密码：</td>
					<td>
						<input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td>
						<input type="text"  name="username">
					</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<input type="text"  name="sex">
					</td>
				</tr>
				<tr>
					<td>电话：</td>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<td>学校：</td>
					<td>
						<input type="text" name="school">
					</td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr>
					<td colspan="2">
						<input type="submit"value="提交" >
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="重置">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>