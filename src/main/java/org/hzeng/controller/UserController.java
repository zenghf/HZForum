package org.hzeng.controller;

import org.hzeng.model.Post;
import org.hzeng.model.User;
import org.hzeng.service.PostService;
import org.hzeng.service.QiniuService;
import org.hzeng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private QiniuService qiniuService;

    @Autowired
    private Environment env;

    @RequestMapping("/toMyProfile")
    public String toMyProfile(HttpSession session, Model model) {
        int sessionUid = (int) session.getAttribute("uid");
        User user = userService.getProfile(sessionUid, sessionUid);
        List<Post> postList =  postService.getPostList(sessionUid);
        model.addAttribute("user",user);
        model.addAttribute("postList",postList);
        return "myProfile";
    }

    @RequestMapping("/toProfile")
    public String toProfile(Integer uid, Model model, HttpSession session) {
        // profile of the logged in user
        Integer sessionUid = (Integer) session.getAttribute("uid");
        if(sessionUid != null && sessionUid.equals(uid)){
            return "redirect:toMyProfile";
        }
        boolean following = userService.getFollowStatus(sessionUid,uid);
        User user = userService.getProfile(sessionUid, uid);
        List<Post> postList =  postService.getPostList(uid);
        model.addAttribute("following",following);
        model.addAttribute("user",user);
        model.addAttribute("postList",postList);
        return "profile";
    }

    @RequestMapping("/toEditProfile")
    public String toEditProfile(HttpSession session, Model model){
        int uid = (int) session.getAttribute("uid");
        User user = userService.getEditInfo(uid);
        model.addAttribute("user",user);
        return "editProfile";
    }

    @RequestMapping("/editProfile")
    public String editProfile(User user){
        System.out.println(user);
        userService.updateUser(user);
        return "redirect:toMyProfile";
    }


    @RequestMapping("/updatePassword")
    public String updatePassword(String password, String newpassword, String repassword, HttpSession session, Model model){
        int sessionUid = (int) session.getAttribute("uid");
        String status = userService.updatePassword(password,newpassword,repassword,sessionUid);
        if(status.equals("ok")){
            return "redirect:logout";
        }else {
            model.addAttribute("passwordError",status);
            return "editProfile";
        }
    }



    @RequestMapping("/forgetPassword")
    public @ResponseBody
    String forgetPassword(String email){
        userService.forgetPassword(email);
        return "";
    }


    @RequestMapping("/afterForgetPassword")
    public String afterForgetPassword(){
        return "prompt/afterForgetPassword";
    }


    // TODO: implement update avatar
    @RequestMapping("/updateHeadUrl")
    public String updateHeadUrl(MultipartFile myFileName, Model model, HttpSession session) throws IOException {
        String[] allowedType = {"image/bmp", "image/gif", "image/jpeg", "image/png"};
        boolean allowed = Arrays.asList(allowedType).contains(myFileName.getContentType());
        if (!allowed) {
            model.addAttribute("error3","image format is can only be bmp，jpg，png，gif~");
            return "editProfile";
        }

        if (myFileName.getSize() > 3 * 1024 * 1024) {
            model.addAttribute("error3","image size should not exceed 3M");
            return "editProfile";
        }

        String filename = myFileName.getOriginalFilename();

        String fileNameExtension = filename.substring(filename.indexOf("."), filename.length());

        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;
        qiniuService.upload(myFileName.getBytes(), remoteFileName);


        int uid = (int) session.getAttribute("uid");
        userService.updateHeadUrl(uid,env.getProperty("qiniu.imageUrl") + remoteFileName);

        return "redirect:toMyProfile";
    }

    @RequestMapping("/follow")
    public String follow(int uid,HttpSession session){
        int sessionUid = (int) session.getAttribute("uid");
        userService.follow(sessionUid,uid);
        return "forward:toProfile";
    }

    @RequestMapping("/unfollow")
    public String unfollow(int uid,HttpSession session){
        int sessionUid = (int) session.getAttribute("uid");
        userService.unfollow(sessionUid,uid);
        return "forward:toProfile";
    }


    @RequestMapping("/verify")
    public String verify(String code){
        userService.verifyForgetPassword(code);
        return "redirect:login";
    }
}

