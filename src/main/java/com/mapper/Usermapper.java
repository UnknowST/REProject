package com.mapper;

import com.daomain.Infor;
import com.daomain.User;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;
import java.util.UUID;

public interface Usermapper {

    /*添加维修申报记录*/
    int  insertinfor(Infor infor);
    /*读取该用户所发布的维修记录*/
    List<Infor> findbyuserid(String userid);
    /*更新用户信息*/
    int updateuser(User user);
    /*为每一个新添加的维修记录创建一个回复表单*/
    int creatreplay(int inforid);
    /*根据主键查找Infor记录*/
    Infor infor_num(Integer num);
    /*根据主键删除infor表单 */
    int delete_infor(Integer num);
    /*删除指定formid的replay表单*/
    int delete_replay(Integer inforid);
    /*用户修改infor表*/
    int update_infor(Infor infor);
    /*修改用户密码*/
    int modif_pass(String userid,String password);
    /*用户评分修改Infor表*/
    int updateevl(String num,String fenshu,String workerid);
    /*用户评分后修改工人数据表*/
    int updatew_evl(String num,String fenshu);

}
