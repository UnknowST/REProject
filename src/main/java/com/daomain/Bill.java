package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Bill {
    private Integer snum;
    String num,cost,place,useing,workerid;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    Date createdate;

    public Integer getSnum() {
        return snum;
    }

    public void setSnum(Integer snum) {
        this.snum = snum;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getUseing() {
        return useing;
    }

    public void setUseing(String useing) {
        this.useing = useing;
    }

    public String getWorkerid() {
        return workerid;
    }

    public void setWorkerid(String workerid) {
        this.workerid = workerid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "snum=" + snum +
                ", num='" + num + '\'' +
                ", cost='" + cost + '\'' +
                ", place='" + place + '\'' +
                ", useing='" + useing + '\'' +
                ", workerid='" + workerid + '\'' +
                ", createdate=" + createdate +
                '}';
    }
}
