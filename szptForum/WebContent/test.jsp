
<%
	//用于测试的页面
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
			<c:choose>
				<c:when test="${cookie.isLogin.value==\"true\"}">true</c:when>
				<c:when test="${cookie.isLogin==null || cookie.isLogin.value==\"false\"}">false</c:when>
			</c:choose>