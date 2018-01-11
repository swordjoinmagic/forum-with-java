package servlet.forum;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import email.*;

// 处理邮箱验证码的servlet类
@WebServlet("/TreateCodeEamilHash.bin")
public class TreateCodeEamilHash extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//处理邮箱验证码的jsp页面
		
		// 获得邮箱账号
		String email = (String)request.getAttribute("email");
		
		System.out.println("email:"+email);
		
		//生成邮件
		EmailManager em = new EmailManager();
		
		//生成验证码
		int random = (int)(Math.random()*100000);
		String checknumber = String.valueOf(random);
		
		HttpSession session = request.getSession();
		
		//将该验证码保存在与用户的session中
		session.setAttribute("checknumber", checknumber);
		
		String sendmessage = "欢迎您使用注册账号功能，您需要在验证码框输入如下验证码完成操作:\n"+checknumber+"\n这是sjm的一次测试~";
		
		// 发送验证码邮件
		em.sendemail(email, sendmessage);
	}

}
