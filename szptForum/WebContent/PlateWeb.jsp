<%
	/*
		一个具体的板块页面，显示该板块下的帖子列表
	*/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="head.jsp" %>
<div class="boardnav">
	<div id="ct" class="wp cl">
		<div class="mn">
			<jsp:include page="forumpostlist.jsp">
				<jsp:param value="${page}" name="page"/>
			</jsp:include>
		</div>
	</div>
</div>