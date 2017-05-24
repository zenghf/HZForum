package org.hzeng.service;

import org.hzeng.mapper.MessageMapper;
import org.hzeng.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class MessageService {

    @Autowired
    private MessageMapper messageMapper;

    public Map<String, List<Message>> listMessageByUid(Integer sessionUid) {
        List<Message> messageList = messageMapper.listMessageByUid(sessionUid);
        Map<String, List<Message>> map = new HashMap<>();
        for(Message message : messageList){
            String time = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss").format(message.getMsgTime()).substring(0,11);
            if(map.get(time)==null){
                map.put(time,new LinkedList<Message>());
                map.get(time).add(message);
            }else{
                map.get(time).add(message);
            }
        }
        return map;
    }
}
