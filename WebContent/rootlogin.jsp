<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<title>管理系統-管理者登入</title>
<%
	/*if(request.getSession().getAttribute("root_name")!=null){
		try{
			response.sendRedirect("selectroot_list.do");
		}catch(Exception e){
			System.out.println(e);
		}
	}*/
%>

<style type="text/css">
.addmember {
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:40px;
margin-bottom:-70px; 

}
</style>
</head>
<body>
	<div class="title">管理者登入</div>
			<%
							String username = "";
			                       
								Cookie[] cookies=request.getCookies();
								if(cookies!=null&&cookies[0].getValue().length()<20){
								username = cookies[0].getValue();
								 System.out.println(request.getAttribute("usname"));
								if(request.getAttribute("usname")!=null){
								    username=(String)request.getAttribute("usname");
								    System.out.println(username);
								}
								}
								
								%>
			
				<%
					if(request.getAttribute("msg")!=null){
					out.println(request.getAttribute("msg"));
					}
				%>	
			</div>
			<form action="selectroot.do" method="post">
				<table border="1">
					<tr>
						<td>帳號:<input type="text" name="root_name" value="<%=username%>"></td>
						
					</tr>
					<tr>
						<td>密碼:<input type="text" name="root_pwd" id="root_pwd" class="password"></td>	
					</tr>
					
					<tr>
						
						<td>
							<input class="btn" type="submit" value="登入">
						</td>
					</tr>
				</table>
			</form>
		
</body>
</html>