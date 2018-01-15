<%
	// 登录页面
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="mn" id="main_message">
	<div class="bm">
		<div class="bm_h bbs">
			<span class="y"> <a href="member.php?mod=register" class="xi2">没有帐号？</a><a
				href="member.php?mod=register">注册会员</a>
			</span>
			<h3 class="xs2">登录</h3>
		</div>
		<div>

			<div id="main_messaqge_LHo41">
				<div id="layer_login_LHo41">
					<h3 class="flb">
						<em id="returnmessage_LHo41"> </em> <span></span>
					</h3>
					<form method="post" autocomplete="off" name="login"
						id="loginform_LHo41" class="cl"
						onsubmit="pwmd5('password3_LHo41');pwdclear = 1;ajaxpost('loginform_LHo41', 'returnmessage_LHo41', 'returnmessage_LHo41', 'onerror');return false;"
						action="member.php?mod=logging&amp;action=login&amp;loginsubmit=yes&amp;loginhash=LHo41">
						<div class="c cl">
							<input type="hidden" name="formhash" value="edd69a3c"> <input
								type="hidden" name="referer"
								value="https://rpg.blue/forum-21-1.html">
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><label for="username_LHo41">帐号:</label></th>
											<td><input type="text" name="username"
												id="username_LHo41" autocomplete="off" size="30"
												class="px p_fre" tabindex="1" value=""></td>
											<td class="tipcol"><a href="member.php?mod=register">注册会员</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><label for="password3_LHo41">密码:</label></th>
											<td><input type="password" id="password3_LHo41"
												name="password" onfocus="clearpwd()" size="30"
												class="px p_fre" tabindex="1"></td>
											<td class="tipcol"><a href="javascript:;"
												onclick="display('layer_login_LHo41');display('layer_lostpw_LHo41');"
												title="找回密码">找回密码</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th>安全提问:</th>
											<td><select id="loginquestionid_LHo41" width="213"
												name="questionid"
												onchange="if($('loginquestionid_LHo41').value > 0) {$('loginanswer_row_LHo41').style.display='';} else {$('loginanswer_row_LHo41').style.display='none';}">
													<option value="0">安全提问(未设置请忽略)</option>
													<option value="1">母亲的名字</option>
													<option value="2">爷爷的名字</option>
													<option value="3">父亲出生的城市</option>
													<option value="4">您其中一位老师的名字</option>
													<option value="5">您个人计算机的型号</option>
													<option value="6">您最喜欢的餐馆名称</option>
													<option value="7">驾驶执照最后四位数字</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="rfm" id="loginanswer_row_LHo41" style="display: none">
								<table>
									<tbody>
										<tr>
											<th>答案:</th>
											<td><input type="text" name="answer"
												id="loginanswer_LHo41" autocomplete="off" size="30"
												class="px p_fre" tabindex="1"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<span id="seccode_cSb3tr3t"><input name="seccodehash"
								type="hidden" value="cSb3tr3t"><input
								name="seccodemodid" type="hidden" value="member::logging">
							<div class="rfm">
									<table>
										<tbody>
											<tr>
												<th>验证码:</th>
												<td><input name="seccodeverify"
													id="seccodeverify_cSb3tr3t" type="text" autocomplete="off"
													style="ime-mode: disabled; width: 100px" class="txt px vm"
													onblur="checksec('code', 'cSb3tr3t', 0, null, 'member::logging')">
													<a href="javascript:;"
													onclick="updateseccode('cSb3tr3t');doane(event);"
													class="xi2">换一个</a><span id="checkseccodeverify_cSb3tr3t"><img
														src="static/image/common/none.gif" width="16" height="16"
														class="vm"></span><br>
												<span id="vseccode_cSb3tr3t">输入下图中的字符<br>
													<img onclick="updateseccode('cSb3tr3t')" width="100"
														height="32"
														src="misc.php?mod=seccode&amp;update=68166&amp;idhash=cSb3tr3t"
														class="vm" alt=""></span></td>
											</tr>
										</tbody>
									</table>
								</div></span>
							<script type="text/javascript" reload="1">
								updateseccode(
										'cSb3tr3t',
										'<div class="rfm"><table><tr><th><sec>: </th><td><sec><br /><sec></td></tr></table></div>',
										'member::logging');
							</script>


							<div class="rfm ">
								<table>
									<tbody>
										<tr>
											<th></th>
											<td><label for="cookietime_LHo41"><input
													type="checkbox" class="pc" name="cookietime"
													id="cookietime_LHo41" tabindex="1" value="2592000">自动登录</label></td>
										</tr>
									</tbody>
								</table>
							</div>

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
											<td><a href="javascript:;" id="custominfo_login_LHo41"
												class="y" initialized="true">&nbsp;<img
													src="static/image/common/info_small.gif" alt="帮助"
													class="vm"></a><a href="javascript:;"
												onclick="ajaxget('member.php?mod=clearcookies&amp;formhash=edd69a3c', 'returnmessage_LHo41', 'returnmessage_LHo41');return false;"
												title="清除痕迹" class="y">清除痕迹</a></td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</form>
				</div>
				<script src="data/cache/md5.js?r3j" type="text/javascript"
					reload="1"></script>
				<div id="layer_lostpw_LHo41" style="display: none;">
					<h3 class="flb">
						<em id="returnmessage3_LHo41">找回密码</em> <span></span>
					</h3>
					<form method="post" autocomplete="off" id="lostpwform_LHo41"
						class="cl"
						onsubmit="ajaxpost('lostpwform_LHo41', 'returnmessage3_LHo41', 'returnmessage3_LHo41', 'onerror');return false;"
						action="member.php?mod=lostpasswd&amp;lostpwsubmit=yes&amp;infloat=yes">
						<div class="c cl">
							<input type="hidden" name="formhash" value="edd69a3c"> <input
								type="hidden" name="handlekey" value="lostpwform">
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><span class="rq">*</span><label for="lostpw_email">Email:</label></th>
											<td><input type="text" name="email" id="lostpw_email"
												size="30" value="" tabindex="1" class="px p_fre"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="rfm">
								<table>
									<tbody>
										<tr>
											<th><label for="lostpw_username">用户名:</label></th>
											<td><input type="text" name="username"
												id="lostpw_username" size="30" value="" tabindex="1"
												class="px p_fre"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="rfm mbw bw0">
								<table>
									<tbody>
										<tr>
											<th></th>
											<td><button class="pn pnc" type="submit"
													name="lostpwsubmit" value="true" tabindex="100">
													<span>提交</span>
												</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div id="layer_message_LHo41" class="f_c blr nfl"
				style="display: none;">
				<h3 class="flb" id="layer_header_LHo41"></h3>
				<div class="c">
					<div class="alert_right">
						<div id="messageleft_LHo41"></div>
						<p class="alert_btnleft" id="messageright_LHo41"></p>
					</div>
				</div>

				<script type="text/javascript" reload="1">
					var pwdclear = 0;
					function initinput_login() {
						document.body.focus();
						if ($('loginform_LHo41')) {
							$('loginform_LHo41').username.focus();
						}
					}
					initinput_login();
					showPrompt('custominfo_login_LHo41', 'mouseover',
							'欢迎回到论坛！！', 4000);

					function clearpwd() {
						if (pwdclear) {
							$('password3_LHo41').value = '';
						}
						pwdclear = 0;
					}
				</script>
			</div>
		</div>
	</div>
</div>