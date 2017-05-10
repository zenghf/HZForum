package com.example.model;

import java.util.Date;

public class Message {

    private Integer mid;
    private Integer uid;
    private Integer otherId;
    private String otherUsername;
    private String operation;
    private Integer postId;
    private String displayedContent;

    private Date MsgTime;

    public Message() {}


    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOtherId() {
        return otherId;
    }

    public void setOtherId(Integer otherId) {
        this.otherId = otherId;
    }

    public String getOtherUsername() {
        return otherUsername;
    }

    public void setOtherUsername(String otherUsername) {
        this.otherUsername = otherUsername;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getDisplayedContent() {
        return displayedContent;
    }

    public void setDisplayedContent(String displayedContent) {
        this.displayedContent = displayedContent;
    }

    public Date getMsgTime() {
        return MsgTime;
    }

    public void setMsgTime(Date msgTime) {
        MsgTime = msgTime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mid=" + mid +
                ", uid=" + uid +
                ", otherId=" + otherId +
                ", otherUsername='" + otherUsername + '\'' +
                ", operation='" + operation + '\'' +
                ", postId=" + postId +
                ", displayedContent='" + displayedContent + '\'' +
                ", MsgTime=" + MsgTime +
                '}';
    }
}
