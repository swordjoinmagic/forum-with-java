<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	String mypages = request.getParameter("page");
	if(mypages==null || mypages.equals("")){
		mypages = "0";	//#默认为1
	} 
	int mypage = Integer.parseInt(mypages);
	
	pageContext.setAttribute("page", mypage);
	
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
		<style>
			pre{
				background: gainsboro;
				border: 1px solid;
			}
		</style>
<%@ include file="head.jsp" %>
<div id="wp" class="wp">
	<div id="ct" class="wp cl">
		<jsp:include page="forumweb.jsp">
			<jsp:param value="${id}" name="id"/>
			<jsp:param value="${page}" name="page" />
		</jsp:include>
		<jsp:include page="PostTail.jsp">
			<jsp:param value="${id}" name="id"/>
			<jsp:param value="${page}" name="page" />
		</jsp:include>
	</div>
</div>
<jsp:include page="Reply.jsp">
	<jsp:param value="${id}" name="postid"/>
</jsp:include>
