package com.service;

import com.daomain.Infor;
import com.daomain.User;

import java.io.IOException;
import java.util.List;

public interface Userservice {
    /*添加维修申报记录*/
    int  insertinfor(Infor infor);
    /*读取该用户所发布的维修记录*/
    List<Infor> findbyuserid(String userid);
    /*更新用户信息*/
    User updateuser(User user);
    /*根据主键查找Infor记录*/
    Infor infor_num(Integer num);
    /*根据主键删除infor表单 */
    int delete_infor(Integer num);
    /*用户修改infor表*/
    int update_infor(Infor infor);
    /*修改用户密码*/
    int modif_pass(String num,String password);
    /*用户评分修改Infor表*/
    int updateevl(String num,String fenshu,String workerid);
    /*查询用户待分配的维修单*/
    List<Infor> infor_dai(String userid);
    /*查询用户正在维修的维修单*/
    List<Infor> infor_ing(String userid);
    /*查询用户待维修的维修单*/
    List<Infor> infor_wait(String userid);
    /*查询用户待评价的维修单*/
    List<Infor> infor_eval(String userid);


}
