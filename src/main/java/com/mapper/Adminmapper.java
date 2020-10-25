package com.mapper;

import com.daomain.Infor;
import com.daomain.User;
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
    /* 查询所有待分配的记录*/
    List<Infor> daiinfor();
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


}
