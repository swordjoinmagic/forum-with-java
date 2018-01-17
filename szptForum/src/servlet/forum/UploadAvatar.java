package servlet.forum;

import java.io.IOException;

/*
 * 处理头像上传的servlet
 */

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationPart;

import ado.DataBaseADO;

import java.io.*;
import java.util.*;

@WebServlet("/UploadServlet")
@MultipartConfig(location="E:\\JavaInstance\\szptforum\\szptForum\\WebContent\\Image")
public class UploadAvatar extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DataBaseADO ado = DataBaseADO.getAdo();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username = "";
		// 获得上传头像的用户的名字（id）
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("username")) {
				username = cookie.getValue();
			}
		}
		
		Part p = request.getPart("file1");
		if(p.getContentType().contains("image")) {
			ApplicationPart ap = (ApplicationPart)p;
			
			int i = (int) (Math.random()*1000);
			p.write(username+i+".jpg");
			
			// 更新数据库中用户的头像地址
			ado.updateUserAvater("Image/"+username+i+".jpg", username);
			System.out.println("Image/"+username+i+".jpg");
			
			response.sendRedirect("ChangeAvater.jsp");
		}else {
			response.sendRedirect("ChangeAvater.jsp");
		}
	}
	
}
