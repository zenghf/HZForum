package com.example.mapper;


import com.example.model.Message;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MessageMapper {

    void insertMessage(Message message);

    List<Message> listMessageByUid(Integer uid);


}
