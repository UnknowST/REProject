package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Equipment {
    Integer snum;
    String num,eqname,model,address,attribute;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
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

    public String getEqname() {
        return eqname;
    }

    public void setEqname(String eqname) {
        this.eqname = eqname;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "snum=" + snum +
                ", num='" + num + '\'' +
                ", eqname='" + eqname + '\'' +
                ", model='" + model + '\'' +
                ", address='" + address + '\'' +
                ", attribute='" + attribute + '\'' +
                ", createdate=" + createdate +
                '}';
    }
}
