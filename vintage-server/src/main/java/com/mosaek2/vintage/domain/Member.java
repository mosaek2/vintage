package com.mosaek2.vintage.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Member {
    private int uid;
    private String mail;
    private String password;
    private String phone;
    private String phoneAlt;
    private String name;
    private LocalDate birth;
    private char solarYn;
    private String gender;
    private String zip;
    private String address;
    private String addressDetail;
    private LocalDateTime joinDate;
    private int point;
    private int pointTotal;
    private String rank;
    private char smsYn;
    private char mailYn;
    private String authority;
    private String status;
    private LocalDateTime withdrawDate;
    private String refundBank;
    private String refundAccount;

    public Member() {
    }

    public Member(String mail, String password, String phone, String phoneAlt, String name, LocalDate birth,
                  char solarYn, String gender, String zip, String address, String addressDetail, char smsYn,
                  char mailYn, String refundBank, String refundAccount) {
        this.mail = mail;
        this.password = password;
        this.phone = phone;
        this.phoneAlt = phoneAlt;
        this.name = name;
        this.birth = birth;
        this.solarYn = solarYn;
        this.gender = gender;
        this.zip = zip;
        this.address = address;
        this.addressDetail = addressDetail;
        this.smsYn = smsYn;
        this.mailYn = mailYn;
        this.refundBank = refundBank;
        this.refundAccount = refundAccount;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoneAlt() {
        return phoneAlt;
    }

    public void setPhoneAlt(String phoneAlt) {
        this.phoneAlt = phoneAlt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirth() {
        return birth;
    }

    public void setBirth(LocalDate birth) {
        this.birth = birth;
    }

    public char getSolarYn() {
        return solarYn;
    }

    public void setSolarYn(char solarYn) {
        this.solarYn = solarYn;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public LocalDateTime getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDateTime joinDate) {
        this.joinDate = joinDate;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getPointTotal() {
        return pointTotal;
    }

    public void setPointTotal(int pointTotal) {
        this.pointTotal = pointTotal;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public char getSmsYn() {
        return smsYn;
    }

    public void setSmsYn(char smsYn) {
        this.smsYn = smsYn;
    }

    public char getMailYn() {
        return mailYn;
    }

    public void setMailYn(char mailYn) {
        this.mailYn = mailYn;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getWithdrawDate() {
        return withdrawDate;
    }

    public void setWithdrawDate(LocalDateTime withdrawDate) {
        this.withdrawDate = withdrawDate;
    }

    public String getRefundBank() {
        return refundBank;
    }

    public void setRefundBank(String refundBank) {
        this.refundBank = refundBank;
    }

    public String getRefundAccount() {
        return refundAccount;
    }

    public void setRefundAccount(String refundAccount) {
        this.refundAccount = refundAccount;
    }
}