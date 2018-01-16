<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 要回一个帖子，要知道的数据有：
	/*
		1.postid
		2.editorvalue
		3.
	*/
	String postid = request.getParameter("postid");
	pageContext.setAttribute("postid", postid);
%>
<div id="f_pst" class="pl bm bmw">
	<form method="post" id="fastpostform" action="/szptForum/CreatePostComment.bin">
		<input type="hidden" name="postid" value="${postid}" />
		<table cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<c:if test="${cookie.isLogin.value==\"true\"}">
						<td class="pls">
							<div class="avatar avtm">
								<img src="https://rpg.blue/fux2.uc/data/avatar/000/11/02/81_avatar_big.jpg" onerror="this.onerror=null;this.src='https://rpg.blue/fux2.uc/images/noavatar_big.gif'">
							</div>
						</td>				
					</c:if>
					<td class="plc">
						<span id="fastpostreturn"></span>
						
						<!-- 如果登录就显示回复框 -->
						<c:choose>
							<c:when test="${cookie.isLogin.value==\"true\"}">
								<div class="cl">
									<div id="fastsmiliesdiv" class="y">
										<div id="fastsmiliesdiv_data">
											<div id="fastsmilies"></div>
										</div>
									</div>
									<div class="hasfsl" id="fastposteditor">
										<jsp:include page="ueditor1_4_3/index.jsp"></jsp:include>
									</div>
									<script>
										$(document).ready(function(){
											setTimeout(function(){UE.getEditor('editor').setHeight(200);},300)
										});
									</script>
								</div>
								<p class="ptm pnpost">
									<button type="submit"
										name="replysubmit" id="fastpostsubmit" class="pn pnc vm"
										value="replysubmit" tabindex="5">
										<strong>发表回复</strong>
									</button>
								</p>
							</c:when>
							<c:when test="${cookie.isLogin==null || cookie.isLogin.value==\"false\"}">
																<div class="cl">
									<div id="fastsmiliesdiv" class="y">
										<div id="fastsmiliesdiv_data">
											<div id="fastsmilies"></div>
										</div>
									</div>
									<div class="hasfsl" id="fastposteditor">
										<p>请您登录后再回帖</p>
									</div>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>