package com.example.service;


import com.example.async.MessageTask;
import com.example.mapper.MessageMapper;
import com.example.mapper.PostMapper;
import com.example.mapper.ReplyMapper;
import com.example.mapper.UserMapper;
import com.example.model.PageBean;
import com.example.model.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import java.util.List;


@Service
public class PostService {

    private static final int OPERATION_CLICK_LIKE = 1;

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ReplyMapper replyMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private TaskExecutor taskExecutor;

    public List<Post> getPostList(int uid) {
        return postMapper.listPostByUid(uid);
    }

    public int publishPost(Post post) {

//        post.setPublishTime(MyUtil.formatDate(new Date()));
//        post.setReplyTime(MyUtil.formatDate(new Date()));
        post.setReplyCount(0);
        post.setLikeCount(0);
        post.setScanCount(0);
        postMapper.insertPost(post);
        System.out.println(post.getPid());
        userMapper.updatePostCount(post.getUser().getUid());

        return post.getPid();
    }

    public PageBean<Post> listPostByTime(int curPage) {
        int limit = 8;
        int offset = (curPage-1) * limit;
        int allCount = postMapper.selectPostCount();
        int allPage = 0;
        if (allCount <= limit) {
            allPage = 1;
        } else if (allCount / limit == 0) {
            allPage = allCount / limit;
        } else {
            allPage = allCount / limit + 1;
        }
        List<Post> postList = postMapper.listPostByTime(offset,limit);
        Jedis jedis = jedisPool.getResource();
        for(Post post : postList){
            post.setLikeCount((int)(long)jedis.scard(post.getPid()+":like"));
        }

        PageBean<Post> pageBean = new PageBean<>(allPage,curPage);
        pageBean.setList(postList);

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return pageBean;
    }

    public Post getPostByPid(int pid) {
        postMapper.updateScanCount(pid);
        Post post =postMapper.getPostByPid(pid);
        Jedis jedis = jedisPool.getResource();
        long likeCount = jedis.scard(pid+":like");
        post.setLikeCount((int)likeCount);

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return post;
    }

    public String clickLike(int pid, int sessionUid) {
        Jedis jedis = jedisPool.getResource();
        jedis.sadd(pid+":like", String.valueOf(sessionUid));
        jedis.hincrBy("vote",sessionUid+"",1);
        taskExecutor.execute(new MessageTask(messageMapper,userMapper,postMapper,replyMapper,pid,0,sessionUid, OPERATION_CLICK_LIKE));
        String result = String.valueOf(jedis.scard(pid+":like"));

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return result;
    }

    public boolean getLikeStatus(int pid, int sessionUid) {
        Jedis jedis = jedisPool.getResource();
        boolean result = jedis.sismember(pid+":like", String.valueOf(sessionUid));

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return result;
    }
}

