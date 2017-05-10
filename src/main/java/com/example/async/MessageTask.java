package com.example.async;


import com.example.mapper.MessageMapper;
import com.example.mapper.PostMapper;
import com.example.mapper.ReplyMapper;
import com.example.mapper.UserMapper;
import com.example.model.Message;
import com.example.model.User;

public class MessageTask implements Runnable {

    private static final int OPERATION_CLICK_LIKE = 1;
    private static final int OPERATION_REPLY = 2;
    private static final int OPERATION_COMMENT = 3;

    private MessageMapper messageMapper;
    private UserMapper userMapper;
    private PostMapper postMapper;
    private ReplyMapper replyMapper;
    private int pid;
    private int rid;
    private int sessionUid;
    private int operation;

    public MessageTask(MessageMapper messageMapper, UserMapper userMapper, PostMapper postMapper, ReplyMapper replyMapper, int pid, int rid, int sessionUid, int operation) {
        this.messageMapper = messageMapper;
        this.userMapper = userMapper;
        this.postMapper = postMapper;
        this.replyMapper = replyMapper;
        this.pid = pid;
        this.rid = rid;
        this.sessionUid = sessionUid;
        this.operation = operation;
    }

    @Override
    public void run() {
        Message message = new Message();
        int uid = postMapper.getUidByPid(pid);
        message.setUid(uid);

        User user = userMapper.selectUsernameByUid(sessionUid);
        message.setOtherId(user.getUid());
        message.setOtherUsername(user.getUsername());
        message.setPostId(pid);

        if(operation== OPERATION_CLICK_LIKE){
            message.setOperation("liked your post");
            message.setDisplayedContent(postMapper.getTitleByPid(pid));
        }else if(operation==OPERATION_REPLY){
            message.setOperation("replied your post");
            message.setDisplayedContent(postMapper.getTitleByPid(pid));
        }else if(operation==OPERATION_COMMENT){
            message.setOperation("commented your post");
            String content = replyMapper.getContentByRid(rid);
            message.setDisplayedContent(content.substring(content.indexOf("<p>") + 3,content.indexOf("</p>")));
        }

        messageMapper.insertMessage(message);
    }
}


