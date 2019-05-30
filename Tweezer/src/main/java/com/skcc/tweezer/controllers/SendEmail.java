//package com.skcc.tweezer.controllers;
//
//
//import java.util.*;
//import javax.mail.*;
//import javax.mail.internet.*;
//
//import com.skcc.tweezer.models.User;
// 
//public class SendEmail
//{
//   public void sendEmail(User user) {
//	   String username = "worldtweezer@gmail.com";
//       String password = "china123!";
//       Properties props = new Properties();
//       props.put("mail.smtp.auth", "true");
//       props.put("mail.smtp.starttls.enable", "true");
//       props.put("mail.smtp.host", "smtp.gmail.com");
//       props.put("mail.smtp.port", "587");
//       Session session = Session.getInstance(props,
//         new javax.mail.Authenticator() {
//           protected PasswordAuthentication getPasswordAuthentication() {
//               return new PasswordAuthentication(username, password);
//           }
//         });
//       try {
//           Message message = new MimeMessage(session);
//           message.setFrom(new InternetAddress("worldtweezer@gmail.com"));
//           message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(user.getEmail()));
//           //message.setRecipients(Message.RecipientType.CC,InternetAddress.parse("zhengxun890311@gmail.com"));
//          // message.setRecipients(Message.RecipientType.BCC,InternetAddress.parse("karensitu@ymail.com "));
//           message.setSubject("Hello,"+user.getFirstName());
//           message.setContent("<p>Thank you for joinging <h1>Tweezer</h1><p>Thank you</p><br/><img style='width:800px;height:500px;' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Playing_mafia_game.jpg/1200px-Playing_mafia_game.jpg'/>", "text/html;charset=UTF-8");
//           Transport.send(message);
//       } catch (MessagingException e) {
//           throw new RuntimeException(e);
//       }
//   }
//}