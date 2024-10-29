package com.mosaek2.vintage.domain;

import java.time.LocalDateTime;

public class Cart {
    private int uid;
    private LocalDateTime date;
    private String fixCover;
    private String fixBrand;
    private String fixName;
    private String fixSize;
    private int fixPrice;
    private double fixDiscountRate;
    private int fixDiscountAmount;

    private Item item;
    private Member member;
    private Order order;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getFixCover() {
        return fixCover;
    }

    public void setFixCover(String fixCover) {
        this.fixCover = fixCover;
    }

    public String getFixBrand() {
        return fixBrand;
    }

    public void setFixBrand(String fixBrand) {
        this.fixBrand = fixBrand;
    }

    public String getFixName() {
        return fixName;
    }

    public void setFixName(String fixName) {
        this.fixName = fixName;
    }

    public String getFixSize() {
        return fixSize;
    }

    public void setFixSize(String fixSize) {
        this.fixSize = fixSize;
    }

    public int getFixPrice() {
        return fixPrice;
    }

    public void setFixPrice(int fixPrice) {
        this.fixPrice = fixPrice;
    }

    public double getFixDiscountRate() {
        return fixDiscountRate;
    }

    public void setFixDiscountRate(double fixDiscountRate) {
        this.fixDiscountRate = fixDiscountRate;
    }

    public int getFixDiscountAmount() {
        return fixDiscountAmount;
    }

    public void setFixDiscountAmount(int fixDiscountAmount) {
        this.fixDiscountAmount = fixDiscountAmount;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}