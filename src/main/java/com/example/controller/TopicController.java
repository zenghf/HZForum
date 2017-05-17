package com.example.controller;

import com.example.model.Topic;
import com.example.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/")
public class TopicController {

    @Autowired
    private TopicService topicService;


    @RequestMapping("/listTopic")
    public String listTopic(Model model){
        List<Topic> topicList = topicService.listTopic();
        model.addAttribute("topicList",topicList);
        return "topic";
    }

    @PostMapping("/newTopic")
    @ResponseBody
    public String newTopic(@RequestParam("topic") String topic){
        topicService.insertTopic(topic);
        return "success";
    }

}





