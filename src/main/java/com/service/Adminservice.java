package com.service;

import com.daomain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Adminservice {
    /*查询所有的Infor记录*/
    List<Infor> listOf();
    /*获取所有的工人信息*/
    List<Worker> listworker();
    /*返回工种表数据*/
    List<Worker_type> typeList();
    /* 查询所有待分配的记录*/
    List<Infor> daiinfor();
    /*查询待维修的维修及*/
    List<Infor> waitinfor();
    /*查询正在维修的维修记录*/
    List<Infor> inginfor();
    /*查询已维修的维修记录*/
    List<Infor> succinfor();
    /*查询工人对应的待维修记录*/
    int  suminfor(String workerid);
    /*infor表内记录添加分工的工人账号*/
    int  uiworker(String num,String workerid);
    /*查询所有的普通用户数据*/
    List<User> userlist();
    /*删除普通用户的账号*/
    int deleteuser(String num);
    /*密码重置  暂时先设置密码重置为一串指定的字符串吧 例如111111*/
    int resetpassword(String num);
    /*根据指定的条件搜索对应的user信息*/
    List<User> searchuser(User user );
    /*查看报销单记录*/
    List<Bill> billlist();
    /* 删除指定的报销单记录*/
    int deletebill(String snum);
    /*更新报销单记录*/
    int updatebill(Bill bill);
    /*添加普通用户*/
    int InsertUser(User user);
    /*添加维修师傅*/
    int InsertWorker(Worker worker);
    /*删除工人账号*/
    int deleteworker(String num );
    /*重置工人账号的密码*/
    int resetworker(String num);
    /*更新维修工人的信息*/
    int updateworker(Worker worker);
    /*按条件搜索维修师傅*/
    List<Worker> searchworkers(Worker worker);
    /*按条件搜索bill*/
    List<Bill> searchbill(Bill bill);
    /*管理员退回用户填写的维修申请*/
    int backinfor(@Param("num") String num, @Param("ad_replay")String ad_replay);
    /*查看维修失败的infor记录*/
    List<Infor> failinfor();
    /*查看被退回的infor记录*/
    List<Infor> A_backinfor();
    /*撤销退回操作*/
    int revoke(String num);
    /*读取设备数据信息*/
    List<Equipment> equipmentlist();
    /*设备出库*/
    int subequip(String snum,String num);
    /*设备入库*/
    int addequip(String snum,String num);
    /*删除设备*/
    int deleteequipment(String snum);
    /*添加设备*/
    int insertequipment(Equipment equipment);
    /*修改设备信息*/
    int updateequipment(Equipment equipment);
    /*查询现在最大的设备编号*/
    int maxeid();
    /*查询所有的公告信息*/
    List<Notice> noticelist();
    /*更新notice记录*/
    int updatenotice(Notice notice);
    /*删除notice*/
    int deletenotice(String num);
    /*添加notice记录*/
    int insertnotice(Notice notice);
    /*查询当前时间段中显示公告内容*/
    List<Notice> nownotice();
}
