<%@page import="ado.DataBaseADO,java.util.*,bean.forum.Post"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String p = request.getParameter("page");
	int mypage = 0;
	if(p!=null){
		mypage = Integer.parseInt(p);
	}
	
	
	DataBaseADO ado = DataBaseADO.getAdo();
	List<Post>postlist = ado.GetPostWithPage(mypage);
	request.setAttribute("postlist", postlist);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_forum_forumdisplay.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<div id="threadlist" class="tl bm bmw">
	<div class="th">
		<table cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<th colspan="2">
						<div class="tf">
							<a id="filter_special"
								href="#" class="showmenu xi2">
								全部主题
							</a>
						</div>
					</th>
					<td class="by">作者</td>
					<td class="num">回复/查看</td>
					<td class="by">最后发表</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="bm_c">
		<table summary="forum_308" cellspacing="0" cellpadding="0"
			id="threadlisttableid">

			<!--重要通知-->
			<tbody id="stickthread">
				<tr>
					<!--图标-->
					<td class="icn">
						<img src="static/image/common/pin_1.gif" alt="本版置顶">
					</td>
					<!--标题信息-->
					<th class="common">
						<em>
							<a title="版务" href="#">
							<img style="vertical-align: middle; padding-right: 4px;"
								src="#" alt="版务">
							</a>
						</em>					
						<a href="#"
						style="font-weight: bold; color: #2B65B7;"
						class="s xst">RMXP 讨论区版规</a>
					</th>
					<!--作者-->
					<td class="by"><cite> <a
							href="#" c="1"
							style="color: #006666;" mid="card_378">RyanBern</a></cite> <em><span>2017-10-13</span></em>
					</td>
					<!--查看与回复-->
					<td class="num"><a
						href="#" class="xi2">1</a><em>217</em></td>
					<!--最后发表-->
					<td class="by">
						<cite><a
							href="#" c="1" mid="card_1543">RyanBern</a>
						</cite> 
						<em><a
							href="#">2017-10-23
								15:14</a>
						</em>
					</td>
				</tr>
			</tbody>
			
			<!--板块主题分割线-->
			<tbody id="separatorline">
				<tr class="ts">
					<td>&nbsp;</td>
					<th><a href="#" title="查看更新" class="forumrefresh">版块主题</a></th>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
			
			<c:forEach items="${postlist}" var="post">
				<!--普通帖子-->
				<tbody id="normalthread">
					<tr>
						<!--图标(通用)-->
						<td class="icn"><a
							href="#" title="新窗口打开"
							target="_blank"><img
							src="static/image/common/folder_common.gif"></a>
						</td>
						<!--一个帖子的通常信息(如：标题)-->
						<th class="common">
							<!--帖子的图标（帮助标识一个帖子的状态）-->
							<em>
								<a title="原创发布" href="#">
									<img style="vertical-align: middle; padding-right: 4px;"
										src="/data/attachment/common/skin/XP发布.gif" alt="原创发布">
								</a>
							</em>
							<!--帖子标题-->
							<a href="#" class="s xst">${post.getTitle()}</a></th>
						<!--作者和发表时间-->
						<td class="by"><cite><a
								href="#" c="1"
								style="color: #006666;">${post.getCreatorname() }</a></cite><em><span>${post.getCreatetime()}</span></em></td>
						<!--回复与查看-->
						<td class="num"><a
							href="#" class="xi2">${post.getReplycount()}</a><em>${post.getViewcount()}</em>
						</td>
						<!--最后发表-->
						<td class="by">
							<cite>
								<a href="#" c="1">990255918</a>
							</cite>
							<em><a href="#">2017-11-27
										12:16
								</a>
							</em>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			
		</table>
	</div>
</div>