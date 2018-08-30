<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>產品 │ Product</title>
<style type="text/css">

table	{width:1024;
	margin:0px auto;
	margin-top:0px;
	}
td	{
	width: auto;
	text-align: center;
	padding: 8px;
	font-size: 18px;}
td:first-child{
font-weight:bold;
width:100px;
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
.table td{
width:100px;
text-align: left;
padding:20px;
padding-left:50px;
font-size: 16px;
}
</style>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){

    $('#thedate').datepicker({
   	 		dateFormat: 'yy-mm-dd',
        minDate: 0  , //限制最小日期，從今天開始。過去不可選。
    });
				});
</script>
<script type="text/javascript">
function br(){

	var pno = document.getElementById("pno").value;
	document.getElementById("productno").value=pno;
	var custpinying=document.getElementById("custpinying").value;
	document.getElementById("dfrom").value=custpinying;
	var no=document.getElementById("dialogno").value;
	document.getElementById("no").value=no;
	
}
function order(){

	alert("預約成功!")
	
}
</script>
</head>
<body>
<%@ include file="a_nav.jsp" %> <div class="title">
<p style="text-align: center;">產品資料</p></div>

<table border="1" width="70%" >
<tr><td>產品名稱</td><td>價格</td><td>刊登者</td><td>地點</td><td>選擇預約日期</td><td></td></tr>
<form action="addorder.do" id="addorder" method="post">
<%
List<Map<String,Object>>list=(List<Map<String,Object>>)request.getAttribute("list");
	Map<String,Object> map; 
	if((list)!=null){
       for(int i=0;i<list.size();i++){
        map=list.get(i); %>
<tr>
<td><%=map.get("pname")%></td>
<td><%=map.get("price") %></td>
<td><%=map.get("custpinying") %></td>
<td><%=map.get("city") %><%=map.get("town") %></td><td>
<input style="width:85px" id="thedate" name="thedate" type="text" /></td>
 <td><input type="hidden" id="pno" name="pno" value="<%=map.get("pno") %>" >
 <input type="hidden" id="custpinying" name="custpinying" value="<%=map.get("custpinying") %>" >
 <input type="submit" value="我要預約" onclick="order()"></td>
 </tr> <%} }%>
 </table>
</form>


<%String  a=null,b=null,c=null;%>
<br><br><br><br>
<h2 style="text-align: center;">問與答</h2>
<table class="table" style="width:55%" >

<%List<Map<String, Object>> slist = (List<Map<String, Object>>) request.getAttribute("slist");
Map<String, Object> map1;
if(slist!=null){%>
	<% for (int i = 0; i < slist.size(); i++) {
		   map1=slist.get(i);%>
	<tr bgcolor="#bae7f4"><td>問題<%=i+1 %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="color:#224b56"><%=map1.get("dfrom")%></a>
	<br><br><%=map1.get("message")%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%=map1.get("date")%>&nbsp;&nbsp;
		
	<%if("0".equals(map1.get("ans"))){ 
	if(Integer.parseInt(request.getAttribute("decide").toString())==1){%>
	<form id="updateans" action="updateans.do" method="post" >
	<input type="hidden" id="pn" name="pn"value="<%=map1.get("productno")%>">
	<input type="hidden" id="dialogno" name="dialogno"value="<%=map1.get("no")%>">
	<input type="text" id="ans" name="ans">
	<input type="submit" value="回復" >
<%String msg=request.getAttribute("msg").toString();
out.print(msg); %><%}}%></td></tr></form>
	

	<tr ><td>賣家回覆:</td></tr>
	<tr>
	<% if("0".equals(map1.get("ans"))){%>
	<td style="font-size:8px;color:#e22882">賣家還尚未回覆</td></tr>
<%}else{%><td><%=map1.get("ans")%></td></tr>
	<% }} } %>
	
	<form id="insertdialog" action="insertdialog.do" method="post" >
	<tr><td style="text-align: center;" >
			 <input type="hidden" id="productno" name="productno"value="">
			<input type="hidden" id="dfrom" name="dfrom"value="">
			<input type="hidden" id="no" name="no"value="">
			
	<textarea id="message" name="message" cols="40" rows="5" ></textarea></td></tr>
	<tr><td style="text-align: center;" ><input type="submit" value="我要提問" onclick="br()"></form></td></tr>
</table>

 <%@ include file="footer.jsp" %>
</body>

</html>