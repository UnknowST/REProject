package com.controller;

import com.daomain.Infor;
import com.daomain.Message;
import com.daomain.Worker;
import com.daomain.Worker_type;
import com.service.Adminservice;
import com.service.impl.AdminserviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private Adminservice adminservice;
   // private Adminservice  adminservice=new AdminserviceImpl();
    private Message message=new Message();

    /*查询所有的Infor信息记录*/
    @RequestMapping("/allinfor")
    @ResponseBody
    public List<Infor> test1(){
        return adminservice.listOf();
    }

    /*查询所有工人的信息*/
    @RequestMapping("/listworker")
    @ResponseBody
    public List<Worker> test3(){
        return adminservice.listworker();
    }

    /*查询所有工种的信息*/
    @RequestMapping("/typelist")
    @ResponseBody
    public List<Worker_type> test2(){
    System.out.println(adminservice.typeList());
        return adminservice.typeList();
    }
    /*查询所有待维修的报修单*/
    @RequestMapping("/daiinfor")
    @ResponseBody
    public List<Infor> test4(){
        return adminservice.daiinfor();
    }
    /*查询对应工人的正在维修的订单数*/
    @RequestMapping("suminfor")
    @ResponseBody
    public int  test5(String workerid){
        return  adminservice.suminfor(workerid);
    }
}
