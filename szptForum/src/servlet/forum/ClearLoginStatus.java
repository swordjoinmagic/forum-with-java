package servlet.forum;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 用于退出登录状态的servelet
 */

@WebServlet("/ClearLoginStatus.bin")
public class ClearLoginStatus extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie cookie = new Cookie("isLogin", "false");
		response.addCookie(cookie);
		cookie = new Cookie("username","");
		response.addCookie(cookie);
		response.sendRedirect("index.jsp");
	}
	
}
