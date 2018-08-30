<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>會員登入 | Login</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="http://connect.facebook.net/zh_TW/all.js"></script>
<style type="text/css">
.addmember {
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:40px;
margin-bottom:-30px; 
margin-top:-10px; 
}
a{color:#4f4b4c;
font-size:16px;
}
a:hover{
	color:#85c1bf;
}
.main .list .cust_no_msg{
	text-align:center;
	font-size:24px;
	padding: 20px 0px;
}
</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 
<div id="fb-root"></div>  <!-- 一定要加 -->
<script type="text/javascript">
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1991064287881035}',
      
      xfbml      : true,
      version    : '{v2.11}'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=1991064287881035";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  </script>
  <script>
 // var fbToken;
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
  
    });
  }
  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	    FB.login(function(response) {
	    	   console.log(response);
	    	}, {scope: 'email,publish_stream'
	    		});
	});
  
  function statusChangCallback(response){
	  if(response.status=='connected'){
		  fbToken=response.authResponse.accessToken;
		     FB.api('/me', function (response) {
		    	  
		    	 

         });
		  getUserInfo();}
	  else if(response.status=='not_authorized'){
		  console.log('facebook未經授權');
	  }
	  else{
		  console.log('不是登入到FB.不知道是否授權');
	  }    
	 
  }
  
  function getUserInfo(){
	  
  FB.api('/me','GET', {"fields":"id,name,email,birthday"}, function(response) {
	    //CheckPlayer(response.id, response.name, response.email, response.birthday);
	    console.log(JSON.stringify(response));
        document.getElementById("myid").value = response.id ;
        document.getElementById("myname").value =response.name ;
        document.getElementById("mail").value = response.email ;
        document.getElementById("brithday").value = response.birthday ;
       // alert("uid:"+ uid+", cname: "+name+", email: "+email+", birthday:"+ birthday );
	    //console.log('Successful ogin for;'+response.name);
	    //self.location='/home/login.fbLogin.do?me?fields=id,name,email,birthday&accessToken='+fbToken;
        document.getElementById("fblogin").submit();
	   });
  }
 
 
</script>
	<div class="main">
		<div class="list">
			<div class="addmember">SIGN IN 會員登入</div>
			<br>
			<div class="cust_no_msg" style="color:red;">
				<%
					if(request.getAttribute("msg")!=null){
						out.println(request.getAttribute("msg"));}	%>	
			</div>
		
			<table>
			<form action="selectCust.do" method="post">
		<tr>
			<td style="text-align:right;">會員帳號 / Account :</td><td align="left"> <input type="text" name="custpinying" style="height:25px"></td></tr>
		<tr>	
			<td  style="text-align:right;">會員密碼 / Password :</td><td align="left"> <input type="text" name="custpwd" style="height:25px"></td></tr>
		<tr>	
		<td style="text-align:right;">
		<br>
			<a href="member-addmember.jsp">註冊帳號/Creat An Account </a><br>
			
			<a href="member-forget.jsp">忘記密碼? / Forgot Password? </a>
		
		</td>
		<td align="left"><br><input  style="width:175px;"class="btn" type="submit" value="登入" ></td></tr>
			
				</table>
			</form>
			
			<table>
			<tr><td  style="text-align:center;"colspan="2"><h5>FB登入者請先登入，後再按下面"登入會員中心按鈕"</h5></td></tr>
			<tr><td></td>
			<td><fb:login-button type="button" scope="public_profile,email"onlogin="checkLoginState();" onclick="getUserInfo()">
				</fb:login-button></td></tr>
				<tr><td></td>
				<td>
	<form id="fblogin" action="fblogin.do" method="post">
<input id="myid" name="myid" type="hidden" value="">
<input id="myname" name="myname" type="hidden" value="">
<input id="mail" name="mail" type="hidden" value="">
<input id="brithday" name="brithday" type="hidden"" value="">
 <input type="button" style="color:#16264f;"value="進入會員中心" onclick= "getUserInfo()"></td></tr>
</form>
	
</table>
<p  style="text-align:center; color:red;">${error}</p>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>