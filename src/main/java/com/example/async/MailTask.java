package com.example.async;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

public class MailTask implements Runnable {

    private String code;
    private String email;
    private JavaMailSender javaMailSender;
    private int operation;

    @Resource
    public Environment env;

    @Value("${spring.mail.username}")
    String MAIL_FROM;

    @Value("${spring.mail.domain}")
    String DOMAIN_NAME;

    public MailTask(String code, String email, JavaMailSender javaMailSender, int operation) {
        this.code = code;
        this.email = email;
        this.javaMailSender = javaMailSender;
        this.operation = operation;
    }

    @Override
    public void run() {
        javaMailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                System.out.println("start sending email...");
                MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
                mimeMessageHelper.setFrom(MAIL_FROM);
                mimeMessageHelper.setTo(email);
                mimeMessageHelper.setSubject("HZForum activation");
                StringBuilder sb  = new StringBuilder();
                sb.append("<html><head></head><body>");

                if(operation==1){
                    sb.append("<a href=" + DOMAIN_NAME + "activate?code=");
                    sb.append(code);
                    sb.append(">click to activate</a></body>");
                }else{
                    sb.append("are you willing to change your passowrd to:");
                    sb.append(code.substring(0,8));
                    sb.append("，<a href=" + DOMAIN_NAME + "verify?code="+code+">");
                    sb.append(" Yes</a></body>");
                }

                mimeMessageHelper.setText(sb.toString(),true);

                System.out.println("finish sending email...");
            }
        });
    }
}








