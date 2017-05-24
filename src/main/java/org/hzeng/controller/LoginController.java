package org.hzeng.controller;


import org.hzeng.model.User;
import org.hzeng.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Optional;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/login")
    public String toLogin(@RequestParam("next") Optional<String> next){
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("next") Optional<String> next, User user, Model model, HttpSession session){
        Map<String,Object> map = loginService.login(user);
        if(map.get("status").equals("yes")){
            session.setAttribute("uid",map.get("uid"));
            session.setAttribute("headUrl",map.get("headUrl"));
            // return "rediect:/toMyProfile";
            return "redirect:".concat(next.orElse("/toMyProfile"));
        }else {
            model.addAttribute("email",user.getEmail());
            model.addAttribute("error",map.get("error"));
            return "login";
        }
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


