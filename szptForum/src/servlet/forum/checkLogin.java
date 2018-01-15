package servlet.forum;

import java.io.IOException;

/*
 *	用来检查登录的servlet，检查账号，密码，验证码，是否正确，正确就重定向到首页，同时发送cookies
 *	给用户，cookies={
 *		isLogin:true;
 *		username:账号;
 *		eamil:邮箱;
 *	} 
 *  如果不正确，重定向回登录页面
 * 
 */

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ado.DataBaseADO;

@WebServlet("/checkLogin.bin")
public class checkLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String seccodeverify = request.getParameter("seccodeverify");
		// 查询数据库，查看是否用户名和密码正确
		DataBaseADO ado = DataBaseADO.getAdo();
		if(!ado.checkUserAndPassword(username, password)) {
			response.getWriter().println("<script>alert('用户名或密码出错');</script>");
			System.out.println("用户名或密码错误");
			response.sendRedirect("Login.jsp");
			return;
		}
		// 检查验证码是否填写正确
		HttpSession session = request.getSession();
		String true_graphcode = (String) session.getAttribute("graphhashcode");
		//将两个验证码都变成小写字母，然后比较
		true_graphcode = true_graphcode.toLowerCase();
		seccodeverify = seccodeverify.toLowerCase();
		if(!true_graphcode.equals(seccodeverify)) {
			response.getWriter().println("<script>alert('验证码出错');</script>");
			System.out.println("验证码错误");
			response.sendRedirect("Login.jsp");
			return;			
		}
		
		// 经过两轮检查，验证码和用户名和密码都正确，重定向到首页,同时为用户增加cookie
		Cookie cookie = new Cookie("username", username);
		Cookie cookie2 = new Cookie("isLogin", "true");
		response.addCookie(cookie);
		response.addCookie(cookie2);
		response.sendRedirect("index.jsp");
	}
	
}
