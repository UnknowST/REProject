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
    public int updateuser(User user) {

       return  usermapper.updateuser(user);

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
    public int modif_pass(String userid, String password) {
        return usermapper.modif_pass(userid,password);
    }



    @Override
    public int updateevl(String num, String fenshu,String workerid) {
        int i=usermapper.updateevl(num,fenshu,workerid);
        int j=usermapper.updatew_evl(workerid,fenshu);
        if (i==1&&j==1) return 1;
        else return 0;
    }

}
