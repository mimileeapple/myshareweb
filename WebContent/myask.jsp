<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>問與答|Ask&Ans</title>
<style type="text/css">

.title p{
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:24px;
margin-bottom:-5px;

}
.blue a:hover	{
color:#65a09f;

}
table{

margin:0px auto;
margin-right:230px
}
td{
height:30px;}
</style>
</head>
<body>
<%@ include file="a_nav.jsp" %>
 <div class="title">
<%List<Map<String,Object>>list=(List<Map<String,Object>>)request.getAttribute("list");
 %>
<p style="text-align: center;height:65px;">待處理問與答(<%=list.size()%>)</p>

<table border="1" width="70%" style="text-align: center;">
<tr><td>產品編號</td><td>日期</td>
<td>產品名稱</td><td>提問人</td><td>提問內容</td><td>請回覆</td></tr>
<%
Map<String,Object> map; 
	
	if((list)!=null){
       for(int i=0;i<list.size();i++){
        map=list.get(i); %>
<tr>
<td><%=map.get("productno")%></td>
<td><%=map.get("date")%></td>
<td><a href="selectproductmain.do?pno=<%=map.get("pno") %>"><%=map.get("pname")%></a></td>
<td><%=map.get("dfrom")%></td><td><%=map.get("message")%></td>
<td><%if("0".equals(map.get("ans"))){ 
	if(Integer.parseInt(request.getAttribute("decide").toString())==1){%>
	<form id="updateans" action="updateans.do" method="post" >
	<input type="hidden" id="pn" name="pn"value="<%=map.get("productno")%>">
	<input type="hidden" id="dialogno" name="dialogno"value="<%=map.get("no")%>">
	<input type="text" id="ans" name="ans">
	<input type="submit" value="回復" ></form><%}} %>
</td>
 </tr> <%} }%>

 </table>
 
 
 
 
<%String msg=request.getAttribute("msg").toString();
out.print(msg); %>

<%List<Map<String,Object>>mylist=(List<Map<String,Object>>)request.getAttribute("mylist"); 
Map<String,Object> map1; 
%>
<p style="text-align: center;">我的發問紀錄(<%=mylist.size()%>)</p>
<br><br>
<table border="1" width="70%" height="65%"style="text-align: center;">
<tr><td>產品編號</td><td>日期</td>
<td>產品名稱</td><td>提問人</td><td>提問內容</td><td>回復</td></tr>

<% if((mylist)!=null){
       for(int i=0;i<mylist.size();i++){
        map1=mylist.get(i);%>


<tr>
<td><%=map1.get("productno")%></td>
<td><%=map1.get("date")%></td>
<td><a href="selectproductmain.do?pno=<%=map1.get("pno") %>"><%=map1.get("pname")%></a></td>
<td><%=map1.get("dfrom")%></td>
<td><%=map1.get("message")%></td>
<% if("0".equals(map1.get("ans"))){%>
<td style="font-size:8px;color:blue"><b><i>賣家還尚未回覆</i></b></td>
<%}else{%><td><%=map1.get("ans")%></td><% }}} %>


</tr></table></div>

 <%@ include file="footer.jsp" %>

</body>

</html>