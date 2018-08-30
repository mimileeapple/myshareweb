<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心|MemberCenter</title>
<style type="text/css">

.title p{
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:38px;
margin-bottom:-5px;

}
.blue a:hover	{
color:#65a09f;

}
table{
margin:0px auto;
margin-right:230px
}
</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 
<div class="title"><p>Member Center 會員中心</p>
<HR  size="2" width="78%" style="margin-bottom:15px;"></div>
<div class="blue">

<table >

  <tr>
  <td><a href="selectmyproduct.do">我的上架查詢</a></td>
   <td><a href="selectmyorder.do">&nbsp;/&nbsp;我的預約查詢&nbsp;</a></td>
    <td><a href="selectdialogmain.do">&nbsp;/&nbsp;我的問與答&nbsp;</a></td>
  <td><a href="updateCust.do">&nbsp;/&nbsp;修改個人資料及密碼&nbsp;</a> </td> 
  <td><a href="contact.jsp">&nbsp;/&nbsp;聯絡客服&nbsp;</a></td>
  <td><a href="logout.do"">&nbsp;/&nbsp;登出&nbsp;</a></td><tr>
	
	</div></table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>