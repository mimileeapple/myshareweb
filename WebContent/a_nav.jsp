<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*"%> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">   

      
<% 
	String url=request.getRequestURI();
	String[] u=url.split("/");
%>

 


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-tw" lang="zh-tw">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <meta name="viewport" content="width=device-width;initial-scale=1.0;
maximum-scale=1.0;user-scalable=0;"></meta>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
/* ==================== layout ==================== */
@CHARSET "UTF-8";

/*整個上面，選單上面那整塊*/
#container	{width: auto;
	margin-top: auto;}
/* ====================最上面   會員登入的地方 ==================== */
#header	{width: auto;

	height: 65px;
	border: none;}
#header_title	{
float: left;
margin-left:140px;}
/*header_other 會員登入那塊*/
#header_other	{

	float: right;
	margin-top: 100px;
	margin-left:5px ;
	width: 50%;
	/*background-color:red;*/}
#header_other a{color:black;}
#header_other a:hover	{color:#2db7b3;}

/*四個選單的CSS*/
#nav	{
	width: auto;
/*background-color:yellow;*/
	height: 28px;
	font-size: 20px;
	padding:5px 180px;
	clear: both;
	margin-top: 5px;}
#nav ul	{margin: 0;
		padding: 0;}
#nav li	{
list-style-type: none;
	float: left;
	width: 25%;}
#nav li a	{display: block;
	width: auto;
	line-height: 28px;
	border-right: solid 1px #aaaaaa;
	color: #000000;
	text-align: center;
	text-decoration: none;}
#nav li a:hover	{background-color:#7bd1cf;
color:white;}
#nav li a span.show{display: inline;}    /* 預設中文顯示、英文隱藏 */
#nav li a span.hide {display: none;}
#nav li a:hover span.hide {display: inline;} /* OnMouseOver 時顯示英文、隱藏中文 */
#nav li a:hover span.show {display: none;}


</style>
</head>
<body>
	<%if(request.getSession().getAttribute("custpinying")!=null){//有帳號登入
				%>
			<b>親愛的 ${custpinying}您好</b>
				<a href="member-center.jsp">
				會員中心</a>
	 			<a href="logout.do">登出</a>	<%} 
			else{%>
				<a href="member-addmember.jsp">註冊</a>
				<a href="member-login.jsp">
				會員登入</a><% } %>
			
 <div id="container">
	<div id="header">
		<div id="header_title">
			<a href="index.jsp"><img src="image/logo1.png" alt="*" title="" class="imgleft" width="52%" height="37%" /></a>
		</div>
		
	</div>
</div>
<!-- head結束 -->
<!-- nav選單開始 -->
<div id="nav">
	<ul>
		<li><a href="index.jsp"><span class="show"><b>首頁</b></span><span class="hide"><b>Home</b></span></a></li>
		<li><a href="sale.jsp"><span class="show"><b>特賣</b></span><span class="hide"><b>Sale</b></span></a></li>
		<li><a href="s_add.jsp"><span class="show"><b>上架</b></span><span class="hide"><b>Added </b></span></a></li>
		<li><a href="search.jsp"><span class="show"><b>搜尋 </b></span><span class="hide"><b>Search</b></span></a></li>
	</ul>
</div>
<!-- nav結束 -->
 
   

</body>
</html>