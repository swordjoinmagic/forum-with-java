
<%
	/*
		用于展示论坛的头部信息
	*/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<style>
	html{
		background:url("Image/jungle.jpg");
	}
</style>
<div id="hd">
	<div class="wp">
		<!--大标题与登录注册部分-->
		<div class="hdc cl">
			<!--大标题-->
			<h2>
				<a href="index.jsp" title="Project1"><img
					src="https://rpg.blue/template/lightsail_mwt1/extend/img/logo.png" alt="Project1"
					border="0"></a>
			</h2>
			<!--登录&&注册-->
			<%
				// 如果已经登录了，那么显示用户信息，如果没有登录，显示要求登录和注册的框
				// 显示cookie的方法为${cookie.username.value}
			%>
			<c:choose>
				<c:when test="${isCreatePost==true}"></c:when>
				<c:when test="${cookie.isLogin.value==\"true\"}">
					<!--显示用户的框-->
					<div id="um">
						<!--用户头像-->
						<div>
							<a href="#" style="float:right;"><img
								src="https://rpg.blue/fux2.uc/data/avatar/000/11/02/81_avatar_small.jpg"
								onerror="#"></a>
						</div>
						<!--用户姓名与设置-->
						<p>
							<strong class="vwmy"><a
								href="http://rpg.blue/home.php?mod=space&amp;uid=110281"
								target="_blank" title="访问我的空间">${cookie.username.value} </a></strong> <span class="pipe">|</span>
							<a href="http://rpg.blue/home.php?mod=spacecp">设置</a> <span
								class="pipe">|</span> <a
								href="#">退出</a>
						</p>
						<p>
					
							<a href="#"
								id="g_upmine" class="showmenu">用户组: Lv1.咸鱼</a>
						</p>
					</div>				
				</c:when>


				<c:when test="${cookie.isLogin==null || cookie.isLogin.value==\"false\"}">
					<form method="post" id="lsform" action="Login.jsp">
						<div class="fastlg cl">
							<span id="return_ls" style="display: none"></span>
							<div class="y pns">
								<table cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td><label for="ls_username">帐号</label></td>
											<td><input type="text" name="username" id="ls_username"
												class="px vm xg1" value="UID/用户名/Email"
												onfocus="if(this.value == 'UID/用户名/Email'){this.value = '';this.className = 'px vm';}"
												onblur="if(this.value == ''){this.value = 'UID/用户名/Email';this.className = 'px vm xg1';}"
												tabindex="901"></td>
		
											<td>&nbsp;<a href="#">找回密码</a></td>
										</tr>
										<tr>
											<td><label for="ls_password">密码</label></td>
											<td><input type="password" name="password"
												id="ls_password" class="px vm" autocomplete="off"
												tabindex="902"></td>
											<td class="fastlg_l"><button type="submit" class="pn vm"
													tabindex="904" style="width: 75px;" href="Login.jsp">
													<em>登录</em>
												</button></td>
											<td>&nbsp;<a href="UserRegister.jsp"
												class="xi2 xw1" style="color:black;">注册会员</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>			
				</c:when>

			</c:choose>
		</div>

		<!--导航栏部分-->
		<div id="nv">
			<ul>
				<li id="mn_Nc927"><a href="#"
					hidefocus="true">搜索</a></li>
				<li id="mn_N9ec7"><a href="index.jsp"
					hidefocus="true">广场</a></li>
			</ul>
		</div>
		<div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div>
	</div>
</div>