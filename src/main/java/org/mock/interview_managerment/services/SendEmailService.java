package org.mock.interview_managerment.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class SendEmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    public void sendPasswordCreate(String toEmail, String password) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("no-reply-email-IMS-system <Account created>");
            helper.setText(String.format(
                    "<html>" +
                            "  <body>" +
                            "    <p>This email is from IMS system,</p>" +
                            "    <p>Your account has been created. Please use the following credential to login:</p>" +
                            "    <ul>" +
                            "      <li>User name: %s</li>" +
                            "      <li>Password: %s</li>" +
                            "    </ul>" +
                            "    <p>If anything wrong, please reach-out recruiter %s. We are so sorry for this inconvenience.</p>" +
                            "    <p>Thanks & Regards!</p>" +
                            "    <p>IMS Team.</p>" +
                            "  </body>" +
                            "</html>",
                    toEmail, password, fromEmail
            ), true);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
