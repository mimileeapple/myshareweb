<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聯絡客服|Contact</title>
<style type="text/css">

.imgcaption	{text-align: center;
	font-size: 0.875em;
	padding: 10px;
	margin-left: auto;
	margin-right: auto;
	margin-top:15px;
	margin-bottom: 15px;}

.imgcaption img	{margin-bottom: 10px;}

.imgcaption p	{margin: 0;}

table	{width:1024;
	margin:0px auto;
	}

th	{width: auto;
	padding: 8px;
	background-color: #b8e964;
	font-size: 0.875em;
	text-align: center;}

td	{
	width: 250;
	text-align: center;
	padding: 8px;
	font-size: 18px;
	color:#6bb2b1;}
td a{
text-decoration:none;
color:#6bb2b1;
}
td a:hover{
color:#8de8e6;
}
.title p{
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:58px;
margin-bottom: 5px;

}
.dis p{
text-align: center;
color:#5c6363;
font-weight:bold;
font-face:微軟正黑體;
font-size:18px;
margin-bottom: 5px;

}
#myform label	{display: block;
	margin-bottom: 3px;
	font-size: 0.875em;}
#col {
	width:auto;
		line-height:200px;
        background-color:#bfc1c1;
      }
.t input{
	width:210px;
	height:30px;
	text-align: left;
}
.t input p{
	text-align: right;
}

</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 
  <div class="title"><p>CONTACT</p></div>

<div class="dis"><p>請留下您的聯絡方式，並利用客服信箱與我們聯繫，我們將會有專人為您處理相關問題。</p>
<form method="post" action="insertcontact.do" >
<div class="t">
<table>
<tr>
<td ><p>Name</p></td><td><input type="text" id="name" name="name"  placeholder="Name"/></td>
</tr>

<tr>
<td><p>E-mail</p></td><td><input type="text" id="email" name="email"  placeholder="E-mail"/></td>
</tr>

<tr>
<td><p>Subject</p></td><td><input type="text" id="subject" name="subject" placeholder="Subject"/></td>
</tr>

<tr>
<td><p> Phone</p></td><td><input type="text" id="phone" name="phone"placeholder="Phone"/></td>
</tr>


<tr>
<td><p>Address</p></td><td><input  type="text" id="address" name="address" placeholder="Address"/></td>
</tr>

<tr>
<td><p>Massage</p></td><td><textarea id="message" name="message" cols="50" rows="10" placeholder="Massage"></textarea></td><br>
</tr>

 <input type="hidden" name="date" value="<%=request.getAttribute("date")%>" >
 <tr>
<td></td><td><input type="submit" value="送出" id="submit" onclick="disp_alert()" style="text-align:center;"/></td>
</tr>


</table>
</form> 
<div class="imgcaption">
<img src="image/footerpic01.png" width="75%" height="75%" />

</div>
</div>
	<%@ include file="footer.jsp" %>
</body>
</html>