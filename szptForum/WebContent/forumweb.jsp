<%
	/*
		用于展示一个具体的帖子的内容
	*/
%>
<%@page import="bean.forum.PostCommentMiddleComment,bean.forum.User"%>
<%@page import="ado.DataBaseADO"%>
<%@page import="bean.forum.PostComment"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="post" class="bean.forum.Post" />
<jsp:setProperty name="post" property="*" />
<jsp:useBean id="creator" class="bean.forum.User" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 通过帖子id查询关于该帖子的信息
	post.init();
	creator.init(post.getCreatorname());
	
	// 获得page参数，如果拿不到，那么默认为第0页
	String mypages = request.getParameter("page");
	if(mypages==null || mypages.equals("")){
		mypages = "0";	//#默认为1
	}
	int mypage = Integer.parseInt(mypages);
	
	// 通过帖子id找到所有该帖子的回复信息,并且存入本次request中
	List<PostComment>list = DataBaseADO.getAdo().getPostCommentwithPage(mypage, post.getId());
	request.setAttribute("postcommentlist", list);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_forum_viewthread.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<div id="postlist" class="pl bm">
	<!--一个帖子的标题部分-->
	<table cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td class="pls ptn pbn">
					<div class="hm ptn">
						<span class="xg1">查看:</span> <span class="xi1">${post.getViewcount()}</span><span
							class="pipe">|</span><span class="xg1">回复:</span> <span
							class="xi1">${post.getReplycount()}</span>
					</div>
				</td>
				<td class="plc ptm pbn vwthd">
					<h1 class="ts">
						<span id="thread_subject"><%=post.getTitle() %></span>
					</h1>
				</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 分割线 -->
	<table cellspacing="0" cellpadding="0" class="ad">
		<tbody>
			<tr>
				<td class="pls">
				</td>
				<td class="plc">
				</td>
			</tr>
		</tbody>
	</table>
	
	<%//将数据库中的所有对该帖子的回复都拿出来  %>
	<c:forEach items="${postcommentlist}" var="postcomment">
		<%
			//得到回复者
			String username = ((PostComment)pageContext.getAttribute("postcomment")).getUsername();
			if(!username.equals("")){
			// 根据用户名找到一名用户
			User user = DataBaseADO.getAdo().getUserwithId(username);
			pageContext.setAttribute("User", user);
	}
		%>
		<!--一个楼层-->
		<div class="buidling">
			<table class="plhin"
				cellspacing="0" cellpadding="0">
				<tbody>
					<!--楼层回复主体-->
					<tr>
						<!--发表评论时的左侧头像框-->
						<td class="pls" rowspan="2">
							<div id="favatar2635248" class="pls favatar">
								<div class="pi">
									<div class="authi">
										<a href="#"
											target="_blank" class="xw1">${postcomment.getUsername()}</a>
									</div>
								</div>
								<div class="p_pop blk bui card_gender_0" id="userinfo2635248"
									style="display: none; margin-top: -11px;">
									<div class="m z">
										<div id="userinfo2635248_ma"></div>
									</div>
								</div>
								<div>
									<div class="avatar">
										<a href="#"
											class="avtm" target="_blank">
											<img file="#" src="${User.getAvater()}"
											onerror="this.onerror=null;this.src='https://rpg.blue/fux2.uc/images/noavatar_big.gif'"
											>
										</a>
									</div>
								</div>
								<dl class="pil cl">
								<!-- 
									<dt>在线时间</dt>
									<dd>1545 小时</dd>
									<dt>帖子</dt>
									<dd>
										<font color="#000000"><a
											href="#"
											target="_blank" class="xi2">354</a></font>
									</dd>
									-->
									<dt>注册时间</dt>
									<dd>2013-2-14</dd>
								</dl>
								
								<ul class="xl xl2 o cl">
									<li class="pm2"><a
										href="#"
										onclick="" title="发消息"
										class="xi2">发消息</a></li>
								</ul>
							</div>
						</td>
	
						<!--发表的评论框-->
						<td class="plc">
							<!--发表评论头部信息-->
							<div class="pi">
								<!--表示现在是几楼-->
								<strong> <a
									href="#">
									<em>${postcomment.getHeight()}</em>楼
								</a>
								</strong>
								<div class="pti">
									<div class="pdbt"></div>
									<div class="authi">
										<img class="authicn vm" src="#"> 
											<em id="authorposton2635248">发表于 ${postcomment.time }</em> 
									</div>
								</div>
							</div>
	
							<div class="ptc">
								<div class="pcb">
									<!--发表回复具体信息-->
									<div class="t_fsz">
										${postcomment.getContent()}
									</div>
									
									<% 
										
										int postid = post.getId();
										int height = ((PostComment)pageContext.getAttribute("postcomment")).getHeight();
										System.out.println("height:"+height);
										DataBaseADO ado = DataBaseADO.getAdo();
										List<PostCommentMiddleComment>postcmclist = ado.getAllpostcomment_middle_comment(postid, height);
										request.setAttribute("postcmclist", postcmclist);
										
									%>
									<%// 如果该楼层有评论，那么将他的全部评论都显示出来~ %>
									<c:if test="<%=postcmclist==null?false:true %>">
										<!--对一个楼层的点评-->
										<div class="cm">
											<!--点评图标-->
											<h3 class="psth xs1"><span class="icon_ring vm"></span>点评</h3>
											
											<%//循环显示所有楼层评论信息 %>
											<c:forEach items="${postcmclist}" var="postcmc">
												<%
													//通过用户名得到一个用户
													PostCommentMiddleComment pcmc1 = (PostCommentMiddleComment)pageContext.getAttribute("postcmc");
													User u = ado.getUserwithId(pcmc1.getUsername());
													pageContext.setAttribute("u", u);
												%>
												<!--具体点评信息-->
												<div class="pstl xs1 cl">
													<!--名称与头像-->
													<div class="psta vm">
														<a href="#" c="1"><img src="${u.getAvater()}" onerror="this.onerror=null;this.src='https://rpg.blue/fux2.uc/images/noavatar_big.gif'"></a>
														<a href="#" class="xi2 xw1">${postcmc.getUsername()}</a>
													</div>
													<!--具体信息-->
													<div class="psti">
														${postcmc.getContent()}
													<!--发表时间-->
													<span class="xg1">
														发表于 ${postcmc.getTime()}</span>
													</div>
												</div>											
											</c:forEach>
										</div>										
									</c:if>							
								</div>
							</div>
						</td>
	
					</tr>
					<tr></tr>
					<!--对楼层进行评论回复或者支持反对-->
					<tr>
						<td class="pls"></td>
						<!--点评，回复，支持，反对按钮处-->
						<td class="plc" style="overflow: visible;">
							<div class="po hin">
								<div class="pob cl">
									<em> 
										<a class="cmmnt" onclick="$('#reply${postcomment.getHeight()}').css('display','inline');">点评</a>
										<a class="fastre" href="#">回复</a> 
										<a class="replyadd" href="#">支持
											<span>${postcomment.getAgreecount()}</span>
										</a> 
										<a class="replysubtract" href="#">反对
											<span>${postcomment.getAgainstcount()}</span>
										</a>
									</em>
								</div>
								<form method="post" action="/szptForum/CreatePostCommentMiddleComment.bin" style="display:none;" id="reply${postcomment.getHeight()}">
									<input type="hidden" name="postid" value="${postcomment.getPostid()}"/>
									<input type="hidden" name="height" value="${postcomment.getHeight()}"/>
									
									<div class="pob cl">
										<input type="text" style="margin-left:20px;" size="50" name="editorValue" />
									    <p>	 
									    &nbsp;
										</p>
									    <button type="submit">提交</button>
									</div>
								</form>
							</div>
						</td>
					</tr>
					<tr class="ad">
						<td class="pls"></td>
						<td class="plc"></td>
					</tr>
				</tbody>
			</table>
		</div>
			
	</c:forEach>

	<div id="postlistreply" class="pl">
		<div id="post_new" class="viewthread_table" style="display: none"></div>
	</div>
</div>