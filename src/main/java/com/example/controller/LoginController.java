package com.example.controller;


import com.example.model.User;
import com.example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user, String repassword, Model model){
        String result = loginService.register(user,repassword);
        if(result.equals("ok")){
            model.addAttribute("info","An email was sent to your registered email address, you can login after verification your email address");
            return "prompt/promptInfo";
        }else {
            model.addAttribute("register","yes");
            model.addAttribute("email",user.getEmail());
            model.addAttribute("error",result);
            return "login";
        }
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session){
        Map<String,Object> map = loginService.login(user);
        if(map.get("status").equals("yes")){
            session.setAttribute("uid",map.get("uid"));
            session.setAttribute("headUrl",map.get("headUrl"));
            return "redirect:toMyProfile";
        }else {
            model.addAttribute("email",user.getEmail());
            model.addAttribute("error",map.get("error"));
            return "login";
        }
    }

    @RequestMapping(value = "/activate")
    public String activate(String code,Model model){
        loginService.activate(code);

        model.addAttribute("info","Your account is activated, you can log in now!");
        return "prompt/promptInfo";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("uid");
        return "redirect:toIndex";
    }
}


