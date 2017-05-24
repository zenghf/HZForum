package org.hzeng.mapper;


import org.hzeng.model.Comment;
import org.hzeng.model.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReplyMapper {

    void insertReply(Reply reply);

    List<Reply> listReply(int pid);

    void insertComment(Comment comment);

    List<Comment> listComment(Integer rid);

    String getContentByRid(int rid);

}
