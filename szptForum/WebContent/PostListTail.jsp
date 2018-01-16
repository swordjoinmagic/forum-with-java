
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
	DataBaseADO ado = DataBaseADO.getAdo();
	int plateid = Integer.parseInt(request.getParameter("pid"));
	long count = ado.getPostCount(plateid);
	int mypage = Integer.parseInt(request.getParameter("page"));
	pageContext.setAttribute("pagecount", count/10);
	pageContext.setAttribute("pid", plateid);
	pageContext.setAttribute("mypage", mypage);

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
						<a href="PlateWeb.jsp?pid=${pid}&page=${i}">${i}</a>
					</c:forEach>
					<a
				href="PlateWeb.jsp?pid=${pid}&page=${mypage+1}" class="nxt">下一页</a>
				</c:when>
				<c:when test="${pagecount>10}">
					<strong>${mypage}</strong>
					<c:forEach begin="${mypage+1}" end="${mypage+11}" var="i">
						<a href="PlateWeb.jsp?pid=${pid}&page=${i}">${i}</a>
					</c:forEach>
					<a href="PlateWeb.jsp?pid=${pid}&page=${pagecount}" class="last">... ${pagecount}</a>
					<label>
						<input type="text" name="custompage" class="px" size="2"
							title="输入页码，按回车快速跳转" value="1"
							onkeydown="if(event.keyCode==13) {window.location='PlateWeb.jsp?pid=${pid}&page='+this.value; doane(event);}">
							<span title="共 ${pagecount} 页"> / ${pagecount} 页</span>
					</label>
					<a href="PlateWeb.jsp?pid=${pid}&page=${mypage+1}" class="nxt">下一页</a>
				</c:when>					
			</c:choose>
		</div>
		<!-- <div class="pg">
			<strong>1</strong><a href="http://rpg.blue/forum-605-2.html">2</a><a
				href="http://rpg.blue/forum-605-3.html">3</a><a
				href="http://rpg.blue/forum-605-4.html">4</a><a
				href="http://rpg.blue/forum-605-5.html">5</a><a
				href="http://rpg.blue/forum-605-6.html">6</a><a
				href="http://rpg.blue/forum-605-7.html">7</a><a
				href="http://rpg.blue/forum-605-8.html">8</a><a
				href="http://rpg.blue/forum-605-9.html">9</a><a
				href="http://rpg.blue/forum-605-10.html">10</a><a
				href="http://rpg.blue/forum-605-108.html" class="last">... 108</a><label><input
				type="text" name="custompage" class="px" size="2"
				title="输入页码，按回车快速跳转" value="1"
				onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=forumdisplay&amp;fid=605&amp;page='+this.value;; doane(event);}"><span
				title="共 108 页"> / 108 页</span></label><a
				href="http://rpg.blue/forum-605-2.html" class="nxt">下一页</a>
		</div>-->
	</span> 
	<span class="pgb y"><a href="PlateWeb.jsp?pid=${pid}&page=${mypage-1}">返&nbsp;回</a></span>
	<!-- 发帖 --> 
	<a href="CreatePost.jsp?pid=<%=request.getParameter("pid") %>" id="newspecialtmp"
		title="发新帖"><img src="Image/pn_post.png" alt="发新帖"></a>
</div>