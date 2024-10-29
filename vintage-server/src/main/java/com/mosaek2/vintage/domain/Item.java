package com.mosaek2.vintage.domain;

import java.time.LocalDateTime;

public class Item {
    private int uid;
    private LocalDateTime date;
    private String cover;
    private String detail;
    private String brand;
    private String name;
    private String size;
    private String sizeDetail;
    private int price;
    private double discountRate;
    private int discountAmount;
    private String condition;
    private String category1;
    private String category2;
    private String category3;
    private String gender;
    private char displayYn;
    private char mdYn;

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

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getSizeDetail() {
        return sizeDetail;
    }

    public void setSizeDetail(String sizeDetail) {
        this.sizeDetail = sizeDetail;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(double discountRate) {
        this.discountRate = discountRate;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getCategory3() {
        return category3;
    }

    public void setCategory3(String category3) {
        this.category3 = category3;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public char getDisplayYn() {
        return displayYn;
    }

    public void setDisplayYn(char displayYn) {
        this.displayYn = displayYn;
    }

    public char getMdYn() {
        return mdYn;
    }

    public void setMdYn(char mdYn) {
        this.mdYn = mdYn;
    }
}