package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Replay {
    private Integer num;
    private String inforid,workerid,detail;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    Date createdate;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getInforid() {
        return inforid;
    }

    public void setInforid(String inforid) {
        this.inforid = inforid;
    }

    public String getWorkerid() {
        return workerid;
    }

    public void setWorkerid(String workerid) {
        this.workerid = workerid;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Replay{" +
                "num=" + num +
                ", inforid='" + inforid + '\'' +
                ", workerid='" + workerid + '\'' +
                ", detail='" + detail + '\'' +
                ", createdate=" + createdate +
                '}';
    }
}
