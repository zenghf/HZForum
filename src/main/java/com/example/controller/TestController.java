package com.example.controller;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hzeng on 4/16/17.
 */
@Controller
public class TestController {
    @RequestMapping("/")
    String indexMapping(Model model){
        return "test";
    }
}
