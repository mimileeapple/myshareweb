package com.idelweb.action;

import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.lang.*;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Time;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.idelweb.dao.DBMapper;

@Controller

public class DBAction {
	@Autowired
	DBMapper dbMapper;
	//v會員註冊start-----------------------------------------------------------------------
		@RequestMapping("insertcust")
		public String insertcust(
				@RequestParam(value = "custpinying",required=false ) String custpinying
				,@RequestParam(value = "custpwd",required=false ) String custpwd
				,@RequestParam(value = "custnick",required=false ) String custnick
				,@RequestParam(value = "brithday",required=false ) String brithday
				,@RequestParam(value = "mail",required=false ) String mail
				, Model s, HttpServletRequest request, HttpServletResponse response){	
		if(request.getSession().getAttribute("custpinying")!=null){
				try{
					response.sendRedirect("selectCust.do");
				}catch(Exception e){
					System.out.println(e);
				}
				return ""; 
			}else{
			HashMap map = new HashMap();
				map.put("custpinying", custpinying);
				map.put("custpwd", custpwd);
				map.put("custnick", custnick);
				map.put("brithday", brithday);
				map.put("mail", mail);
				dbMapper.insertcust(map);
				return "member-login";	
			}}
		//會員註冊end-------------------------------------------------------------------------------
		
		//會員帳號確認start----------------------------------------------------------------------------
		@RequestMapping(value="check_custpinying", method=RequestMethod.GET)
		public @ResponseBody String check_custpinying(@RequestParam(value = "custpinying",required=false ) String custpinying){	
			List<Map<String,Object>> list = dbMapper.selectCust(custpinying);
			if(list.size()>0){
				return "used";}
			else{
				return "not_used";}}
		//會員帳號確認end---------------------------------------------------------------------------------
		
		//會員登入---開始-------------------------------------------------------------------------------
		@RequestMapping("selectCust")
		public String selectCust(
				@RequestParam(value = "custpinying",required=false ) String custpinying
	            ,@RequestParam(value = "custpwd",required=false ) String custpwd
	            ,Model s,HttpServletRequest request, HttpServletResponse response){
			if(request.getSession().getAttribute("custpinying")!=null){//帳號輸入不等於空時
			try{
				response.sendRedirect("selectCustlist.do");}
				catch(Exception e){
					System.out.println(e);}
				return ""; }
			else{
				List<Map<String,Object>> list = dbMapper.selectCust(custpinying);
				if(list.size()>0){  //帳號存在
					  String db_cust_pwd=(String)list.get(0).get("custpwd");
					  if(custpwd.equals(db_cust_pwd)){
						  request.getSession().setAttribute("custpinying", custpinying);
						  //s.addAttribute("cust_no",cust_no);	//session
						  s.addAttribute("custnick",list.get(0).get("custnick"));
						 return "member-center"; }
					  else{
						  s.addAttribute("msg","密碼錯誤");
						  return "member-login"; }  //密碼錯誤，導回登入頁
					 	  }//帳號檢查完畢
				else{   
					  s.addAttribute("msg","帳號不存在");
					  return "member-login";	}//帳號不存在，導回登入頁
					}	}//會員登入----end--------------------------------------------
		
		//讀取會員資料---開始------------------------------------------------------------------------
		@RequestMapping("selectCustlist")//登入判斷
		public String selectCustlist(Model s,HttpServletRequest request){
			if(request.getSession().getAttribute("custpinying")==null){
				return "index"; 
			}else{
				String session_cust_no=(String)request.getSession().getAttribute("custpinying");
				List<Map<String,Object>> list = dbMapper.selectCust(session_cust_no);
				s.addAttribute("custnick",list.get(0).get("custnick"));
				s.addAttribute("custpwd",list.get(0).get("custpwd"));
				return "member-center"; }}//會員資料---end--------------------------------------------
		//v修改會員資料頁面---開始------------------------------------------------------------------------
		@RequestMapping("updateCust")
		public String updateCust(Model s,HttpServletRequest request){
			if(request.getSession().getAttribute("custpinying")==null){
				return "member-login"; 
			}else{
				String session_cust_no=(String)request.getSession().getAttribute("custpinying");
				List<Map<String,Object>> list = dbMapper.selectCust(session_cust_no);
				s.addAttribute("custnick",list.get(0).get("custnick"));
				s.addAttribute("custpwd",list.get(0).get("custpwd"));
				s.addAttribute("brithday",list.get(0).get("brithday"));
				s.addAttribute("mail",list.get(0).get("mail"));
				return "member-updatemember";}}//修改會員資料頁面結束--------------------------------------------
		
		//##修改會員資料送出開始-----------------------------------------------------------------------------
		@RequestMapping("updateCustSend")//更改會員資料
		public String updateCustSend(
				@RequestParam(value = "custpwd",required=false ) String custpwd
				,@RequestParam(value = "custnick",required=false ) String custnick
				,@RequestParam(value = "mail",required=false ) String mail
				, Model s, HttpServletRequest request){
			String session_cust_no=(String)request.getSession().getAttribute("custpinying");
			if(request.getSession().getAttribute("custpinying")==null){
				return "member-login"; 
			}else{
				List<Map<String,Object>> list = dbMapper.selectCust(session_cust_no);
				s.addAttribute("custnick",list.get(0).get("custnick"));
				s.addAttribute("custpwd",list.get(0).get("custpwd"));
				s.addAttribute("mail",list.get(0).get("mail"));
				HashMap map = new HashMap();
				map.put("custpinying", request.getSession().getAttribute("custpinying").toString());
				map.put("custpwd", custpwd);
				map.put("custnick", custnick);
				map.put("mail", mail);
				dbMapper.updateCust(map);
	            return "member-center";}}//修改會員資料送出結束--------------------------------------------
			//管理頁面新增產品--------------------------------------------------------------------------------
			@RequestMapping("insertproduct")
			public String insertproduct(
					@RequestParam(value = "pclass",required=false ) String pclass
					,@RequestParam(value = "pname",required=false ) String pname
					,@RequestParam(value = "price",required=false ) String price
					,@RequestParam(value = "city",required=false ) Integer city//用Integer 部會有錯
					,@RequestParam(value = "town",required=false )Integer town//用int 會有錯
					,@RequestParam(value = "discription",required=false ) String discription
					, Model s, HttpServletRequest request, HttpServletResponse response){
				String session_cust_no=(String)request.getSession().getAttribute("custpinying");
				if(session_cust_no==null){
					return "member-login"; 
				}else{
					SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
					Date datenow = new Date();
					String date = sdFormat.format(datenow);//訂單成立日期
					HashMap map = new HashMap();
					System.out.println("date="+date);
					map.put("adddate",  date);
					map.put("pclass", pclass);
					map.put("pname",pname);
					map.put("price", price);
					map.put("city",city );
					map.put("town",town );
					map.put("discription", discription);
					int no=Integer.parseInt(dbMapper.selectcustno(session_cust_no));
					map.put("userno", no);
					dbMapper.insertproduct(map);}
				return "s_add";}//管理頁面新增產品結束--------------------------
			//搜尋產品
			@RequestMapping("selectproduct")
			public String selectproduct(
				@RequestParam(value = "pname",required=false ) String pname,
				@RequestParam(value = "city",required=false ) int city,
				@RequestParam(value = "town",required=false ) int town,Model s, HttpServletRequest request, HttpServletResponse response) {
				List<Map<String,Object>> list=null;
					HashMap map =new HashMap(); 
					System.out.println("進入=");
				if(city>0&&town>0){// 兩個有值
					if("".equals(pname)){//pname沒有值
					map.put("city",city);
					map.put("town",town);
					list= dbMapper.selectproductnull(map);
					 System.out.println("list"+list);}
					else{//pname有值 (三個都有直)
					System.out.println("city="+city);
					System.out.println("town="+town);
					map.put("pname",pname);
					map.put("city",city);
					map.put("town",town);
				        list= dbMapper.selectproduct(map);
				        System.out.println("pname="+pname);
				        System.out.println("list"+list);}}
				//修改為 城鎮沒有值時----ifpname有值......else-pname沒有值(所有的都秀出
				
						else if(!(city>0&&town>0)){//城鎮沒有值
							 System.out.println("city="+city);
							 System.out.println("town="+town);
						 	if("".equals(pname)){//pname沒有值(三個都沒值(秀出全部
						 		System.out.println("pname="+pname);
								list= dbMapper.selectproductall();
							 	System.out.println("list"+list);}
						 	else{//pname有值 (城鎮沒值)
								//map.put("pname",pname);
						        list= dbMapper.selectproductonlypname(pname);
						        System.out.println("pname="+pname);
						        System.out.println("list"+list);}
						} 
						
					request.setAttribute("list",list);
			return "search";}
			//v顯示個人上架產品資料
	@RequestMapping("selectmyproduct")
		public String selectmyproduct(Model s, HttpServletRequest request, HttpServletResponse response) {
			String session_cust_no=(String)request.getSession().getAttribute("custpinying");
				if(session_cust_no==null){
					return "member-login";}
				else{
					List<Map<String,Object>> list=dbMapper.selectmyproduct(session_cust_no);
					request.setAttribute("list",list);
			return "myproduct";}}

			//v產品資料顯示主畫面-------------------------------------------------------
		@RequestMapping(value ="selectproductmain", method = RequestMethod.GET)
			public String selectproductmain( Model s,HttpServletRequest request,
				@RequestParam(value = "pno",required=false )String  pno){
			String session_cust_no=(String)request.getSession().getAttribute("custpinying");
			if(session_cust_no==null){
				return "member-login";}
			else{int no=Integer.parseUnsignedInt(pno);
					List<Map<String,Object>> list= dbMapper.selectproductmain(no);
					String name=(String) list.get(0).get("custpinying");
					request.setAttribute("list",list); 
					List<Map<String,Object>> slist=dbMapper.selectdialog(no);//問與答
					request.setAttribute("slist",slist);
					if(session_cust_no.equals(name)){//如果上架跟登入為同一人
						request.setAttribute("decide",1);
						request.setAttribute("msg","");}
					else{
						request.setAttribute("decide",0);
						request.setAttribute("msg","您沒有這項產品回應的功能，請重新登入");
					}return "productdtail";}}
		//v產品資料顯示主畫面-------------------------------------------------------
	@RequestMapping("selectdialogmain")
		public String selectdialogmain( Model s,HttpServletRequest request){
		String session_cust_no=(String)request.getSession().getAttribute("custpinying");
			if(session_cust_no==null){
				return "member-login";}
			else{
			List<Map<String,Object>> mylist=dbMapper.selectmydialog(session_cust_no);	
			List<Map<String,Object>> list=dbMapper.selectdialogmain(session_cust_no);
			//if(mylist.size()>0|list.size()>0){
			request.setAttribute("list",list);
			request.setAttribute("mylist",mylist); 	
			String name=(String) list.get(0).get("custpinying");
			if(session_cust_no.equals(name)){//如果上架跟登入為同一人
				request.setAttribute("decide",1);
				request.setAttribute("msg","");}
			else{
				request.setAttribute("decide",0);
				request.setAttribute("msg","您沒有這項產品回應的功能，請重新登入");
				//request.setAttribute("list",list);
				//request.setAttribute("mylist",mylist);
				}}
			/*else{
				s.addAttribute("list",null);
			s.addAttribute("mylist",null);
			}*/
			return "myask";}//}
		
	//我要預約	
			@RequestMapping("addorder")
			public String addorder( Model s,HttpServletRequest request,
				@RequestParam(value = "pno",required=false )String  pno,
				@RequestParam(value = "thedate",required=false )String senddate){
					String session_cust_no=(String)request.getSession().getAttribute("custpinying");
					if(session_cust_no==null){
						return "member-login";}
					else{
						System.out.println("pno="+pno);
						System.out.println("登入用戶為="+session_cust_no);
						SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
						Date datenow = new Date();
						String date = sdFormat.format(datenow);//訂單成立日期
						int no=Integer.parseUnsignedInt(pno);
						//int custno=Integer.parseInt(dbMapper.selectcustno(session_cust_no).toString());
						System.out.println(senddate);
						HashMap map=new HashMap();
						map.put("orderdate", date);
						map.put("pno", no);
						map.put("costomrno", session_cust_no);
						map.put("senddate", senddate);
						dbMapper.addorder(map);
					return "member-center";}}
		//v顯示個人預約資料
			@RequestMapping("selectmyorder")
				public String selectmyorder(Model s, HttpServletRequest request, HttpServletResponse response) {
					String session_cust_no=(String)request.getSession().getAttribute("custpinying");
					if(session_cust_no==null){
					return "member-login";}
					else{
						List<Map<String,Object>> list=dbMapper.selectmyorder(session_cust_no);
						request.setAttribute("list",list);
						System.out.println("我的預約資料list="+list);
					return "myorderlist";}}
		
		//新增留言資料
		@RequestMapping("insertdialog")
			public String insertdialog(
		@RequestParam(value = "dfrom",required=false ) String dfrom	,
			@RequestParam(value = "productno",required=false ) String productno,
			@RequestParam(value = "message",required=false ) String message,
			@RequestParam(value = "no",required=false ) String no,
			 Model s, HttpServletRequest request, HttpServletResponse response){	
			String session_cust_no=(String)request.getSession().getAttribute("custpinying");
			if(session_cust_no==null){
				return "member-login";}
			else{
				System.out.println("productno="+productno);
				System.out.println("我是="+session_cust_no);
				System.out.println("對象dfrom="+dfrom);
				System.out.println("對象message="+message);
				
				int pno=Integer.parseInt(productno);
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date datenow = new Date();
				String strDate = sdFormat.format(datenow);
				HashMap map = new HashMap();
				map.put("productno", pno);
				map.put("date", strDate);
				map.put("dfrom", session_cust_no);
				map.put("message", message);
				map.put("ans",0);
				dbMapper.insertdialog(map);
			return "redirect:selectproductmain.do?pno="+productno;}}
		
		@RequestMapping(value="updateans",method=RequestMethod.POST)
		public String updateans(
				@RequestParam(value = "pn",required=false ) String pn,
				@RequestParam(value = "ans",required=false ) String ans,
				@RequestParam(value = "dialogno",required=false ) String dialogno	,
		Model s, HttpServletRequest request, HttpServletResponse response){	
		String session_cust_no=(String)request.getSession().getAttribute("custpinying");
		if(session_cust_no==null){
			return "member-login";}
		else{
			//寫一個判斷request.getSession().getAttribute("custpinying");=上架人時才能寫入
			//若否時，傳msg你不是上架人
			System.out.println("productno="+pn);
			System.out.println("ans="+ans);
			System.out.println("no="+dialogno);
			int no=Integer.parseInt(dialogno);
			HashMap map=new HashMap();
			map.put("no",no);
			map.put("ans",ans);
			dbMapper.updateans(map);
		return "redirect:selectproductmain.do?pno="+pn;}}
		//登出-------------------------------------------------------------------------------
		@RequestMapping("logout")
			public String loginout(HttpServletRequest request) {
				request.getSession().invalidate();
		   return "index";
	    }//登出---end------------------------------------------------------------------------

		@RequestMapping(value ="fblogin")
		public String fblogin(
				@RequestParam(value = "myid",required=false ) String id,
				@RequestParam(value = "myname",required=false ) String name,
				@RequestParam(value = "mail",required=false ) String mail,
				@RequestParam(value = "brithday",required=false ) String brithday,
				Model s, HttpServletRequest request, HttpServletResponse response) {
			System.out.println("我的id="+id);
			System.out.println("我的name="+name);
			System.out.println("我的mail="+mail);
			System.out.println("我的brithday="+brithday);
			List<Map<String,Object>> list=dbMapper.selectCust(id.toString());
			System.out.println("list="+list);
			/*int cutIndex,cutIndex2,cutIndex3;
			String year,month,day,dayday;
			 cutIndex=brithday.indexOf("/");
			 month=brithday.substring(0, cutIndex);
			 dayday=brithday.substring(cutIndex+1,brithday.length());
			cutIndex2=dayday.indexOf("/");
			 day=dayday.substring(0,cutIndex2);
			 cutIndex3=dayday.indexOf("/");
			 year=dayday.substring(cutIndex2+1, dayday.length());
			 String b=year+"-"+month+"-"+day;*/
			if(list.size()>0){//抓出來有資料時
				System.out.println("id="+list.get(0).get("custpinying"));
				s.addAttribute("custpinying",list.get(0).get("custnick"));
				try{
					response.sendRedirect("selectCust.do?custpwd=fb&custpinying="+id);}
					catch(Exception e){
						System.out.println(e);}
					
			//if(list.get(0).get("custpinying").equals(id)){
			}
			else{
				if("".equals(id)){
				HashMap map = new HashMap();
				map.put("custpinying", id);
				map.put("custpwd", "fb");
				map.put("custnick", name);
				//map.put("brithday",b);
				map.put("mail", mail);
				dbMapper.insertcust(map);
				list=dbMapper.selectCust(id.toString());
				try{
					response.sendRedirect("selectCust.do?custpwd=fb&custpinying="+id);}
					catch(Exception e){
						System.out.println(e);}
				s.addAttribute("error","登入成功");
			}
			else{
				s.addAttribute("error","請重新登入FB，如有疑問請洽客服");
				return "member-login";}}
			
			s.addAttribute("custnick",list.get(0).get("custnick"));
			//s.addAttribute("custpwd",list.get(0).get("custpwd"));
				 return "member-center";
}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//忘記密碼--用帳號與MAIL查詢密碼
	@RequestMapping(value ="forget")//不能寫POST OR GET 否則接不到值
		public String forget(
			@RequestParam(value = "custpinying",required=false ) String custpinying,
			@RequestParam(value = "mail",required=false ) String mail,Model s, HttpServletRequest request, HttpServletResponse response) {
				HashMap map =new HashMap();
				map.put("custpinying",custpinying);
				map.put("mail",mail);
				 System.out.println("custpinying="+custpinying);
				 System.out.println("mail="+mail);
				 String custpwd=(String)dbMapper.forget(map);
			     System.out.println("custpwd="+custpwd);
			     String msg="請輸入正確帳號與mail";
			     String right="您的密碼為";
			     if(custpwd!=null){//正確
			    	 s.addAttribute("custpwd",right+custpwd);
			    	 request.setAttribute("custpwd", right+custpwd);
				}
			      else{
			    	  s.addAttribute("custpwd",msg); }
				return "member-forget";}
			

		//v聯絡我們表單----start-----------------------------------------------------------------------
@RequestMapping("insertcontact")
	public String insertcontact(
		@RequestParam(value = "name",required=false ) String name
		,@RequestParam(value = "email",required=false ) String email
		,@RequestParam(value = "subject",required=false ) String subject
		,@RequestParam(value = "phone",required=false ) String phone
		,@RequestParam(value = "address",required=false ) String address
		,@RequestParam(value = "message",required=false ) String message, Model s, HttpServletRequest request, HttpServletResponse response){	
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date datenow = new Date();
			String strDate = sdFormat.format(datenow);
			HashMap map = new HashMap();
			map.put("name", name);
			map.put("email", email);
			map.put("subject", subject);
			map.put("phone", phone);
			map.put("address", address);
			map.put("message", message);
			map.put("date", strDate);
			dbMapper.insertcontact(map);
		return "index";	}
		//聯絡我們 end----------------------------------------------------------------------------
	
		
		
		
	//------------------------------------管理者頁面-----------------------------------------------------
	//管理頁面-聯絡我們資料顯示
				@RequestMapping("selectcontact")
				public String selectcontact( Model s,HttpServletRequest request) {
				  List<Map<String,Object>> list= dbMapper.selectcontact();
				  request.setAttribute("list",list);
				        return "root-selectcontact";}//管理頁面-聯絡我們資料end------------------------------
				
				
	//管理者登入-----------------------------------------------------------------------
				@RequestMapping("selectroot")
				public String selectroot(@RequestParam(value = "root_name",required=false ) String root_name
			            ,@RequestParam(value = "root_pwd",required=false ) String root_pwd
			            ,Model s,HttpServletRequest request, HttpServletResponse response){
							List<Map<String,Object>> list = dbMapper.selectroot(root_name);
						if(list.size()>0){  //帳號存在
							  String db_cust_pwd=(String)list.get(0).get("root_pwd");
							  if(root_pwd.equals(db_cust_pwd)){
								  request.getSession().setAttribute("root_name", root_name);
								 return "rootmanagement"; }
							  else{
								  s.addAttribute("msg","密碼錯誤");
								  return "rootlogin"; } } //密碼錯誤，導回登入頁
							  	 else{   
							  s.addAttribute("msg","帳號不存在");
							  return "rootlogin";	}}	//帳號不存在，導回登入頁
	//管理者登入----end-------------------------------------------------------------
			
	
				
		
				
	}
