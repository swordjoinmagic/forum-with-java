<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
	<script src="JS/register.js"></script>
</head>
<form method="post" autocomplete="off" name="register" id="registerform" enctype="multipart/form-data" onsubmit="checksubmit();return false;" action="#">
	<div id="layer_reg" class="bm_c">
		<div class="mtw">
			<div id="reginfo_a">
				<div class="rfm">
					<table>
						<tbody>
							<tr>
								<th><span class="rq">*</span><label for="u6r66">用户名:</label></th>
								<td><input type="text" id="u6r66" name="username" class="px"
									tabindex="1" autocomplete="off" size="25" maxlength="15"
									required=""></td>
								<td class="tipcol"><i id="tip_u6r66" class="p_tip"
									style="display:inline;">用户名由 3 到 15 个字符组成</i>
								<kbd id="chk_u6r66" class="p_chk">
								</kbd></td>
							</tr>
						</tbody>
					</table>
				</div>
		
				<div class="rfm">
					<table>
						<tbody>
							<tr> 
								<th><span class="rq">*</span><label for="p6r66">密码:</label></th>
								<td><input type="password" id="p6r66" name="password" size="25"
									tabindex="1" class="px" required="" onchange=""></td>
								<td class="tipcol"><i id="tip_p6r66" class="p_tip"
									style="display:inline;">请填写密码, 最小长度为 8 个字符</i>
								<kbd id="chk_p6r66" class="p_chk"></kbd></td>
							</tr>
						</tbody>
					</table>
				</div>
		
				<div class="rfm">
					<table>
						<tbody>
							<tr>
								<th><span class="rq">*</span><label for="p26r66">确认密码:</label></th>
								<td><input type="password" id="p26r66" name="enterpassword"
									size="25" tabindex="1" value="" class="px" required=""></td>
								<td class="tipcol"><i id="tip_p26r66" class="p_tip"
									style="display: inline">请再次输入密码</i>
								<kbd id="chk_p26r66" class="p_chk"></kbd></td>
							</tr>
						</tbody>
					</table>
				</div>
		
				<div class="rfm">
					<table>
						<tbody>
							<tr>
								<th><span class="rq">*</span><label for="e6r66">Email:</label></th>
								<td>
									<input type="text" id="e6r66" name="email"
									autocomplete="off" size="25" tabindex="1" class="px" value=""
									required="">
								</td>
								<td class="tipcol"><i id="tip_e6r66" class="p_tip"
									style="display: inline;">请输入正确的邮箱地址</i>
								<kbd id="chk_e6r66" class="p_chk"></kbd></td>
							</tr>
						</tbody>
					</table>
				</div>
		
				<span id="secqaa_qSNkAWIA"><input name="secqaahash"
					type="hidden" value="qSNkAWIA"><div class="rfm">
							<table>
								<tbody>
									<tr>
										<th>
											<span class="rq">*</span>邮箱验证码:</th>
											<td>
												<input name="secanswer" id="secqaaverify_qSNkAWIA"
												type="text" autocomplete="off" style="width: 100px"
												class="txt px vm" required="">
												<a href="#" class="xi2" id="send_eamil_hashcode">发送验证码</a>
												<span id="checksecqaaverify_qSNkAWIA">
													<img src="static/image/common/none.gif" width="16" height="16" class="vm">
												</span>
											</td>
											<td class="tipcol">
												<i class="p_tip" style="display: inline;">将验证码发送至邮箱中</i>
											</td>
									</tr>
								</tbody>
							</table>
						</div>
				</span>
				
				<span id="seccode_cSNkAWIA"><input name="seccodehash" type="hidden" value="cSNkAWIA">
					<input name="seccodemodid" type="hidden" value="member::register">
					<div class="rfm">
						<table>
							<tbody>
								<tr>
									<th><span class="rq">*</span>验证码:</th>
									<td><input name="seccodeverify" id="seccodeverify_cSNkAWIA" type="text" autocomplete="off" style="ime-mode: disabled; width: 100px" class="txt px vm"  required=""
										onchange="getgraphiscode()">
										<a href="#" onclick="$(graphhashcode).attr('src',$(graphhashcode).attr('src')+'?'+Math.random());" class="xi2">换一个</a>
										<span id="checkseccodeverify_cSNkAWIA">
											<img src="static/image/common/none.gif" width="16" height="16"class="vm">
										</span><br>
											<span id="vseccode_cSNkAWIA">输入下图中的字符<br>
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
		
			</div>
		
		</div>
		
		<div id="layer_reginfo_b">
			<div class="rfm mbw bw0">
				<table width="100%">
					<tbody>
						<tr>
							<th>&nbsp;</th>
							<td><span id="reginfo_a_btn"> <em>&nbsp;</em>
								<button class="pn pnc" id="registerformsubmit" type="submit"
										name="regsubmit" value="true" tabindex="1">
										<strong>提交</strong>
									</button>
							</span></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>
