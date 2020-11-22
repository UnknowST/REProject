package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Infor {
    private  Integer num;
    private  String userid,place,equip,detail,imagepath1=null,imagepath2=null,imagepath3=null,imagepath4=null,imagepath5=null,evaluate,workerid,state,ad_replay;
    private String comment;
    //private  String []imagepaths=new String[5];
    private List<String> imagepaths=new ArrayList<String >();
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    Date createdate;

    private Replay replay;


    public List<String> getImagepaths() {
        return imagepaths;
    }
    public void setList(){
        if("null".equals(imagepath1)==false){
            imagepaths.add(imagepath1);
        }
        if("null".equals(imagepath2)==false){
            imagepaths.add(imagepath2);
        }
        if("null".equals(imagepath3)==false){
            imagepaths.add(imagepath3);
        }
        if("null".equals(imagepath4)==false){
            imagepaths.add(imagepath4);
        }
        if("null".equals(imagepath5)==false){
            imagepaths.add(imagepath5);
        }

    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAd_replay() {
        return ad_replay;
    }

    public void setAd_replay(String ad_replay) {
        this.ad_replay = ad_replay;
    }

    public void setImagepaths(List<String> imagepaths) {
        this.imagepaths = imagepaths;
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

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getEquip() {
        return equip;
    }

    public void setEquip(String equip) {
        this.equip = equip;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImagepath1() {
        return imagepath1;
    }

    public void setImagepath1(String imagepath1) {
        this.imagepath1 = imagepath1;
    }

    public String getImagepath2() {
        return imagepath2;
    }

    public void setImagepath2(String imagepath2) {
        this.imagepath2 = imagepath2;
    }

    public String getImagepath3() {
        return imagepath3;
    }

    public void setImagepath3(String imagepath3) {
        this.imagepath3 = imagepath3;
    }

    public String getImagepath4() {
        return imagepath4;
    }

    public void setImagepath4(String imagepath4) {
        this.imagepath4 = imagepath4;
    }

    public String getImagepath5() {
        return imagepath5;
    }

    public void setImagepath5(String imagepath5) {
        this.imagepath5 = imagepath5;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public String getWorkerid() {
        return workerid;
    }

    public void setWorkerid(String workerid) {
        this.workerid = workerid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Replay getReplay() {
        return replay;
    }

    public void setReplay(Replay replay) {
        this.replay = replay;
    }

    @Override
    public String toString() {
        return "Infor{" +
                "num=" + num +
                ", userid='" + userid + '\'' +
                ", place='" + place + '\'' +
                ", equip='" + equip + '\'' +
                ", detail='" + detail + '\'' +
                ", imagepath1='" + imagepath1 + '\'' +
                ", imagepath2='" + imagepath2 + '\'' +
                ", imagepath3='" + imagepath3 + '\'' +
                ", imagepath4='" + imagepath4 + '\'' +
                ", imagepath5='" + imagepath5 + '\'' +
                ", evaluate='" + evaluate + '\'' +
                ", workerid='" + workerid + '\'' +
                ", state='" + state + '\'' +
                ", imagepaths=" + imagepaths +
                ", createdate=" + createdate +
                ", replay=" + replay +
                '}';
    }
}
