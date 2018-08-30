<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改會員資料|Update</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<style type="text/css">

.title p{
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:38px;

}

.upcust td.first{
width:200px;
}
.upcust td{
text-align:left;
}
.upcust form.input{
width:300px;
}
</style>
</head>
<body>
<div class="box">
<%//**更改會員資料 兩個密碼目前還沒比對，以及新增所有的資料更改 %>
	<%@ include file="a_nav.jsp" %>
	
 <div class="title"><p>修改會員資料</p></div>
 <HR  size="2" width="78%" style="margin-bottom:15px;"></div>
<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;親愛的${custnick}你好!│會員帳號:${custpinying}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

<a href="member-center.jsp">回會員中心</a>
	<div class="main">
		<div class="list">
		
			<form id="updateCustSend" action="updateCustSend.do" method="post">
			<div class="upcust">
				<table border="2">
					
					<tr>
						<td>密碼:</td>
						<td><input style="width:300px"id="custpwd" type="text" name="custpwd" value="${custpwd}"></td>
					</tr>
					
				  	<tr>
						<td>會員暱稱:</td>
						<td><input style="width:300px" id="custnick" type="text" name="custnick" value="${custnick}"></td>
					</tr>
					
						<tr>
						<td>電子郵件信箱:</td>
						<td><input style="width:300px"  id="mail" type="text" name="mail" value="${mail}"></td>
					</tr>	
					
					<tr>
						<td></td>
						<td><input class="btn" type="submit" value="送出"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>