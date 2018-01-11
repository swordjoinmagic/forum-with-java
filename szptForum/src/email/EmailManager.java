package email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailManager {
	private Properties props;
	Session session;
	MimeMessage message;
	String emailaccout = "16240011@mail.szpt.edu.cn";
	String emailpassword = "Sz09043330";
	String emailsmtphost = "smtp.exmail.qq.com";
	public EmailManager(){
		
		//用于连接邮件服务器的参数配置
		props = new Properties();
		
		//使用的协议
		props.setProperty("mail.transport.protocol", "smtp");
		
		//发件人的邮箱的SMTP服务器地址设置
		props.setProperty("mail.smtp.host",emailsmtphost);
		
		//需要请求认证
		props.setProperty("mail.smtp.auth", "true");
		
		//ssl安全认证
		String port = "465";
		props.setProperty("mail.smtp.port", port);
		props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", port);
		
		//根据参数配置创建会话对象
		session = Session.getDefaultInstance(props);
//		session.setDebug(true);
	}
	
	public boolean sendemail(String receivemail,String content){
		try{
			//创建一封邮件
			message = createMimeMessage(session,content,receivemail);
			
			//根据Session获取邮件传输对象
			Transport transport = session.getTransport();
			
			transport.connect(this.emailaccout,this.emailpassword);
			
			//发送邮件
			transport.sendMessage(message, message.getAllRecipients());
		
			//关闭现有链接
			transport.close();
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	/**
	 * 依据以下参数创建出一篇邮件
	 * @param session 会话对象
	 * @param content 发送的内容
	 * @param receivemail 收件人的邮箱
	 * @return
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	public MimeMessage createMimeMessage(Session session,String content,String receivemail) throws UnsupportedEncodingException, MessagingException{
		//创建一封邮件
		MimeMessage message = new MimeMessage(session);
		
		//from:发件人
		message.setFrom(new InternetAddress(emailaccout,"faker_qq邮箱验证","UTF-8"));
		
		//to： 收件人
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receivemail,"用户","UTF-8"));
		
		//4.Subject
		message.setSubject("Faker_QQ邮箱验证","UTF-8");
		
		//5.Content：邮件正文
		message.setContent(content,"text/html;charset=UTF-8");
		
		//6.设置发件时间
		message.setSentDate(new Date());
		
		message.saveChanges();
		
		return message;
	}
}