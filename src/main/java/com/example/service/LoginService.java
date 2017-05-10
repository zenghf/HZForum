package com.example.service;

import com.example.async.MailTask;
import com.example.mapper.UserMapper;
import com.example.model.User;
import com.example.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class LoginService {


    @Autowired
    private UserMapper userMapper;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private TaskExecutor taskExecutor;

    // registration
    public String register(User user,String repassword) {

        // email address
        Pattern p = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$");
        Matcher m = p.matcher(user.getEmail());
        if(!m.matches()){
            return "Please input a correct email address!";
        }

        // password length
        p = Pattern.compile("^\\w{6,20}$");
        m = p.matcher(user.getPassword());
        if(!m.matches()){
            return "Password length must be between 6 and 20!";
        }

        // password repeat
        if(!user.getPassword().equals(repassword)){
            return "The password you input twice must be the same!";
        }

        // is the email address already registered
        int emailCount = userMapper.selectEmailCount(user.getEmail());
        if(emailCount>0){
            return "Your email address has already been registered!";
        }

        // new user
        user.setActived(0);
        String activateCode = MyUtil.createActivateCode();
        user.setActivateCode(activateCode);
        user.setJoinTime(MyUtil.formatDate(new Date()));
        user.setUsername("HZ_" + new Random().nextInt(10000));
        //TODO add head image url to settings
        user.setHeadUrl("/image/programmer.jpg");

        //TODO send email
        taskExecutor.execute(new MailTask(activateCode,user.getEmail(),javaMailSender,1));

        userMapper.insertUser(user);

        return "ok";
    }



    // login
    public Map<String,Object> login(User user) {

        Map<String,Object> map = new HashMap<>();
        Integer uid = userMapper.selectUidByEmailAndPassword(user);
        if(uid==null){
            map.put("status","no");
            map.put("error","User name or password error!");
            return map;
        }

//        TODO: fix email activation service
//        int checkActived = userMapper.selectActived(user);
//        if(checkActived==0){
//            map.put("status","no");
//            map.put("error","Your account is not yet activated, please find the activation email in your mailbox");
//            return map;
//        }

        String headUrl = userMapper.selectHeadUrl(uid);

        map.put("status","yes");
        map.put("uid",uid);
        map.put("headUrl",headUrl);
        return map;
    }

    public void activate(String activateCode) {
        userMapper.updateActived(activateCode);
    }
}
