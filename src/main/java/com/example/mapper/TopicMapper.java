package com.example.mapper;

import com.example.model.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TopicMapper {

    List<Topic> listTopic();

    Topic getTopicById(int tid);

    void insertTopic(String topic);

}
