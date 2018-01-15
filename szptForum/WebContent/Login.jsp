
<%
	// 登录页面
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<div class="mn" id="main_message">
	<div class="bm">
		<!-- 登录提示信息 -->
		<div class="bm_h bbs">
			<span class="y"> 
				<a href="#" class="xi2">没有帐号？</a>
				<a href="#">注册会员</a>
			</span>
			<h3 class="xs2">登录</h3>
		</div>

		<div>
			<div id="main_messaqge_LHo41">
				<div id="layer_login_LHo41">
					<!-- 留白 -->
					<h3 class="flb">
						<em id="returnmessage_LHo41"> </em> <span></span>
					</h3>
					
					<!-- 登录post -->
					<form method="post" name="login" id="loginform_LHo41" class="cl" action="checkLogin.bin">
						<div class="c cl">
							<!-- 账号 -->
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><label for="username_LHo41">帐号:</label></th>
											<td><input type="text" name="username"
												id="username_LHo41" size="30"
												class="px p_fre" tabindex="1" value=""></td>
											<td class="tipcol"><a href="#">注册会员</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 密码 -->
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><label for="password3_LHo41">密码:</label></th>
											<td><input type="password" id="password3_LHo41"
												name="password" onfocus="" size="30"
												class="px p_fre" tabindex="1"></td>
											<td class="tipcol"><a href="#"
												title="找回密码">找回密码</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 验证码 -->
							<span id="seccode_cSb3tr3t">
								<div class="rfm">
										<table>
											<tbody>
												<tr>
													<th>验证码:</th>
													<td>
														<input name="seccodeverify" id="seccodeverify_cSb3tr3t" type="text"
															style="ime-mode: disabled; width: 100px" class="txt px vm"
															onblur="#">
															<a href="#" onclick="$(graphhashcode).attr('src',$(graphhashcode).attr('src')+'?'+Math.random());" class="xi2">换一个</a>
															<span id="checkseccodeverify_cSb3tr3t">
																<img
																	src="static/image/common/none.gif" width="16" height="16"
																	class="vm"></span><br>
														<span id="vseccode_cSb3tr3t">输入下图中的字符<br>
															<img onclick="this.src=this.src+'?'+Math.random();" 
															width="100"
															height="32"
															src="/szptForum/vali.bin"
															class="vm" alt=""
															id = "graphhashcode">									
														</span>
													</td>
												</tr>
											</tbody>
										</table>
								</div>
							</span>
							<!-- 登录按钮 -->
							<div class="rfm mbw bw0">
								<table width="100%">
									<tbody>
										<tr>
											<th>&nbsp;</th>
											<td>
												<button class="pn pnc" type="submit" name="loginsubmit"
													value="true" tabindex="1">
													<strong>登录</strong>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>