<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的預約資料|My Orderlist</title>
<style type="text/css">

table	{width:auto;
	margin:0px auto;
	margin-top:0px;
	}
td	{
	width: 100px;
	text-align: center;
	padding: 8px;
	font-size: 18px;}
td:first-child{
font-weight:bold;
width:50px;
}
.title p{
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:38px;
margin-bottom:10px;
margin-top:15px;
}

input{
	width:300px;
	height:40px;
	text-align: left;
}

</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 
<div class="title"><p>My OrderList│我的預約資料</p>
<HR  size="2" width="78%" style="margin-bottom:15px;"></div>
<table border="3">
<tr><td>編號</td><td>產品編號</td><td>下單日期</td><td>類型</td>
<td>產品名稱</td><td>價格</td><td>地點</td><td>預約日期</td><td>上架日期</td><td>上架人</td></tr>
		<%	List<Map<String, Object>> list =(List<Map<String, Object>>)request.getAttribute("list");
			if(list!=null){ 
				for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map=list.get(i);%> 
	
	
	<tr><td><%=i+1 %></td><td><%=map.get("pno")%></td><td><%=map.get("orderdate")%></td><td><%=map.get("pclass")%></td>
	<td><a href="selectproductmain.do?pno=<%=map.get("pno") %>"><%=map.get("pname")%></a></td><td><%=map.get("price")%></td>
	<td><%=map.get("city")%><%=map.get("town") %></td><td><%=map.get("senddate")%></td>
	<td><%=map.get("adddate")%></td>
	<td><%=map.get("user")%></td></tr>
	
	<%}} %>
	
	</table>
	 <%@ include file="footer.jsp" %>
</body>
</html>