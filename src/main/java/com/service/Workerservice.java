package com.service;

import com.daomain.Infor;
import com.daomain.Worker;

import java.util.List;

public interface Workerservice {
    /*更新用户信息*/
    Worker updatewoker(Worker worker);
    /*查询该账号下的所有维修订单*/
    List<Infor> Listinfor(String workerid);
    /*工人修改密码*/
    int modifpass(String num,String password);
}
