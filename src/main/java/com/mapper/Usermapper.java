package com.mapper;

import com.daomain.Infor;
import com.daomain.User;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;
import java.util.UUID;

public interface Usermapper {
    List<User> findall();

    List<User> selecti();
    /*添加维修申报记录*/
    int  insertinfor(Infor infor);
    /*读取该用户所发布的维修记录*/
    List<Infor> findbyuserid(String userid);
    /*更新用户信息*/
    int updateuser(User user);
    /*为每一个新添加的维修记录创建一个回复表单*/
    int creatreplay(int inforid);
}
