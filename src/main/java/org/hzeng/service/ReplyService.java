package org.hzeng.service;


import org.hzeng.async.MessageTask;
import org.hzeng.mapper.MessageMapper;
import org.hzeng.mapper.PostMapper;
import org.hzeng.mapper.ReplyMapper;
import org.hzeng.mapper.UserMapper;
import org.hzeng.model.Comment;
import org.hzeng.model.Post;
import org.hzeng.model.Reply;
import org.hzeng.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ReplyService {

    private static final int OPERATION_REPLY = 2;
    private static final int OPERATION_COMMENT = 3;

    @Autowired
    private ReplyMapper replyMapper;

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private TaskExecutor taskExecutor;

    public void reply(int sessionUid, int pid, String content) {
        User user = new User(sessionUid);
        Post post = new Post(pid);
        Reply reply =new Reply();
        reply.setUser(user);
        reply.setPost(post);
        reply.setContent(content);
        replyMapper.insertReply(reply);
        postMapper.updateReplyCount(pid);
        postMapper.updateReplyTime(pid);
        taskExecutor.execute(new MessageTask(messageMapper,userMapper,postMapper,replyMapper,pid,0,sessionUid, OPERATION_REPLY));

    }

    public void comment(int pid,int sessionUid, int rid, String content) {
        User user = new User(sessionUid);
        Reply reply = new Reply(rid);
        Comment comment = new Comment();
        comment.setUser(user);
        comment.setReply(reply);
        comment.setContent(content);
        replyMapper.insertComment(comment);
        postMapper.updateReplyTime(pid);
        taskExecutor.execute(new MessageTask(messageMapper,userMapper,postMapper,replyMapper,pid,rid,sessionUid, OPERATION_COMMENT));

    }

    public List<Reply> listReply(int pid) {
        List<Reply> replyList = replyMapper.listReply(pid);
        for(Reply reply : replyList){
            List<Comment> commentList = replyMapper.listComment(reply.getRid());
            reply.setCommentList(commentList);
        }
        return replyList;
    }
}

