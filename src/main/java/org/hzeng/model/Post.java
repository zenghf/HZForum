package org.hzeng.model;


public class Post {
    private Integer pid;
    private String title;
    private String content;
    private String publishTime;
    private String replyTime;
    private Integer replyCount;
    private Integer likeCount;
    private Integer scanCount;
    private User user;
    private Topic topic;

    public Post() {}

    public Post(Integer pid) {
        this.pid = pid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(Integer replyCount) {
        this.replyCount = replyCount;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public Integer getScanCount() {
        return scanCount;
    }

    public void setScanCount(Integer scanCount) {
        this.scanCount = scanCount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    @Override
    public String toString() {
        return "Post{" +
                "pid=" + pid +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", publishTime='" + publishTime + '\'' +
                ", replyTime='" + replyTime + '\'' +
                ", replyCount=" + replyCount +
                ", likeCount=" + likeCount +
                ", scanCount=" + scanCount +
                ", user=" + user +
                ", topic=" + topic +
                '}';
    }
}
