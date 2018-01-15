<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
%>

<%@ include file="head.jsp" %>
<jsp:include page="forumweb.jsp">
	<jsp:param value="${id}" name="id"/>
</jsp:include>