<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script language=javascript src=js/address.js></script>
<script src="http://connect.facebook.net/zh_TW/all.js"></script>
<script language=JavaScript>
function br(){
	
	var town = document.getElementById("townselect").value;
	document.getElementById("town").value=town;
	var pclass = document.getElementById("productclass").value;
	document.getElementById("pclass").value=pclass;
	var name=document.getElementById("pname").value;
	var price=document.getElementById("price").value;
	var discription=document.getElementById("discription").value;
	var S4="**-----------歡迎大家有空來看看---------------**";
	var S5="我的網址:"
		//var selecttown = document.regstep.address.options[town];
	var result1="我上架了一個"+name;
	var result2="價格:"+price;
	var result3="產品描述:"+discription;
	var last=result1+"\n"+result2+"\n"+result3+"\n"+S4+"\n"+S5;
	//alert (last);
	var Radio =  $("input[name='pofb'][type='radio']:checked").val();
    if(Radio==1){
	  FB.api(
	      "/me/feed",
	      "POST",
	      {
	          "message": last
	      },
	      function (response) {
	        if (response && !response.error) {
	          /* handle the result */
	        }
	      }
	  );}
    else{
    	//alert("失敗了");
    }
	}

function CloseClicked()
{
window.returnValue = '';
window.close()
}</script>

<title>上架產品</title>
<style type="text/css">

table	{width:1024;
	margin:0px auto;
	margin-top:0px;
	}
td	{
	width: 300;
	text-align: center;
	padding: 8px;
	font-size: 18px;}
td:first-child{
font-weight:bold;
width:250px;
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
<div id="fb-root"></div>

<script type= 'text/javascript'>

FB.init({

appId: '1991064287881035',
status: true,
cookie: true,
xfbml: true,
oauth: true,
});
FB.getLoginStatus(function (response) {
if (response.status === 'connected') {        
var uid = response.authResponse.userID;
var accessToken = response.authResponse.accessToken;
//accessToken 的功用可以看這裡 http://developers.facebook.com/docs/reference/api/">http://developers.facebook.com/docs/reference/api/
login_success(uid);

} else {
FB.login(function (response) {
if (response.authResponse) {
var uid = response.authResponse.userID;
var accessToken = response.authResponse.accessToken;
login_success(uid);
} else {
alert('登入失敗!');
}
}, {
scope: 'email,publish_stream'
});
}
 
})
</script>
			<div class="title"><p>新增產品資料</p></div>
			
				<table border="1">
				<tr><td>縣市:</td>
						<td><FORM name=regstep>
				<SELECT style="height:30px;width:170px;" id="cityselect"
						onchange=Buildkey(this.options[this.options.selectedIndex].value); size=1 
						name=new> <OPTION value=0 selected>請選擇縣市...</OPTION> <OPTION 
						value=1>臺北市</OPTION> <OPTION value=2>基隆市</OPTION> <OPTION 
						value=3>臺北縣</OPTION> <OPTION value=4>宜蘭縣</OPTION> <OPTION 
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
						value=25>釣魚台列嶼</OPTION></SELECT></td></tr>
			<tr><td>區域:</td>
				<td><SELECT style="height:30px;width:170px;" onchange=document.regstep.code.value=this.options[this.options.selectedIndex].value; size=1 name=address> 
						<OPTION value="" selected>請選擇區域</OPTION></SELECT> 
						<INPUT type="hidden" id="townselect" size=5 name=code></FORM></td></tr>
	
			<form id="insertproduct" action="insertproduct.do" method="post" >
			
					<tr><td>產品類別:</td>
						<td> 
						<select style="width:90px;" id="productclass" >
						<option value="">請選擇產品類別</option>
						<option value="產品">產品</option>
						<option value="服務">服務</option></select>
						<input id="pclass" type="hidden" name="pclass" value=""></td></tr>
					<tr><td>品名:</td>
						<td><input id="pname" type="text" name="pname"></td></tr>
					<tr><td>特價:</td>
						<td><input id="price" type="text" name="price"></td></tr>
						<input  type="hidden" id="city" name="city" value="">
       					<input type="hidden" id="town" name="town" value="">			
					<tr><td >產品描述</td>
						<td><textarea id="discription" name="discription" cols="30" rows="5" >
						</textarea></td>
					</tr>
					<tr ><td></td>
						<td><div class="radio"><input style="margin-top:-20px;margin-bottom:0px;text-align: center;width:20px;height:20px"
						type="radio" id="fbyes" name="pofb" value="1">發佈到我的FaceBook上
						<input style="margin-top:-20px;margin-bottom:0px;text-align: center;width:20px;height:20px"
						type="radio"id="fbno"name="pofb" value="2">不要發佈</div></td>
					</tr>
					<tr>
						<td></td>
						<td><input style="text-align:center; width:120px"class="btn" type="submit" value="送出" onclick="br()"></td>
					</tr>
				</table>
			</form>
	
	

<%@ include file="footer.jsp" %>
</body>

</html>