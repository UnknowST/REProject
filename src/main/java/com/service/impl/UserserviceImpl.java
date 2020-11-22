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
    public User updateuser(User user) {

      int i= usermapper.updateuser(user);
      User user1=usermapper.returnuser(user.getNum());
      return user1;

    }

    @Override
    public Infor infor_num(Integer num) {
        return usermapper.infor_num(num);
    }

    @Override
    public int delete_infor(Integer num) {
        /*事务控制*/
        int i=usermapper.delete_infor(num);
        int j=usermapper.delete_replay(num);
        System.out.println( "..."+i+";;;;"+j);
        if(i==1&&j==1) return 1;
        else
        return 0;
    }

    @Override
    public int update_infor(Infor infor) {
        return usermapper.update_infor(infor);
    }

    @Override
    public int modif_pass(String num, String password) {
        return usermapper.modif_pass(num,password);
    }



    @Override
    public int updateevl(String num, String fenshu,String workerid,String comment) {
        int i=usermapper.updateevl(num,fenshu,workerid,comment);
        int j=usermapper.updatew_evl(workerid,fenshu);
        if (i==1&&j==1) return 1;
        else return 0;
    }

    @Override
    public List<Infor> infor_dai(String userid) {
        return usermapper.infor_dai(userid);
    }

    @Override
    public List<Infor> infor_ing(String userid) {

        return usermapper.infor_ing(userid);
    }

    @Override
    public List<Infor> infor_wait(String userid) {

        return usermapper.infor_wait(userid);
    }

    @Override
    public List<Infor> infor_eval(String userid) {
        return usermapper.infor_eval(userid);
    }

    @Override
    public int user_head(String userid,String headpath) {

        return usermapper.user_head(userid,headpath);
    }

    @Override
    public List<Infor> listInfor() {
        return usermapper.listInfor();
    }

    @Override
    public List<Infor> normalInfor(String userid) {
        return usermapper.normalInfor(userid);
    }

    @Override
    public List<Infor> infor_ok(String userid) {
        return usermapper.infor_ok(userid);
    }

}
