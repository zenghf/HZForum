package com.example.controller;

import com.example.model.PageBean;
import com.example.model.Post;
import com.example.model.User;
import com.example.service.PostService;
import com.example.service.QiniuService;
import com.example.service.TopicService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private TopicService topicService;

    @Autowired
    private PostService postService;

    @Autowired
    private QiniuService qiniuService;

    @Autowired
    private Environment env;

    @RequestMapping(value = {"/toIndex", "/"})
    public String toIndex(@RequestParam("tid") Optional<Integer> tid,
                          @RequestParam("orderBy") Optional<String> orderBy,
                          @RequestParam("curPage") Optional<Integer> curPage,
                          Model model, HttpSession session, HttpServletRequest request){
        // System.out.println(request.getRemoteAddr());
        String order = orderBy.orElse("time");
        userService.record(request.getRequestURL(),request.getContextPath(),request.getRemoteAddr());
        PageBean<Post> pageBean = postService.listPost(curPage.orElse(1), order, tid.orElse(0));
        List<User> userList = userService.listUserByTime();
        List<User> hotUserList = userService.listUserByHot();
        String tidString = "";
        if (tid.isPresent())
            tidString = "tid=" + tid.get() + "&";
        if (tid.isPresent())
            model.addAttribute("tag", topicService.getTopicById(tid.get()).getName());
        model.addAttribute("order", order);
        model.addAttribute("pageBean",pageBean);
        model.addAttribute("userList",userList);
        model.addAttribute("hotUserList",hotUserList);
        model.addAttribute("tidString", tidString);

        return "index";
    }


    // upload image
    @RequestMapping(value = "/upload", method = {RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
    public
    @ResponseBody
    String upload(MultipartFile myFileName) throws IOException {

        // types of image
        String[] allowedType = {"image/bmp", "image/gif", "image/jpeg", "image/png"};
        boolean allowed = Arrays.asList(allowedType).contains(myFileName.getContentType());
        if (!allowed) {
            return "error: not supported!";
        }
        // size of the image should not exceed 3M
        if (myFileName.getSize() > 3 * 1024 * 1024) {
            return "error: image size should not exceed 3M!";
        }
        // file name
        String filename = myFileName.getOriginalFilename();
        String fileNameExtension = filename.substring(filename.indexOf("."), filename.length());
        // TODO: add file upload service
        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;

        qiniuService.upload(myFileName.getBytes(), remoteFileName);

        return env.getProperty("qiniu.imageUrl") + remoteFileName;
    }

}
