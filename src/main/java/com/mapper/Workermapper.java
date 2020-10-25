package com.mapper;

import com.daomain.Bill;
import com.daomain.Infor;
import com.daomain.Worker;
import org.apache.ibatis.annotations.Options;

import java.util.List;

public interface Workermapper {
    /*更新用户信息*/

   int updatewoker(Worker worker);
     /*返回worker对象*/
    Worker returnworker(String num);
    /*查询该账号下的所有维修订单*/
    List<Infor>  Listinfor(String workerid);
    /*工人修改密码*/
    int modifpass(String num,String password);
    /*查询正在维修的维修单*/
    List<Infor> infor_ing(String workerid);
    /*查询已维修的维修单*/
    List<Infor> infor_ok(String workerid);
    /*工人确认待维修的维修单*/
    int ok_infor(String num);
    /*工人完成维修单*/
    int success_infor(String num);
    /* 获取到当前最后一个订单号*/
    String billnum();
    /*工人添加新的Bill记录*/
    int insertbill(Bill bill);
    /* 查询对应工人账号小的报修单*/
    List<Bill> listbill(String workerid);
}
