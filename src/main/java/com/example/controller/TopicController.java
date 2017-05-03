package com.example.controller;

import com.example.model.Topic;
import com.example.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class TopicController {

    @Autowired
    private TopicService topicService;

    /**
     * 列出所有话题
     * @param model
     * @return
     */
    @RequestMapping("/listTopic")
    public String listTopic(Model model){
        List<Topic> topicList = topicService.listTopic();
        model.addAttribute("topicList",topicList);
        return "topic";
    }

    @RequestMapping("/listImage")
    public String listImage(Model model){
        List<String> imageList = topicService.listImage();
        model.addAttribute("imageList",imageList);
        return "image";
    }
}





