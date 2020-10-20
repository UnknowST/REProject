package com.daomain;

public class Worker_type {
    /*工种实体类*/
    private  Integer num;
    private  String type;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Worker_type{" +
                "num=" + num +
                ", type='" + type + '\'' +
                '}';
    }
}
