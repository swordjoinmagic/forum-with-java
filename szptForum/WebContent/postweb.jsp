<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	
	Post post = new Post();
	post.setId(Integer.parseInt(id));
	post.init();
	// 每有一个用户点击帖子，帖子点击量就增加1
	int viewcount = post.getViewcount();
	System.out.println("查看数："+viewcount);
	// 更新数据库
	DataBaseADO.getAdo().updatePostViewCount(viewcount+1, post.getId());
	System.out.println("查看数+1："+(viewcount+1));

%>

<%@ include file="head.jsp" %>
<jsp:include page="forumweb.jsp">
	<jsp:param value="${id}" name="id"/>
</jsp:include>
<jsp:include page="Reply.jsp">
	<jsp:param value="${id}" name="postid"/>
</jsp:include>
