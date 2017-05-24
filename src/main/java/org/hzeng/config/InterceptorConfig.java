package org.hzeng.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Created by hzeng on 4/19/17.
 */
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

    public class LoginInterceptor extends HandlerInterceptorAdapter {

        @Override
        public boolean preHandle(HttpServletRequest request,
                                 HttpServletResponse response,
                                 Object handler) throws Exception {
            if (request.getSession().getAttribute("uid") != null) {
                return true;
            }
            response.sendRedirect("/login?next=".concat(request.getRequestURI()));
            return false;
        }
    }


    // TODO: refactor using properties file
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] list = {"/upload", "/toMessage", "/toPublish", "/publishPost", "/ajaxClickLike", "/reply", "/comment", "/newTopic",
                "/toMyProfile", "/toEditProfile", "/editProfile", "/updatePassword", "/updateHeadUrl", "/follow", "/unfollow"};
        InterceptorRegistration registration = registry.addInterceptor(new LoginInterceptor());
        for (String pattern : list){
            registration.addPathPatterns(pattern);
        }
    }
}

