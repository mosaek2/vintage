package com.mosaek2.vintage.domain;

import java.time.LocalDateTime;

public class Post {
    private int uid;
    private String board;
    private String title;
    private String content;
    private LocalDateTime writeDate;
    private char deleteYn;
    private LocalDateTime deleteDate;
    private LocalDateTime modifyDate;
    private char fixYn;
    private char answerYn;

    private Member member;
    private Item item;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getBoard() {
        return board;
    }

    public void setBoard(String board) {
        this.board = board;
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

    public LocalDateTime getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(LocalDateTime writeDate) {
        this.writeDate = writeDate;
    }

    public char getDeleteYn() {
        return deleteYn;
    }

    public void setDeleteYn(char deleteYn) {
        this.deleteYn = deleteYn;
    }

    public LocalDateTime getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(LocalDateTime deleteDate) {
        this.deleteDate = deleteDate;
    }

    public LocalDateTime getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(LocalDateTime modifyDate) {
        this.modifyDate = modifyDate;
    }

    public char getFixYn() {
        return fixYn;
    }

    public void setFixYn(char fixYn) {
        this.fixYn = fixYn;
    }

    public char getAnswerYn() {
        return answerYn;
    }

    public void setAnswerYn(char answerYn) {
        this.answerYn = answerYn;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}