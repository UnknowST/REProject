package com.controller;

import com.daomain.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Adminservice;
import com.service.impl.AdminserviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.security.MessageDigest;
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
    /*更新 infor表的分工*/
    @RequestMapping("uiworker")
    @ResponseBody
    public  Message test6(String num,String workerid){
        if(adminservice.uiworker(num,workerid)==1){
            message.setFlag(1);
            message.setMessage("分配成功");
        }else {
            message.setFlag(0);
            message.setMessage("分配失败");
        }
        return message;
    }

    /*查询所有的普通用户数据*/
    @RequestMapping("userlist")
    //@ResponseBody
    public ModelAndView test6(Integer p){
        //设置分页相关参数   当前页+每页显示的条数
        PageHelper.startPage(p,2);
         PageInfo<User> pageInfo = new PageInfo<User>(adminservice.userlist());
        System.out.println("当前页："+pageInfo.getPageNum());
        System.out.println("每页显示条数："+pageInfo.getPageSize());
        System.out.println("总条数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("上一页："+pageInfo.getPrePage());
        System.out.println("下一页："+pageInfo.getNextPage());
        System.out.println("是否是第一个："+pageInfo.isIsFirstPage());
        System.out.println("是否是最后一个："+pageInfo.isIsLastPage());
        ModelAndView modelAndView= new ModelAndView();
        modelAndView.addObject("userlist",adminservice.userlist());
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("alluser.jsp");
        return modelAndView;
       // return pageInfo;
    }
/*没用*/
/*    *//*测试分页助手在html的显示*//*
    @RequestMapping("alluser")
    //@ResponseBody
    public PageInfo test7(Integer p){
        //设置分页相关参数   当前页+每页显示的条数
        PageHelper.startPage(p,2);
        PageInfo<User> pageInfo = new PageInfo<User>(adminservice.userlist());
        System.out.println("当前页："+pageInfo.getPageNum());
        System.out.println("每页显示条数："+pageInfo.getPageSize());
        System.out.println("总条数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("上一页："+pageInfo.getPrePage());
        System.out.println("下一页："+pageInfo.getNextPage());
        System.out.println("是否是第一个："+pageInfo.isIsFirstPage());
        System.out.println("是否是最后一个："+pageInfo.isIsLastPage());
        return pageInfo;
    }*/
    @RequestMapping("deleteuser")
    @ResponseBody()
    public Message test8(String num){
        if(adminservice.deleteuser(num)==1){
            message.setFlag(1);
            message.setMessage("删除成功！");
        }else {
            message.setFlag(0);
            message.setMessage("删除失败，请重试！");
        }
        return message;
    }
    @RequestMapping("resetpass")
    @ResponseBody()
    public Message test9(String num){
        if(adminservice.resetpassword(num)==1){
            message.setFlag(1);
            message.setMessage("重置成功！");
        }else {
            message.setFlag(0);
            message.setMessage("重置失败，请重试！");
        }
        return message;
    }
    @RequestMapping("searchuser")
    @ResponseBody()
    public List<User> test10(User user ){
    System.out.println(user);
    return adminservice.searchuser(user);
    }

}
