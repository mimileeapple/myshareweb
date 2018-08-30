package com.idelweb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DBMapper {
		//註冊會員
		public void insertcust(Map vo);
		//登入
		public List<Map<String,Object>> selectCust(String custpinying);
		//修改會員資料
		public void updateCust(Map vo);
		
		public void updateans(Map vo);
		//登出
		public void loginout();
		//新增聯絡我們
		public void insertcontact(Map vo);
		//新增產品
		public void insertproduct(Map vo);
		//產品資料查詢
		public List<Map<String,Object>> selectproduct(Map vo);
		public List<Map<String,Object>>selectdialogmain(String pname);
		public List<Map<String,Object>>selectmydialog(String pname);
		//產品資料查詢--pname=null
		public List<Map<String,Object>> selectproductnull(Map vo);
		//產品主資料-
		public List<Map<String,Object>> selectproductmain(int pno);
		//產品搜尋(都等於空-----全秀出來)
		public List<Map<String,Object>>selectproductall();
		public List<Map<String,Object>>selectproductonlypname(String pname);
		//忘記密碼
		public String forget(Map vo);
		//查詢用戶no
		public String selectcustno(String nameno);
		//查詢用戶name
		public String selectcustname(int no);
		//新增預約(更新)
		public void addorder(Map vo);
		//查詢個人上架產品資料
		public List<Map<String,Object>> selectmyproduct(String name);
		//查詢個人預約資料
		public List<Map<String,Object>> selectmyorder(String name);
		//管理者登入
		public List<Map<String,Object>> selectroot(String root_name);
		//查詢聯絡我們
		public List<Map<String,Object>> selectcontact();
		//新增問與答
		public void insertdialog(Map vo);
		//查詢問與答
		public List<Map<String,Object>> selectdialog(int pno);
		
		
	}


