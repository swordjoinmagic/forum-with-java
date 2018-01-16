<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setAttribute("isCreatePost", true);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<jsp:include page="head.jsp" />
<div id="wp" class="wp">
	<form method="post" id="postform" action="/szptForum/CreatePostComment.bin">
		<input type="hidden" name="postid" id="formhash" value="${postid}">
		<div id="ct" class="ct2_a ct2_a_r wp cl">
			<div class="bm bw0 cl">
				<h2 style="font-size:40px;margin-left: 450px;">发表帖子</h2>
				标题<input type="text" name="posttitle"/>
				<br/>
				<jsp:include page="ueditor1_4_3/index.jsp"></jsp:include>
				<input type="hidden" name="plateid" value="<%=request.getParameter("pid") %>">
				<button type="submit">发表</button>
			</div>
		</div>
	</form>
</div>
