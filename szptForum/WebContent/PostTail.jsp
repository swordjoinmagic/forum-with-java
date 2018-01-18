
<%@page import="ado.DataBaseADO"%>
<%
	// 帖子列表的尾部构造，有关于发帖的关键字，有关于页数的翻阅
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*,bean.forum.*" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int postid = Integer.parseInt(request.getParameter("id"));
	DataBaseADO ado = DataBaseADO.getAdo();
	int count = ado.getPostCommentCount(postid);
	int mypage = Integer.parseInt(request.getParameter("page"));
	pageContext.setAttribute("pagecount", count/10);
	pageContext.setAttribute("mypage", mypage);
	pageContext.setAttribute("pid", postid);
%>
<div class="bm bw0 pgs cl">
	<span id="fd_page_bottom">
		
		<!-- 页数的翻阅  -->
		<%//不足10页显示x页，超过10页，显示总页数 ,并加粗显示当前页数%>
		<div class="pg">
			<c:choose>
				<c:when test="${pagecount<=10}">
					<strong>${mypage}</strong>
					<c:forEach begin="${mypage+1}" end="${pagecount}" var="i">
						<a href="postweb.jsp?id=${pid}&page=${i}">${i}</a>
					</c:forEach>
					<a
				href="postweb.jsp?id=${pid}&page=${mypage+1}" class="nxt">下一页</a>
				</c:when>
				<c:when test="${pagecount>10}">
					<strong>${mypage}</strong>
					<c:forEach begin="${mypage+1}" end="${mypage+11}" var="i">
						<a href="postweb.jsp?id=${pid}&page=${i}">${i}</a>
					</c:forEach>
					<a href="postweb.jsp?id=${pid}&page=${pagecount}" class="last">... ${pagecount}</a>
					<label>
						<input type="text" name="custompage" class="px" size="2"
							title="输入页码，按回车快速跳转" value="1"
							onkeydown="if(event.keyCode==13) {window.location='postweb.jsp?id=${pid}&page='+this.value; doane(event);}">
							<span title="共 ${pagecount} 页"> / ${pagecount} 页</span>
					</label>
					<a href="postweb.jsp?id=${pid}&page=${mypage+1}" class="nxt">下一页</a>
				</c:when>					
			</c:choose>
		</div>
	</span> 
	<span class="pgb y"><a href="postweb.jsp?id=${pid}&page=${mypage-1}">返&nbsp;回</a></span>
</div>