package com.example.service;

import com.example.mapper.TopicMapper;
import com.example.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TopicService {


    @Autowired
    private TopicMapper topicMapper;

    public List<Topic> listTopic() {
        return topicMapper.listTopic();
    }

    public Topic getTopicById(int tid) {
        return topicMapper.getTopicById(tid);
    }

    public boolean insertTopic(String topic){
        topicMapper.insertTopic(topic);
        return true;
    }

}

