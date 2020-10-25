package com.controller;

import com.daomain.Bill;
import com.daomain.Infor;
import com.daomain.Message;
import com.daomain.Worker;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Workerservice;
import com.service.impl.WorkerserviceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/worker")
public class WorkerController {
    @Autowired
    private Workerservice workerservice;
    private Message message=new Message();

    @RequestMapping("upinfor")
    @ResponseBody
    public Message test1(Worker worker, HttpServletRequest request) throws NullPointerException {
        Worker worker1=workerservice.updatewoker(worker);
        if(worker1!=null){
            request.getSession().setAttribute("user",worker1);
            message.setMessage("修改成功！");
            message.setFlag(1);
        }else {
            message.setFlag(0);
            message.setMessage("修改失败");
        }
        return message;
    }

    @RequestMapping("allinfor")
    @ResponseBody
    public ModelAndView test2(String workerid,Integer p){
        PageHelper.startPage(p,2);
        List<Infor> list=workerservice.Listinfor(workerid);
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0) {
            message.setFlag(0);
            message.setMessage("您还当前没有相关的维修单");
            modelAndView.setViewName("W_infordai.jsp");
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            modelAndView.setViewName("W_infordai.jsp");
        }
        return modelAndView;
    }
    /*查询正在维修的维修单*/
    @RequestMapping("infor_ing")
    @ResponseBody
    public ModelAndView test5(String workerid,Integer p){
        PageHelper.startPage(p,2);
        List<Infor> list = workerservice.infor_ing(workerid);
        ModelAndView modelAndView=new ModelAndView();
        if(list==null||list.size()==0) {
            message.setFlag(0);
            message.setMessage("您还当前没有相关的维修单");
            modelAndView.setViewName("W_inforing.jsp");
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            modelAndView.setViewName("W_inforing.jsp");
        }
        return modelAndView;
    }
    /*拆线呢已维修的维修单*/
    @RequestMapping("infor_ok")
    @ResponseBody
    public ModelAndView test6(String workerid,Integer p){
        PageHelper.startPage(p,2);
        List<Infor> list=workerservice.infor_ok(workerid);
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0||list==null) {
            message.setFlag(0);
            message.setMessage("您还当前没有相关的维修单");
            modelAndView.setViewName("W_inforok.jsp");
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            return modelAndView;
        }else{
            message.setFlag(1);
            PageInfo<Infor> pageInfo = new PageInfo<Infor>(list);
            modelAndView.addObject("inforlist",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            modelAndView.setViewName("W_inforok.jsp");
        }
        return modelAndView;
    }



    /*工人修改密码*/
    @RequestMapping("modifpass")
    @ResponseBody
    public Message test3(String num,String password){
    System.out.println(num+"..."+password);
          int   i=workerservice.modifpass(num,password);
        if(i==1) {
            message.setFlag(1);
            message.setMessage("密码修改成功,请重新登录");

        }else {
            message.setFlag(0);
            message.setMessage("密码修改失败，请重试");
        }

        return message;
    }
    /*工人确认待维修的维修单*/
    @RequestMapping("ok_infor")
    @ResponseBody
    public Message test7(String num){

        int   i=workerservice.ok_infor(num);
        if(i==1) {
            message.setFlag(1);
            message.setMessage("确认成功，请尽快维修");

        }else {
            message.setFlag(0);
            message.setMessage("确认失败，请重试");
        }
        return message;
    }

    /*工人完成维修*/
    @RequestMapping("success_infor")
    @ResponseBody
    public Message test8(String num){

        int   i=workerservice.success_infor(num);
        if(i==1) {
            message.setFlag(1);
            message.setMessage("维修已完成");

        }else {
            message.setFlag(0);
            message.setMessage("订单设置完成失败，请重试");
        }
        return message;
    }

    /*获取最新的bil单号*/
    @RequestMapping("bill_num")
    @ResponseBody
    public String test9(String num){
     return workerservice.billnum();
    }
    /*工人添加新的bill记录*/
    @RequestMapping("insertbill")
    @ResponseBody
    public Message test10(@Param("bill") Bill bill){
    System.out.println(bill);
    int i=0;
        try {
            i=workerservice.insertbill(bill);
        } catch (Exception e) {
            i=-1;
        }
        if(i==1){
            message.setFlag(1);
            message.setMessage("提交成功!");
        }else {
            message.setFlag(0);
            message.setMessage("提交失败，请重试");
        }
        return message;
    }

    /*查询工人账号下的报销单记录*/
    @RequestMapping("listbill")
    @ResponseBody
    public ModelAndView test11(String workerid,Integer p){
        PageHelper.startPage(p,2);
        List<Bill> list=workerservice.listbill(workerid);
        ModelAndView modelAndView=new ModelAndView();
        if(list.size()==0||list==null){
            message.setFlag(0);
            message.setMessage("当前账号下没有报销单记录");
            modelAndView.addObject("workerid",workerid);
            modelAndView.addObject("message",message);
            modelAndView.setViewName("W_seebill.jsp");
            return modelAndView;
        }else {
            message.setFlag(1);
            PageInfo<Bill> pageInfo = new PageInfo<Bill>(list);
            modelAndView.addObject("listbill",list);
            modelAndView.addObject("page",pageInfo);
            modelAndView.addObject("message" ,message);
            modelAndView.addObject("workerid",workerid);
            modelAndView.setViewName("W_seebill.jsp");
            
        }
        return modelAndView;
    }


}
