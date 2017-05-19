package com.example.controller;

import com.example.model.*;
import com.example.service.PostService;
import com.example.service.ReplyService;
import com.example.service.TopicService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class PostController {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private TopicService topicService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/toPublish")
    public String toPublish(Model model){
        List<Topic> topicList = topicService.listTopic();
        model.addAttribute("topicList",topicList);
        return "publish";
    }

    @RequestMapping(value = "/publishPost", method = RequestMethod.POST)
    public String publishPost(Post post) {
        int id = postService.publishPost(post);
        return "redirect:toPost?pid="+id;
    }

    @RequestMapping("/listPostByTime")
    public String listPostByTime(int curPage,Model model){
        PageBean<Post> pageBean = postService.listPost(curPage, "time");
        List<User> userList = userService.listUserByTime();
        List<User> hotUserList = userService.listUserByHot();
        model.addAttribute("pageBean",pageBean);
        model.addAttribute("userList",userList);
        model.addAttribute("hotUserList",hotUserList);
        return "index";
    }

    @RequestMapping("/toPost")
    public String toPost(int pid, Model model, HttpSession session){
        Integer sessionUid = (Integer) session.getAttribute("uid");
        Post post = postService.getPostByPid(pid);
        List<Reply> replyList = replyService.listReply(pid);

        boolean liked = false;
        if(sessionUid!=null){
            liked = postService.getLikeStatus(pid,sessionUid);
        }
        model.addAttribute("post",post);
        model.addAttribute("replyList",replyList);
        model.addAttribute("liked",liked);
        return "post";
    }

    // TODO: implement ajax like button
    @RequestMapping(value = "/ajaxClickLike", produces = "text/plain;charset=UTF-8")
    public @ResponseBody
    String ajaxClickLike(int pid, HttpSession session){
        int sessionUid = (int) session.getAttribute("uid");
        return postService.clickLike(pid,sessionUid);
    }
}
