package com.example.async;


import com.example.util.MyConstant;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import javax.mail.internet.MimeMessage;

public class MailTask implements Runnable {

    private String code;
    private String email;
    private JavaMailSender javaMailSender;
    private int operation;

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
                mimeMessageHelper.setFrom(MyConstant.MAIL_FROM);
                mimeMessageHelper.setTo(email);
                mimeMessageHelper.setSubject("HZForum activation");
                StringBuilder sb  = new StringBuilder();
                sb.append("<html><head></head><body>");

                if(operation==1){
                    sb.append("<a href="+MyConstant.DOMAIN_NAME+"activate?code=");
                    sb.append(code);
                    sb.append(">click to activate</a></body>");
                }else{
                    sb.append("are you willing to change your passowrd to:");
                    sb.append(code.substring(0,8));
                    sb.append("，<a href="+MyConstant.DOMAIN_NAME+"verify?code="+code+">");
                    sb.append(" Yes</a></body>");
                }

                mimeMessageHelper.setText(sb.toString(),true);

                System.out.println("finish sending email...");
            }
        });
    }
}








