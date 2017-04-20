package com.example.config;

import com.example.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by hzeng on 4/19/17.
 */
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] list = {"/toIndex.do", "/upload.do", "/toLogin.do", "/register.do", "/login.do", "/activate.do", "/logout.do", "/toPost.do", "/listTopic.do", "/listPostByTime.do", "/forgetPassword.do", "/afterForgetPassword.do", "/verify.do", "/listImage.do"};
        List<String> excludedUrls = Arrays.asList(list);
        LoginInterceptor interceptor = new LoginInterceptor();
        interceptor.setExcludedUrls(excludedUrls);
        registry.addInterceptor(interceptor);
//        registry.addInterceptor(new ThemeInterceptor()).addPathPatterns("/**").excludePathPatterns("/admin/**");
//        registry.addInterceptor(new SecurityInterceptor()).addPathPatterns("/secure/*");
    }
}

