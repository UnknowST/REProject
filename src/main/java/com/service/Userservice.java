package com.service;

import com.daomain.Infor;
import com.daomain.User;

import java.io.IOException;
import java.util.List;

public interface Userservice {
    List<User> findall() ;

    List<User> selecti();
    /*添加维修申报记录*/
    int  insertinfor(Infor infor);
    /*读取该用户所发布的维修记录*/
    List<Infor> findbyuserid(String userid);
    /*更新用户信息*/
    int updateuser(User user);

}
