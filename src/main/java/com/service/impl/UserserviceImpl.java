package com.service.impl;

import com.daomain.Infor;
import com.daomain.User;
import com.mapper.Usermapper;
import com.service.Userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserserviceImpl implements Userservice {
    @Autowired
    private Usermapper usermapper;

    @Override
    public List<User> findall() {

        return usermapper.findall();

    }



    @Override
    public List<User> selecti() {
        return usermapper.selecti();
    }

    @Override
    public int insertinfor(Infor infor) {
        //事务控制
         int i=usermapper.insertinfor(infor);
         int j=usermapper.creatreplay(infor.getNum());
         if(i==1&&j==1) return 1;
         else return 0;

    }

    @Override
    public List<Infor> findbyuserid(String userid) {
        return usermapper.findbyuserid(userid);
    }

    @Override
    public int updateuser(User user) {

       return  usermapper.updateuser(user);

    }

}
