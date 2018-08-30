<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理頁面-查詢留言</title>
</head>
<body>
<%
    List<Map<String,Object>>list=(List<Map<String,Object>>)request.getAttribute("list");
%>

<% Map<String,Object> map; %>
<table border="1" width="100%">
<tr>
<td>編號</td><td>日期</td><td>姓名</td><td>email</td><td>科目</td>
<td>電話</td><td>地址</td><td>留言</td>

</tr>
 <% if((list)!=null)
                for(int i=0;i<list.size();i++){
                 map=list.get(i);      
 %>
 
 
<tr>
<td><%=map.get("contact_no")%></td><td><%=map.get("date")%></td><td><%=map.get("name")%></td><td><%=map.get("email")%></td><td><%=map.get("subject")%></td>
<td><%=map.get("phone")%></td><td><%=map.get("address")%></td><td><%=map.get("message")%></td>
  
</tr>

<%}%>
</table>

</body>
<script>
            function doDel(no){
                document.getElementById("delete").value=no;
                document.getElementById("delForm").submit();
            }
           
        </script>  
</html>