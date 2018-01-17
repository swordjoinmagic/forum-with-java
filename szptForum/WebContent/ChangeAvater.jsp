<%@page import="ado.DataBaseADO"%>
<%
	/*
		用于修改头像的jsp
	*/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="bean.forum.*" %>
<%
	DataBaseADO ado = DataBaseADO.getAdo();
	String username = "";
	// 获得上传头像的用户的名字（id）
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie:cookies) {
		if(cookie.getName().equals("username")) {
			username = cookie.getValue();
		}
	}
	if(!username.equals("")){
		// 根据用户名找到一名用户
		User user = ado.getUserwithId(username);
		pageContext.setAttribute("avateruser", user);
		System.out.println(user.getAvater());
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./CSS/style_11_common.css">
	<link rel="stylesheet" id="css_widthauto" type="text/css" href="./CSS/style_11_widthauto.css">
	<link rel="stylesheet" type="text/css" href="./CSS/temp_style.css">
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>
<div class="bm bw0">
<h1 class="mt">修改头像
</h1>
<!--don't close the div here-->
<form id="avatarform" enctype="multipart/form-data" method="post" action="/szptForum/UploadServlet" >
    <table cellspacing="0" cellpadding="0" class="tfm">
        <caption>
            <span id="retpre" class="y xi2"></span>
            <h2 class="xs2">当前我的头像</h2>
            <p>如果您还没有设置自己的头像，系统会显示为默认头像，您需要自己上传一张新照片来作为自己的个人头像 </p>
        </caption>
        <tbody><tr>
            <td>
                <img src="${avateruser.getAvater()}" onerror="this.onerror=null;this.src='https://rpg.blue/fux2.uc/images/noavatar_big.gif'">            </td>
        </tr>
    </tbody></table>

    <table cellspacing="0" cellpadding="0" class="tfm">
        <caption>
            <h2 class="xs2">设置我的新头像</h2>
            <p>请选择一个新照片进行上传编辑。<br>头像保存后，您可能需要刷新一下本页面(按F5键)，才能查看最新的头像效果 </p>
        </caption>
        <tbody><tr>
            <td>
                <div id="avatardesigner" style="border: 1px solid grey; padding: 10px; width: 450px; height: 253px;">
                    <div id="avatarfileselector">
                        选择图片:
                        <input type="file" name="file1" id="avatarfile" accept="image/*">
                        <input type="submit" name="upload" value="上传" />
                    </div> 
                </div>
            </td>
        </tr>
    </tbody></table>
</form>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style type="text/css">
    #slider .ui-state-default {
        background: white url(static/image/common/arrow_down_big.gif) no-repeat scroll 50% 50%;
        margin-top: -8px;
        border-width: 0px;
    }
</style>

</div>