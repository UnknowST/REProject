package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Worker {
    private Integer num;
    private String userid,name,phone,gender,mail,password,position,workstate,sum_eval;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    Date createdate;

    private List<Infor>  inforList;

    public List<Infor> getInforList() {
        return inforList;
    }

    public void setInforList(List<Infor> inforList) {
        this.inforList = inforList;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getWorkstate() {
        return workstate;
    }

    public void setWorkstate(String workstate) {
        this.workstate = workstate;
    }

    public String getSum_eval() {
        return sum_eval;
    }

    public void setSum_eval(String sum_eval) {
        this.sum_eval = sum_eval;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Worker{" +
                "num=" + num +
                ", userid='" + userid + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", mail='" + mail + '\'' +
                ", password='" + password + '\'' +
                ", position='" + position + '\'' +
                ", workstate='" + workstate + '\'' +
                ", sum_eval='" + sum_eval + '\'' +
                ", createdate=" + createdate +
                ", inforList=" + inforList +
                '}';
    }
}
