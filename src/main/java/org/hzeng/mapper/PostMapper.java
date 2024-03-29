package org.hzeng.mapper;

import org.hzeng.model.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface PostMapper {

//    @Select("select uid,pid,title,publish_time from post where uid=#{uid}")
    List<Post> listPostByUid(int uid);

    int insertPost(Post post);

//    @Select("select u.uid,u.username,u.head_url,p.pid,p.title,p.publish_time,p.reply_time,p.reply_count,p.like_count,p.scan_count from post p " +
//            "join user u on p.uid = u.uid " +
//            "order by p.reply_time desc limit #{offset},#{limit}")
    List<Post> listPostByTime(@Param("offset") int offset, @Param("limit") int limit);
    List<Post> listPost(@Param("offset") int offset, @Param("limit") int limit, @Param("orderBy") String orderBy, @Param("tid") int tid);

    int selectPostCount(@Param("tid") int tid);

    Post getPostByPid(int pid);

    void updateReplyCount(int pid);

    void updateScanCount(int pid);

    void updateReplyTime(int pid);

    int getUidByPid(int pid);

    String getTitleByPid(int pid);

}
