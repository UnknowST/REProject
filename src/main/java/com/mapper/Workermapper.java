package com.mapper;

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
}
