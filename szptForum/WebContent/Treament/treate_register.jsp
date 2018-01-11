<%
	//用于处理用户注册的页面
%>
<%@ page import="ado.DataBaseADO" %>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	DataBaseADO ADO = DataBaseADO.getAdo();
	//构造要发送的json字符串
	String json = "{\"status\":\"Fail\"}";
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	// 确认密码
	String enterpassword = request.getParameter("passwordenter");
	String email = request.getParameter("email");
	String seccodeverify = request.getParameter("seccodeverify");
	
	// 第一步查询用户名是否被占用
	if(ADO.checkuser(username)){
		out.println(json);
		out.flush();
		return;
	}
	// 第二步查询密码跟确认密码是否相同
	if(!enterpassword.equals(password)){
		out.println(json);
		out.flush();
		return;
	}
	// 第三步查看邮箱是否唯一
	if(ADO.checkemail(email)){
		out.println(json);
		out.flush();
		return;
	}
	// 第四步查看两个验证码是否都正确
	/*
	String enterseccodeverify = (String)session.getAttribute("enterseccodeverify");
	if(!seccodeverify.equals(enterseccodeverify)){
		out.println(json);
		out.flush();
		return;
	}
	*/
	
	//确认完成，返回ok的信息,同时在数据库中插入信息
	json = "{\"status\":\"OK\"}";
	String sql = "insert into user";
	if(ADO.preupdate(sql, username,password,email)){
		System.out.println("插入成功了");
	}else{
		System.out.println("插入失败");
	}
	out.println(json);
	out.flush();
%>