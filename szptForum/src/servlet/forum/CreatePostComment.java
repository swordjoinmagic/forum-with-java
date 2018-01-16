package servlet.forum;

import java.io.IOException;

/*
 * 用于处理发表评论的servlet
 */

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ado.DataBaseADO;

@WebServlet("/CreatePostComment.bin")
public class CreatePostComment extends HttpServlet{
	String postid;
	String editorValue;
	String author = "";
	String PostTitle;
	String plateid;
	
	// 检查数据的合法性
	public boolean vail() {
		if(editorValue==null || editorValue.equals("") || author==null || author.equals("")) {
			return false;
		}
		if(postid.equals("")) {
			System.out.println("postitle.equals('')"+PostTitle.equals(""));
			if(PostTitle.equals("") || plateid.equals("")) {
				return false;
			}
		}
		return true;
	}
	
	@Override
	protected void doPost(HttpServletRequest requests, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			requests.setCharacterEncoding("utf-8");
			DataBaseADO ado = DataBaseADO.getAdo();
			postid = requests.getParameter("postid");
			editorValue = requests.getParameter("editorValue");
			// 获得帖子作者
			Cookie[] cookies = requests.getCookies();
			for(Cookie cookie:cookies) {
				if(cookie.getName().equals("username")) {
					author = cookie.getValue();
				}
			}
			
			//判断是创建帖子还是对一个帖子发表评论，如果postid为空就是创建帖子，如果不为空，就是对一个帖子发表评论
			if(postid.equals("")) {
				//获得帖子标题
				PostTitle = requests.getParameter("posttitle");
				// 获得板块id
				plateid = requests.getParameter("plateid");
				
				System.out.println("posttitle:"+PostTitle);
				System.out.println("plateid:"+plateid);
				System.out.println("author:"+author);
				// 检查数据合法性，如果不合法那么重定向到发表帖子那个页面
				if(!vail()) {
					response.sendRedirect("CreatePost.jsp?plateid="+plateid);
					return;
				}
				
				// 向数据库中插入一个帖子
				ado.InsertPost(plateid, author, PostTitle);
				// 向数据库插入一个帖子评论
				int id = ado.getIDPostLast(Integer.parseInt(plateid));
				ado.InsertPostComment(id, author, editorValue);
				
				// 重定向到帖子页面
				response.sendRedirect("postweb.jsp?id="+id);
			}else {
				// 检查数据合法性，如果不合法那么重定向到发表帖子那个页面
				if(!vail()) {
					response.sendRedirect("CreatePost.jsp?postid="+postid);
					return;
				}
				// 对帖子发表评论
				ado.InsertPostComment(Integer.parseInt(postid), author, editorValue);
				// 重定向到帖子页面
				response.sendRedirect("postweb.jsp?id="+postid);				
			}
	}
	
}
