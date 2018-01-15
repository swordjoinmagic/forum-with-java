
<%
	/*
		用于展示论坛的头部信息
	*/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<div id="hd">
	<div class="wp">
		<!--大标题与登录注册部分-->
		<div class="hdc cl">
			<!--大标题-->
			<h2>
				<a href="#" title="Project1"><img
					src="template/lightsail_mwt1/extend/img/logo.png" alt="Project1"
					border="0"></a>
			</h2>
			<!--登录&&注册-->
			<form method="post" autocomplete="off" id="lsform" action="#">
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

									<td>&nbsp;<a href="javascript:;"
										onclick="showWindow('login', 'member.php?mod=logging&amp;action=login&amp;viewlostpw=1')">找回密码</a></td>
								</tr>
								<tr>
									<td><label for="ls_password">密码</label></td>
									<td><input type="password" name="password"
										id="ls_password" class="px vm" autocomplete="off"
										tabindex="902"></td>
									<td class="fastlg_l"><button type="submit" class="pn vm"
											tabindex="904" style="width: 75px;">
											<em>登录</em>
										</button></td>
									<td>&nbsp;<a href="#"
										class="xi2 xw1">注册会员</a></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="quickforward" value="yes"> <input
							type="hidden" name="handlekey" value="ls">
					</div>
				</div>
			</form>
		</div>

		<!--导航栏部分-->
		<div id="nv">
			<ul>
				<li id="mn_Nc927"><a href="#"
					hidefocus="true">搜索</a></li>
				<li id="mn_N9ec7"><a href="#"
					hidefocus="true">广场</a></li>
			</ul>
		</div>
		<div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div>
	</div>
</div>