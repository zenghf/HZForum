package com.example.model;

import java.util.List;

public class Reply {

    private Integer rid;
    private String content;
    private Post post;
    private User user;
    private String replyTime;
    private List<Comment> commentList;

    public Reply() {}

    public Reply(Integer rid) {
        this.rid = rid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "rid=" + rid +
                ", content='" + content + '\'' +
                ", post=" + post +
                ", user=" + user +
                ", replyTime='" + replyTime + '\'' +
                ", commentList=" + commentList +
                '}';
    }
}
