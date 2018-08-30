<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page import ="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>忘記密碼 / Forgot Password</title>
<style type="text/css">
.addmember {
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:40px;
margin-bottom:-30px; 
margin-top:-10px; 
}
a{color:#4f4b4c;
font-size:16px;
}
a:hover{
	color:#85c1bf;
}

table td:first{
text-align:right;
}
table td{
text-align:left;
}
input.text{
width:150px;
height:20px;
}
</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 
	
	<div class="main">
		<div class="list">
			<div class="addmember">忘記密碼 / Forgot Password</div>
			<br>
			<br>
		<br>
		<table style="width:50%">
		<form id="forget" action="forget.do"method="post">
		<tr><td>請輸入帳號:</td>
		<td><input class="text"type="text" id="custpinying" name="custpinying"></td>
		</tr>
		
		<tr><td>請輸入mail:</td>
		<td><input class="text"  type="text" id="mail" name="mail"></td>
		</tr>
		<tr><td style="text-align:center" ></td><td>&nbsp;&nbsp;&nbsp;&nbsp;
		<input style="height:30px;width:100px;text-align:center"type="submit" value="送出"  ></td></tr>
		</form>
		</table>
		
		<table>
<tr><td style="text-align:center">

		<p  style="color:red;">${custpwd}</p></td></tr></table>
		
		</div></div>
<%@ include file="footer.jsp" %>
</body>
</html>