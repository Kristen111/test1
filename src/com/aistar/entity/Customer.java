package com.aistar.entity;

import java.util.Date;
import java.util.List;

public class Customer {
    private int custId;
    private String custName;
    private String custPwd;
    private String custGender;
    private long custTelno;
    private String custEmail;
    private Date custBirth;
    private String custCountry;
    private String custProvince;
    private String custCity;
    private String custProfile;
    private  String custSdasd;
    private int custScore;
    private int custLevel;
    private Date custRegistTime;
    private Date custUpdateTime;
    private int custStatus;
    private String others1;
    private String others2;



    //constructor
    public Customer(){}
    public Customer( String custName, String custPwd, String custGender, long custTelno, String custEmail){
        this.custName = custName;
        this.custPwd = custPwd;
        this.custGender = custGender;
        this.custTelno = custTelno;
        this.custEmail = custEmail;

    }
    public Customer(int custId, String custName, String custPwd, String custGender, long custTelno, String custEmail, Date custBirth, String custCountry, String custProvince, String custCity, String custProfile, String custSdasd, int custScore, int custLevel, Date custRegistTime, Date custUpdateTime, int custStatus, String others1, String others2) {
        this.custId = custId;
        this.custName = custName;
        this.custPwd = custPwd;
        this.custGender = custGender;
        this.custTelno = custTelno;
        this.custEmail = custEmail;
        this.custBirth = custBirth;
        this.custCountry = custCountry;
        this.custProvince = custProvince;
        this.custCity = custCity;
        this.custProfile = custProfile;
        this.custSdasd = custSdasd;
        this.custScore = custScore;
        this.custLevel = custLevel;
        this.custRegistTime = custRegistTime;
        this.custUpdateTime = custUpdateTime;
        this.custStatus = custStatus;
        this.others1 = others1;
        this.others2 = others2;
    }
    //getter setter

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPwd() {
        return custPwd;
    }

    public void setCustPwd(String custPwd) {
        this.custPwd = custPwd;
    }

    public String getCustGender() {
        return custGender;
    }

    public void setCustGender(String custGender) {
        this.custGender = custGender;
    }

    public long getCustTelno() {
        return custTelno;
    }

    public void setCustTelno(long custTelno) {
        this.custTelno = custTelno;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public Date getCustBirth() {
        return custBirth;
    }

    public void setCustBirth(Date custBirth) {
        this.custBirth = custBirth;
    }

    public String getCustCountry() {
        return custCountry;
    }

    public void setCustCountry(String custCountry) {
        this.custCountry = custCountry;
    }

    public String getCustProvince() {
        return custProvince;
    }

    public void setCustProvince(String custProvince) {
        this.custProvince = custProvince;
    }

    public String getCustCity() {
        return custCity;
    }

    public void setCustCity(String custCity) {
        this.custCity = custCity;
    }

    public String getCustProfile() {
        return custProfile;
    }

    public void setCustProfile(String custProfile) {
        this.custProfile = custProfile;
    }

    public String getCustSdasd() {
        return custSdasd;
    }

    public void setCustSdasd(String custSdasd) {
        this.custSdasd = custSdasd;
    }

    public int getCustScore() {
        return custScore;
    }

    public void setCustScore(int custScore) {
        this.custScore = custScore;
    }

    public int getCustLevel() {
        return custLevel;
    }

    public void setCustLevel(int custLevel) {
        this.custLevel = custLevel;
    }

    public Date getCustRegistTime() {
        return custRegistTime;
    }

    public void setCustRegistTime(Date custRegistTime) {
        this.custRegistTime = custRegistTime;
    }

    public Date getCustUpdateTime() {
        return custUpdateTime;
    }

    public void setCustUpdateTime(Date custUpdateTime) {
        this.custUpdateTime = custUpdateTime;
    }

    public int getCustStatus() {
        return custStatus;
    }

    public void setCustStatus(int custStatus) {
        this.custStatus = custStatus;
    }

    public String getOthers1() {
        return others1;
    }

    public void setOthers1(String others1) {
        this.others1 = others1;
    }

    public String getOthers2() {
        return others2;
    }

    public void setOthers2(String others2) {
        this.others2 = others2;
    }



    //toString


    @Override
    public String toString() {
        return "Customer{" +
                "custId=" + custId +
                ", custName='" + custName + '\'' +
                ", custPwd='" + custPwd + '\'' +
                ", custGender='" + custGender + '\'' +
                ", custTelno=" + custTelno +
                ", custEmail='" + custEmail + '\'' +
                ", custBirth=" + custBirth +
                ", custCountry='" + custCountry + '\'' +
                ", custProvince='" + custProvince + '\'' +
                ", custCity='" + custCity + '\'' +
                ", custProfile='" + custProfile + '\'' +
                ", custSdasd='" + custSdasd + '\'' +
                ", custScore=" + custScore +
                ", custLevel=" + custLevel +
                ", custRegistTime=" + custRegistTime +
                ", custUpdateTime=" + custUpdateTime +
                ", custStatus=" + custStatus +
                ", others1='" + others1 + '\'' +
                ", others2='" + others2 + '\'' +
                '}';
    }
}
