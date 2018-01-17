<%@page import="ado.DataBaseADO"%>
<%
	/*
		首页侧边栏
	*/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*,bean.forum.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 获得点击量前十的帖子
	List<Post>list = DataBaseADO.getAdo().find_MAX10Post();
	pageContext.setAttribute("max10post", list);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>

<div id="sd" class="sd">
	<div class="drag">
		<div id="diy2" class="area">
			<div id="frame6YeH93" class="frame move-span cl frame-1">
				<div id="frame6YeH93_left" class="column frame-1-c">
					<div id="portal_block_121" class="cl_block_bm block move-span">
						<!--热门主题-->
						<div class="blocktitle title">
							<span class="titletext"
								style="float:; margin-left: 10px; font-size:; color:;">热门主题
							</span>
							<span style="float:right">查看数</span>
						</div>
						<!--具体的热门主题-->
						<div id="portal_block_121_content" class="dxb_bc">
							<div class="module cl xl xl1">
								<ul>
									<c:forEach items="${max10post}" var="maxpost">
										<li><em>${maxpost.getViewcount()}</em>
											<a href="postweb.jsp?id=${maxpost.getId()}"
											title="${maxpost.getTitle()}" target="_blank">${maxpost.getTitle()}</a>
										</li>	
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>