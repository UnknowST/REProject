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
/*    @RequestMapping("searchuser")
    @ResponseBody()
    public List<User> test10(User user ){
    System.out.println(user);
    return adminservice.searchuser(user);
    }*/

    /*查询所有待分配的报修单*/
    @RequestMapping("/daiinfor")
    @ResponseBody
    public ModelAndView test4(Integer p){
        PageHelper.startPage(p,3);
        List<Infor> list=adminservice.daiinfor();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("没有相关的维修单");
            modelAndView.setViewName("A_seedaiinfor.jsp");
            modelAndView.addObject("message" ,message);

            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.setViewName("A_seedaiinfor.jsp");
        }
        return modelAndView;
    }
    /*查询所有待维修的报修单*/
    @RequestMapping("/waitinfor")
    @ResponseBody
    public ModelAndView test11(Integer p){
        PageHelper.startPage(p,3);
        List<Infor> list=adminservice.waitinfor();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前没有相关的维修单");
            modelAndView.setViewName("A_seewaitinfor.jsp");
            modelAndView.addObject("message" ,message);

            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.setViewName("A_seewaitinfor.jsp");
        }
        return modelAndView;
    }

    /*查询所有正在维修的报修单*/
    @RequestMapping("/inginfor")
    @ResponseBody
    public ModelAndView test12(Integer p){
        PageHelper.startPage(p,3);
        List<Infor> list=adminservice.inginfor();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前没有相关的维修单");
            modelAndView.setViewName("A_seeinginfor.jsp");
            modelAndView.addObject("message" ,message);

            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.setViewName("A_seeinginfor.jsp");
        }
        return modelAndView;
    }

    /*查询所有已维修的报修单*/
    @RequestMapping("/succinfor")
    @ResponseBody
    public ModelAndView test13(Integer p){
        PageHelper.startPage(p,3);
        List<Infor> list=adminservice.succinfor();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前没有相关的维修单");
            modelAndView.setViewName("A_succinfor.jsp");
            modelAndView.addObject("message" ,message);

            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.setViewName("A_succinfor.jsp");
        }
        return modelAndView;
    }

    /*查询所有已维修的报修单*/
    @RequestMapping("/searchuser")
    @ResponseBody
    public ModelAndView test14(User user,Integer p){
        PageHelper.startPage(p,3);
        List<User> list=adminservice.searchuser(user);
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("没有找到符合条件的对象");
            modelAndView.setViewName("A_searchuser.jsp");
            modelAndView.addObject("message" ,message);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<User> pageInfo = new PageInfo<User>(list);
            modelAndView.addObject("userlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("user",user);
            modelAndView.setViewName("A_searchuser.jsp");
        }
        return modelAndView;
    }

    /*查询所有已维修的报销单记录*/
    @RequestMapping("/billlist")
    @ResponseBody
    public ModelAndView test15(Integer p){
        PageHelper.startPage(p,3);
        List<Bill> list=adminservice.billlist();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前没有报销单记录");
            modelAndView.setViewName("A_seebill.jsp");
            modelAndView.addObject("message" ,message);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Bill> pageInfo = new PageInfo<Bill>(list);
            modelAndView.addObject("billlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("n",1);
            modelAndView.setViewName("A_seebill.jsp");
        }
        return modelAndView;
    }

    /*按条件搜索bill录*/
    @RequestMapping("/searchbills")
    @ResponseBody
    public ModelAndView test23(Bill bill,Integer p){
        PageHelper.startPage(p,3);
        List<Bill> list=adminservice.searchbill(bill);
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前没有符合条件的记录");
            modelAndView.setViewName("A_seebill.jsp");
            modelAndView.addObject("message" ,message);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Bill> pageInfo = new PageInfo<Bill>(list);
            modelAndView.addObject("billlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("bill",bill);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("n",2);
            modelAndView.setViewName("A_seebill.jsp");
        }
        return modelAndView;
    }

    /*查询所有已维修的报销单记录*/
    @RequestMapping("/deletebill")
    @ResponseBody
    public Message test16(String snum){

       int i=0;
        try {
            i=adminservice.deletebill(snum);
        } catch (Exception e) {
            i=-1;
        }

        if(i==1) {
            message.setFlag(1);
            message.setMessage("删除成功！");

        }else{
            message.setFlag(0);
            message.setMessage("删除失败，请重试！");
        }
        return message;
    }

    /*查询所有已维修的报销单记录*/
    @RequestMapping("/updatebill")
    @ResponseBody
    public Message test16(Bill bill){

        int i=0;
        try {
            i=adminservice.updatebill(bill);
        } catch (Exception e) {
            i=-1;
        }

        if(i==1) {
            message.setFlag(1);
            message.setMessage("修改成功！");

        }else{
            message.setFlag(0);
            message.setMessage("修改失败，请重试！");
        }
        return message;
    }
    /*查询所有已维修的报销单记录*/
    @RequestMapping("/insertuser")
    @ResponseBody
    public Message test17(String userid,String password,String sf){
        /*普通用户*/
        if("1".equals(sf)){
            User user=new User();
            user.setUserid(userid);
            user.setPassword(password);
            int i=0;
            try {
                i=adminservice.InsertUser(user);
            } catch (Exception e) {
                i=-1;
            }
            if(i==1) {
                message.setFlag(1);
                message.setMessage("添加成功！");

            }else{
                message.setFlag(0);
                message.setMessage("添加失败，请重试！");
            }
        }
        /*维修工人*/
        if("2".equals(sf)){
            Worker worker=new Worker();
            worker.setUserid(userid);
            worker.setPassword(password);
            int m=0;
            try {
                m=adminservice.InsertWorker(worker);
            } catch (Exception e) {
                m=-1;
            }
            if(m==1) {
                message.setFlag(1);
                message.setMessage("添加成功！");

            }else{
                message.setFlag(0);
                message.setMessage("添加失败，请重试！");
            }
        }

        return message;
    }

    /*查询所有的工人信息 并返回前端*/
    @RequestMapping("/listworkers")
    @ResponseBody
    public ModelAndView test18(Integer p){
        PageHelper.startPage(p,3);
        List<Worker> list=adminservice.listworker();
        List<Worker_type> list1=adminservice.typeList();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("当前还没有工人数据");
            modelAndView.setViewName("A_listworker.jsp");
            modelAndView.addObject("message" ,message);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Worker> pageInfo = new PageInfo<Worker>(list);
            modelAndView.addObject("workerlist",list);
            modelAndView.addObject("type",list1);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("n",1);
            modelAndView.setViewName("A_listworker.jsp");
        }
        return modelAndView;
    }
    /*查询所有已维修的报销单记录*/
    @RequestMapping("/deleteworker")
    @ResponseBody
    public Message test19(String num){

        int i=0;
        try {
            i=adminservice.deleteworker(num);
        } catch (Exception e) {
            i=-1;
        }
        if(i==1) {
            message.setFlag(1);
            message.setMessage("删除成功！");

        }else{
            message.setFlag(0);
            message.setMessage("删除失败，请重试！");
        }
        return message;
    }

    /*查询所有已维修的报销单记录*/
    @RequestMapping("/resetworker")
    @ResponseBody
    public Message test20(String num){

        int i=0;
        try {
            i=adminservice.resetworker(num);
        } catch (Exception e) {
            i=-1;
        }
        if(i==1) {
            message.setFlag(1);
            message.setMessage("重置成功！");

        }else{
            message.setFlag(0);
            message.setMessage("重置失败，请重试！");
        }
        return message;
    }
    /*管理员更新维修师傅的信息*/
    @RequestMapping("/updateworker")
    @ResponseBody
    public Message test21(Worker worker){

        int i=0;
        try {
            i=adminservice.updateworker(worker);
        } catch (Exception e) {
            i=-1;
        }
        if(i==1) {
            message.setFlag(1);
            message.setMessage("修改成功！");

        }else{
            message.setFlag(0);
            message.setMessage("修改失败，请重试！");
        }
        return message;
    }


    /*按条件搜索维修师傅数据*/
    @RequestMapping("/searchworkers")
    @ResponseBody
    public ModelAndView test22(Worker worker,Integer p){
        PageHelper.startPage(p,3);
        List<Worker> list=adminservice.searchworkers(worker);
        List<Worker_type> list1=adminservice.typeList();
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("没有找到符合条件的维修师傅信息");
            modelAndView.setViewName("A_listworker.jsp");
            modelAndView.addObject("message" ,message);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Worker> pageInfo = new PageInfo<Worker>(list);
            modelAndView.addObject("workerlist",list);
            modelAndView.addObject("type",list1);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("n",2);
            modelAndView.addObject("worker",worker);
            modelAndView.setViewName("A_listworker.jsp");
        }
        return modelAndView;
    }

}
