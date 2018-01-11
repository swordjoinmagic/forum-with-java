<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	
	String code = (String)request.getParameter("code");
	String graphcode = (String)session.getAttribute("graphhashcode");
	String str = "{\"graphhashcode\" : \"success\"}";
	if(graphcode.equals(code)){
		out.print(str);
		out.flush();
	}else{
		str = "{\"graphhashcode\" : \"Fail\"}";
		out.print(str);
		out.flush();
	}
%>