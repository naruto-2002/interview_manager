package org.mock.interview_managerment.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.mock.interview_managerment.entities.Offer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private final JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;


    public EmailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public void sendPasswordCreate(String toEmail, String username, String password) {
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
                    username, password, fromEmail
            ), true);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendPasswordResetEmail(String toEmail, String resetPasswordUrl) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("Password Reset");
            helper.setText(String.format(
                    "<html>" +
                            "  <body>" +
                            "    <p>We have just received a password reset request for <b>%s</b>.</p>" +
                            "    <p>Please click <a href=\"%s\">here</a> to reset your password.</p>" +
                            "    <p>For your security, the link will expire in 24 hours or immediately after you reset your password.</p>" +
                            "    <p>Thanks & Regards!</p>" +
                            "    <p>IMS Team.</p>" +
                            "  </body>" +
                            "</html>",
                    toEmail, resetPasswordUrl
            ), true);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendOfferEmail(String toEmail, Offer offer) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("Offer Details from IMS System");
            helper.setText(String.format(
                    "<html>" +
                            "  <body>" +
                            "    <p>Dear %s,</p>" +
                            "    <p>We are pleased to extend an offer for the position of <b>%s</b>.</p>" +
                            "    <p>Details of the offer are as follows:</p>" +
                            "    <ul>" +
                            "      <li>Position: %s</li>" +
                            "      <li>Department: %s</li>" +
                            "      <li>Contract Type: %s</li>" +
                            "      <li>Salary: %s</li>" +
                            "      <li>Start Date: %s</li>" +
                            "    </ul>" +
                            "    <p>Please review the attached offer letter and respond at your earliest convenience.</p>" +
                            "    <p>Best Regards,</p>" +
                            "    <p>IMS Team</p>" +
                            "  </body>" +
                            "</html>",
                    offer.getCandidate().getName(),
                    offer.getPosition(),
                    offer.getPosition(),
                    offer.getDepartment(),
                    offer.getContractType(),
                    offer.getBasicSalary(),
                    offer.getStartContract()
            ), true);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
