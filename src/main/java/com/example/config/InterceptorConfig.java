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

    // TODO: refactor interceptor
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] list = {"/toIndex", "/upload", "/toLogin", "/register", "/login", "/activate", "/logout", "/toPost", "/listTopic", "/listPostByTime", "/forgetPassword", "/afterForgetPassword", "/verify", "/listImage"};
        List<String> excludedUrls = Arrays.asList(list);
        LoginInterceptor interceptor = new LoginInterceptor();
        interceptor.setExcludedUrls(excludedUrls);
        registry.addInterceptor(interceptor);
//        registry.addInterceptor(new ThemeInterceptor()).addPathPatterns("/**").excludePathPatterns("/admin/**");
//        registry.addInterceptor(new SecurityInterceptor()).addPathPatterns("/secure/*");
    }
}

