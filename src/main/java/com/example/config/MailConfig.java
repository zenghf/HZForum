package com.example.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import java.util.Properties;

/**
 * Created by hzeng on 4/19/17.
 */
@Configuration
@ConfigurationProperties("spring.mail")
public class MailConfig {

    private static JavaMailSenderImpl sender;

    private String host;
    private String username;
    private String password;
    Properties javaMailProperties;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Properties getJavaMailProperties() {
        return javaMailProperties;
    }

    public void setJavaMailProperties(Properties javaMailProperties) {
        this.javaMailProperties = javaMailProperties;
    }

    @Bean
    public JavaMailSenderImpl javaMailSender(){
        if (sender == null) {
            sender = new JavaMailSenderImpl();
            sender.setHost(host);
            sender.setUsername(username);
            sender.setPassword(password);
            sender.setJavaMailProperties(javaMailProperties);
        }
        return sender;
    }
}


//<bean id="javaMailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
//<property name="host" value="${mail.host}"/>
//<property name="username" value="${mail.username}"/>
//<property name="password" value="${mail.password}"/>
//<property name="javaMailProperties">
//<props>
//<prop key="mail.smtp.auth">true</prop>
//</props>
//</property>
//</bean>
