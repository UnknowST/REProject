package com.mapper;

import com.daomain.Infor;
import com.daomain.Worker;
import com.daomain.Worker_type;

import java.util.List;
import java.util.Map;

public interface Adminmapper {
    /*查询所有的Infor记录*/
    List<Infor> listOf();
    /*获取所有工人的信息*/
    List<Worker> listworker();
    /*返回工种表数据*/
    List<Worker_type> typeList();
    /* 查询所有待维修的记录*/
    List<Infor> daiinfor();
    /*查询工人对应的待维修记录*/
    int  suminfor(String workerid);


}
