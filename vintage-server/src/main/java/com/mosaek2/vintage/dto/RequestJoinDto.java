package com.mosaek2.vintage.dto;

import java.time.LocalDate;

public class RequestJoinDto {
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
    private char smsYn;
    private char mailYn;
    private String refundBank;
    private String refundAccount;

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