package misc;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class AutoSendEmailByJava {
	/*maven專案 下載這個jar 檔
	 使用gmail來測試"發信"
	 要先更改設定
	 [允許安全性較低的應用程式] 設定處於啟用狀態
	 如果有開啟兩段帳號登入驗證的 要先關閉才能更改此設定。
	  		<dependency>
			<groupId>javax.mail</groupId>
			<artifactId>javax.mail-api</artifactId>
			<version>1.6.0</version>
		</dependency>
				<dependency>
			<groupId>com.sun.mail</groupId>
			<artifactId>javax.mail</artifactId>
			<version>1.6.0</version>
		</dependency>*/
	
	public static void main(String[] args) {
		String host = "smtp.gmail.com";
		  int port = 587;
		  final String username = "tim810320@gmail.com";//你的email帳號
		  final String password = "";//你的email密碼 hwkvghriduixegcb

		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  Session session = Session.getInstance(props, new Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(username, password);
		   }
		  });

		  try {

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("tim810320@gmail.com"));//你的email帳號
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("apple14181923@gmail.com"));//你要寄給誰
		   message.setSubject("主旨");//主旨
		   message.setText("測試測試");//內文

		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);

		   System.out.println("寄送email結束.");

		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }
	}
	
	
	public static void processMemberWishNotice(String memberEmail, String subject, String text) throws UnsupportedEncodingException {//設計成靜態方法 
		String host = "smtp.gmail.com";
		  int port = 587;
		  final String username = "tim810320@gmail.com";//你的email帳號
		  final String password = "hwkvghriduixegcb";//你的email密碼

		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  Session session = Session.getInstance(props, new Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(username, password);
		   }
		  });

		  try {

			  MimeMessage message = new MimeMessage(session);
			    message.setSubject(subject, "UTF-8");
			    message.setText(text, "UTF-8");
		   message.setFrom(new InternetAddress("tim810320@gmail.com"));//你的email帳號
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memberEmail));//你要寄給誰
		//   message.setContent(text,"text/html;charset=UTF-8");
		  // message.setSubject(MimeUtility.encodeText(subject,"UTF-8","B"));//主旨
		//  message.setText(MimeUtility.encodeText(text,"UTF-8","B"));//內文
		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);

		   System.out.println("寄送email結束.");

		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }
	}
}
