<%@page import="email.EmailManager" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//处理邮箱验证码的jsp页面
		
		// 获得邮箱账号
		String email = (String)request.getAttribute("email");
		
		//生成邮件
		EmailManager em = new EmailManager();
		
		//生成验证码
		int random = (int)(Math.random()*100000);
		String checknumber = String.valueOf(random);
		//将该验证码保存在与用户的session中
		session.setAttribute("checknumber", checknumber);
		
		String sendmessage = "欢迎您使用注册账号功能，您需要在验证码框输入如下验证码完成操作:\n"+checknumber+"\n这是sjm的一次测试~";
		
		// 发送验证码邮件
		em.sendemail(email, sendmessage);
		
	%>
</body>
</html>