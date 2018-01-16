package servlet.forum;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ado.DataBaseADO;

/*
 * 用于创建楼中楼的servlet
 */
@WebServlet("/CreatePostCommentMiddleComment.bin")
public class CreatePostCommentMiddleComment extends HttpServlet{

	// 判断是否合法
	public boolean vail(String postid,String height,String editorvalue) {
		if(postid==null || postid.equals("") || height==null || height.equals("") || editorvalue==null || editorvalue.equals("")) {
			return false;
		}
		return true;
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		DataBaseADO ado = DataBaseADO.getAdo();
		String postid = request.getParameter("postid");
		String height = request.getParameter("height");
		String content = request.getParameter("editorValue");
		
		String username = "";
		
		// 获得帖子作者
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("username")) {
				username = cookie.getValue();
			}
		}
		if(vail(postid,height,content)) {
			ado.InsertPostCommentMiddleComment(Integer.parseInt(postid), Integer.parseInt(height), username, content);
			response.sendRedirect("postweb.jsp?id="+postid);
		}else {
			// 不合法重定向到首页
			response.sendRedirect("index.jsp");
		}
	}
	
}
