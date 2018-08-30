<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員註冊  | Register</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<style type="text/css">
.addmember {
text-align: center;
color:#6bb2b1;
font-weight:bold;
font-face:微軟正黑體;
font-size:40px;
margin-bottom:-70px;

}
input{
	width:210px;
	height:30px;
	text-align: left;
}
input p{
	text-align: right;
}
a{color:#4f4b4c;
font-size:16px;
}
a:hover{
	color:#85c1bf;
}
</style>
</head>
<body>
<%@ include file="a_nav.jsp" %> 

	<div class="main">
		<div class="list">
			<div class="addmember">會員註冊│ Join Us
		</div>
	<table ><form id="insertcust" action="insertcust.do" method="post" style-margin="auto" >
	<tr>
<td style="text-align:right"><span style="color:#d8081d" >* </span>會員帳號 / Account :</td>
<td align="left"><input id="custpinying" type="text" name="custpinying"><span id="err_custpinying"></span>
</td></tr><br>
		
	
	<tr>
<td style="text-align:right"><span style="color:#d8081d">* </span>登入密碼 / Password :</td>
<td align="left"><input id="custpwd" type="text" name="custpwd"><span id="err_custpwd"></span><br>
		</td></tr><br>
	
	<tr>
<td style="text-align:right"><span style="color:#d8081d">* </span>密碼確認 / Confirm :</td> 
<td align="left"> <input id="custpwd2" type="text" name="custpwd2"><span id="err_custpwd2"></span><br>
		</td></tr><br>
		
	<tr>
<td style="text-align:right"><span style="color:#d8081d">* </span>會員暱稱 / Name :</td>  
<td align="left"><input id="custnick" type="text" name="custnick"><span id="err_custnick"></span><br>
		</td></tr><br>
		
	<tr>
<td style="text-align:right"><span style="color:#d8081d">* </span>生日 / Brithday:</td> 
			<td align="left">
            <select style="width:90px;" id="Year" class="input_list_select"><option value="">Year</option><option value="1950">1950</option><option value="1951">1951</option><option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option><option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option></select>
            <select style="width:90px;"id="Month" class="input_list_select" ><option value="">Month</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
            <select style="width:90px;"id="Day" class="input_list_select"><option value="">Day</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
       		<input  type="hidden" id="brithday" name="brithday" value="">
    		</td></tr><br>
<tr>
<td style="text-align:right"><span style="color:#d8081d">* </span>電子郵件信箱 / Email:</td> 
 <td align="left"><input id="mail" type="text" name="mail"><span id="err_custemail"></span><br>
			</td></tr>
			
<tr><td style="text-align:right"></td><td align="left">
<input class="btn" type="submit" value="送出"  onclick="br();"style="text-align:center;"></td></tr>	
<tr><td></td><td style="text-align:left">
<a href="member-login.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;會員登入/Sign In</a></td></tr>
<tr><td></td><td style="text-align:left">
<a href="member-forget.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;忘記密碼?/Forgot Password? </a></td></tr>
		</table>		
			</form>
        
     
               
            
            	
		</div>
	</div>

</div>
<%@ include file="footer.jsp" %>
</body>
 <script type="text/javascript"> 
function br(){
var Year = document.getElementById("Year").value;
var Month = document.getElementById("Month").value;
var Day =  document.getElementById("Day").value;
var brithday=Year+Month+Day;
document.getElementById("brithday").value=brithday;
alert("會員新增成功~")
}
</script>
</html>