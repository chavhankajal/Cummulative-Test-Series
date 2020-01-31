package com.training.utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {

	public static boolean sendEmail(String email, String subject, String msg)
	{
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties=new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		try
		{
			Message message=new MimeMessage(session);
			//message.setFrom(new InternetAddress("nagargandhi00@gmail.com"));
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject(subject);
		    message.setText(msg);
			Transport.send(message);
            System.out.println("Done");
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
		
		
		
	}
	
	
	
	public static boolean sendEmail(String email, String msg)
	{
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties=new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		try
		{
			Message message=new MimeMessage(session);
			//message.setFrom(new InternetAddress("nagargandhi00@gmail.com"));
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject("Internship Details");
		    message.setText(msg);
			Transport.send(message);
            System.out.println("Done");
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
		
		
		
	}

}
