<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page import ="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜尋產品|Search</title>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script language=JavaScript>
function br(){

	var town = document.getElementById("townselect").value;
	document.getElementById("town").value=town;
	}
</script>
<script language=javascript src=js/address.js></script>
<style type="text/css">

table	{width:1024;
	margin:0px auto;
	margin-top:0px;
	}
td	{
	width: 300px;
	text-align: center;
	padding: 8px;
	font-size: 18px;}
td:first-child{
font-weight:bold;
width:150px;
text-align: right;
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
<%request.setCharacterEncoding("UTF-8");%>
<div class="title"><p>搜尋產品</p></div>

<table border="1">
<tr><td>縣市:</td>
<td><FORM name=regstep>
	<SELECT style="height:30px;width:170px;" id="cityselect"
	onchange=Buildkey(this.options[this.options.selectedIndex].value); size=1 
	name=new> <OPTION value=0 selected>請選擇縣市...</OPTION> <OPTION 
	value=1>臺北市</OPTION> <OPTION value=2>基隆市</OPTION> <OPTION 
	value=3>新北市</OPTION> <OPTION value=4>宜蘭縣</OPTION> <OPTION 
	value=5>新竹縣市</OPTION> <OPTION value=6>桃園縣</OPTION> <OPTION 
	value=7>苗栗縣</OPTION> <OPTION value=8>臺中市</OPTION> <OPTION 
	value=9>臺中縣</OPTION> <OPTION value=10>彰化縣</OPTION> <OPTION 
	value=11>南投縣</OPTION> <OPTION value=12>嘉義縣市</OPTION> <OPTION 
	value=13>雲林縣</OPTION> <OPTION value=14>臺南市</OPTION> <OPTION 
	value=15>臺南縣</OPTION> <OPTION value=16>高雄市</OPTION> <OPTION 
	value=17>高雄縣</OPTION> <OPTION value=18>澎湖縣</OPTION> <OPTION 
	value=19>屏東縣</OPTION> <OPTION value=20>臺東縣</OPTION> <OPTION 
	value=21>花蓮縣</OPTION> <OPTION value=22>金門縣</OPTION> <OPTION 
	value=23>連江縣</OPTION> <OPTION value=24>南海諸島</OPTION> <OPTION 
	value=25>釣魚台列嶼</OPTION></SELECT> </td></tr>
	<tr><td>區域:</td><td>
	<SELECT style="height:30px;width:170px;" onchange=document.regstep.code.value=this.options[this.options.selectedIndex].value; size=1 name=address> 
	<OPTION value="" selected>請選擇區域</OPTION></SELECT> 
	<INPUT type="hidden" id="townselect" size=5 name=code></FORM>
</td></tr>
<tr><td>關鍵字:</td><td>
       <form action="selectproduct.do" id="selectproduct" method="post">
       <input  type="hidden" id="city" name="city" value="0"/>
       <input type="hidden" id="town" name="town" value="0"/>
       <input style="height:30px;width:200px;" type="text" id="pname" name="pname" value=""/>

</td></tr>
       <tr><td></td><td>
<input style="height:30px;width:150px;text-align:center"type="submit" value="送出"  onclick="br();">
</td></tr></form>
</table >
<table style="width:70%"border="1">

<%List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
Map<String, Object> map;

if(list!=null){ 
	%><tr><td>編號</td>
	<td>種類</td>
	<td>產品名稱</td>
	<td>價格</td>
	<td>描述</td>
	<td>所在地</td></tr>
	<% for (int i = 0; i < list.size(); i++) {
		   map=list.get(i);
	%>
	
	<tr><td><%=i+1 %></td>
	<td><%=map.get("pclass") %></td>
	<td><a href="selectproductmain.do?pno=<%=map.get("pno") %>"><%=map.get("pname") %></a></td>
	<td><%=map.get("price") %></td>
	<td><%=map.get("discription") %></td>
	<td><%=map.get("city") %><%=map.get("town") %></td>
	</tr>
	<%}} %>
</table>
<%@ include file="footer.jsp" %>
</body>
 
</html>