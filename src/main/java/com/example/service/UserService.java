package com.example.service;

import com.example.async.MailTask;
import com.example.mapper.UserMapper;
import com.example.model.Info;
import com.example.model.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Transaction;

import java.util.List;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private TaskExecutor taskExecutor;

    @Autowired
    private JedisPool jedisPool;

//    @Autowired
//    public UserService(JedisPool jedisPool){
//        this.jedisPool = jedisPool;
//    }

    public User getProfile(Integer sessionUid, Integer uid) {
        if(sessionUid!=uid){
            userMapper.updateScanCount(uid);
        }
        User user = userMapper.selectUserByUid(uid);
        Jedis jedis = jedisPool.getResource();
        user.setFollowCount((int)(long)jedis.scard(uid+":follow"));
        user.setFollowerCount((int)(long)jedis.scard(uid+":fans"));
        String likeCount = jedis.hget("vote",uid+"");
        if(likeCount==null){
            user.setLikeCount(0);
        }else {
            user.setLikeCount(Integer.valueOf(likeCount));
        }

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return user;
    }

    public User getEditInfo(int uid) {
        return userMapper.selectEditInfo(uid);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public void record(StringBuffer requestURL, String contextPath, String remoteAddr) {
        Info info = new Info();
        info.setRequestUrl(requestURL.toString());
        info.setContextPath(contextPath);
        info.setRemoteAddr(remoteAddr);
        userMapper.insertInfo(info);
    }

    public List<User> listUserByTime() {
        return userMapper.listUserByTime();
    }

    public List<User> listUserByHot() {
        return userMapper.listUserByHot();
    }

    public void updateHeadUrl(int uid, String headUrl) {
        userMapper.updateHeadUrl(uid,headUrl);
    }

    public void unfollow(int sessionUid, int uid) {
        Jedis jedis = jedisPool.getResource();
        Transaction tx = jedis.multi();
        tx.srem(sessionUid+":follow", String.valueOf(uid));
        tx.srem(uid+":fans", String.valueOf(sessionUid));
        tx.exec();

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
    }

    public void follow(int sessionUid, int uid) {
        Jedis jedis = jedisPool.getResource();
        Transaction tx = jedis.multi();
        tx.sadd(sessionUid+":follow", String.valueOf(uid));
        tx.sadd(uid+":fans", String.valueOf(sessionUid));
        tx.exec();
        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
    }

    public boolean getFollowStatus(Integer sessionUid, Integer uid) {
        if (sessionUid == null)
            return false;
        Jedis jedis = jedisPool.getResource();
        boolean following = jedis.sismember(sessionUid+":follow", String.valueOf(uid));
        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return following;
    }

    public String updatePassword(String password, String newpassword, String repassword, int sessionUid) {

        String oldPassword = userMapper.selectPasswordByUid(sessionUid);
        if(!oldPassword.equals(password)){
            return "The original password is not correct!";
        }

        if(newpassword.length()<6 ||newpassword.length()>20){
            return "The length of the new password must be within 6 and 20!";
        }

        if(!newpassword.equals(repassword)){
            return "You must repeat the new password!";
        }

        userMapper.updatePassword(newpassword,sessionUid);
        return "ok";
    }

    public void forgetPassword(String email) {
        String verifyCode = userMapper.selectVerifyCode(email);
        System.out.println("verifyCode:"+verifyCode);
        taskExecutor.execute(new MailTask(verifyCode,email,javaMailSender,2));
    }

    public void verifyForgetPassword(String code) {
        System.out.println("before renewing password："+code);
        userMapper.updatePasswordByActivateCode(code);
        System.out.println("after renewing passowrd："+code);
    }
}

