$(function(){
	var check_flag="false";

	$('#custpinying').blur(function(){
		if($('#custpinying').val()!=""){
			$.ajax({
	            url: "check_custpinying.do?custpinying="+$('#custpinying').val(),
	            success: function (msg) {
	            	if(msg=="used"){
	            		$('#err_custpinying').text('此帳號已有人使用');
	        			$('#err_custpinying').removeClass('pass');
	        			$('#err_custpinying').addClass('error');
	        			check_flag="false";
	            	}else if(msg="not_used"){
	            		$('#err_custpinying').text('OK');
	        			$('#err_custpinying').removeClass('error');
	        			$('#err_custpinying').addClass('pass');
	        			check_flag="true";
	            	}
	            },
	            error: function (msg) {
	            	alert(msg);
	            }
	        });
			
		}else{
			$('#err_custpinying').text('帳號為必填欄位');
			$('#err_custpinying').removeClass('pass');
			$('#err_custpinying').addClass('error');
			check_flag="false";
		}
	})
	
	$('#custpwd').blur(function(){
		if($('#custpwd').val()!=""){
			$('#err_custpwd').text('');
			$('#errcustpwd').removeClass('error');
			$('#err_custpwd').addClass('pass');
			if($('#custpwd2').val()!=""){
				if($('#custpwd').val()!=$('#custpwd2').val()){
					$('#err_custpwd2').text('兩次輸入的密碼不同');
					$('#err_custpwd2').removeClass('pass');
					$('#err_custpwd2').addClass('error');
					check_flag="false";
				}else{
					$('#err_custpwd2').text('OK');
					$('#err_custpwd2').removeClass('error');
					$('#err_custpwd2').addClass('pass');
					check_flag="true";
				}
			}else{
				$('#err_custpwd2').text('');
				$('#err_custpwd2').removeClass('pass');
				$('#err_custpwd2').removeClass('error');
				check_flag="false";
			}
		}else{
			$('#err_custpwd').text('密碼為必填欄位');
			$('#err_custpwd').removeClass('pass');
			$('#err_custpwd').addClass('error');
			$('#err_custpwd2').text('');
			$('#err_custpwd2').removeClass('pass');
			$('#err_custpwd2').removeClass('error');
			check_flag="false";
		}	
	})	
	
	$('#cust_passwd2').blur(function(){
		if($('#cust_passwd2').val()!=""){
			if($('#cust_passwd').val()!=""){
				if($('#cust_passwd').val()!=$('#cust_passwd2').val()){
					$('#err_cust_passwd2').text('兩次輸入的密碼不同');
					$('#err_cust_passwd2').removeClass('pass');
					$('#err_cust_passwd2').addClass('error');
					check_flag="false";
				}else{
					$('#err_cust_passwd2').text('OK');
					$('#err_cust_passwd2').removeClass('error');
					$('#err_cust_passwd2').addClass('pass');
					check_flag="true";
				}
			}else{
				$('#err_cust_passwd2').text('');
				$('#err_cust_passwd2').removeClass('pass');
				$('#err_cust_passwd2').removeClass('error');
				check_flag="false";
			}
		}else{
			$('#err_cust_passwd2').text('');
			$('#err_cust_passwd2').removeClass('pass');
			$('#err_cust_passwd2').removeClass('error');
			check_flag="false";
		}	
	})	
	
	$('#cust_nick').blur(function(){
		if($('#cust_nick').val()!=""){
    		$('#err_cust_nick').text('OK');
			$('#err_cust_nick').removeClass('error');
			$('#err_cust_nick').addClass('pass');
			check_flag="true";
		}else{
			$('#err_cust_nick').text('暱稱為必填欄位');
			$('#err_cust_nick').removeClass('pass');
			$('#err_cust_nick').addClass('error');
			check_flag="false";
		}
	})
	

	
})
