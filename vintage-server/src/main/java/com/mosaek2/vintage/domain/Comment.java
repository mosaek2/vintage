package com.mosaek2.vintage.domain;

import java.time.LocalDateTime;

public class Comment {
    private int uid;
    private String content;
    private LocalDateTime write_date;
    private LocalDateTime modify_date;

    private Post post;
    private Member member;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getWrite_date() {
        return write_date;
    }

    public void setWrite_date(LocalDateTime write_date) {
        this.write_date = write_date;
    }

    public LocalDateTime getModify_date() {
        return modify_date;
    }

    public void setModify_date(LocalDateTime modify_date) {
        this.modify_date = modify_date;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}