package com.controller;

import com.daomain.Message;
import com.daomain.User;
import com.daomain.Worker;
import com.service.LoginService;
import com.service.impl.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginController  {
    @Autowired
    LoginService loginService;
    private Message message=new Message();
    /*用户登录*/
    @RequestMapping("/test1")
    @ResponseBody
    public Message login(String userid,String password,String shenfen,HttpServletRequest request ,HttpServletResponse response) throws IOException {


        String flag=null;
         System.out.println(userid+ " "+password+" "+shenfen);
        if("1".equals(shenfen)==true){
            User user=new User();
            user.setUserid(userid);
            user.setPassword(password);
            User user1=loginService.Userlogin(user);
            if (user1!=null){
                flag="登录成功";
                Message.num=1;
                message.setFlag(1);
                request.getSession().setAttribute("user",user1);
            }else  {
                flag="密码或账号不正确";
                message.setFlag(0);
            }

        }
        if("2".equals(shenfen)==true){

            Worker worker=new Worker();
            worker.setUserid(userid);
            worker.setPassword(password);
            Worker worker1=loginService.Workerlogin(worker);
            if(worker1!=null)  {flag="登录成功";
                message.setFlag(1);
                Message.num=2;
                request.getSession().setAttribute("user",worker1);
            }
            else {flag="密码或账号不正确";
                message.setFlag(0);
            }
        } if("3".equals(shenfen)==true){
            if (userid.equals("admin")&&password.equals("12345")){
                flag="登录成功";
                message.setFlag(1);
                Message.num=3;
                request.getSession().setAttribute("name","admin");
                request.getSession().setAttribute("password","12345");
            }else
            {
                flag="密码或账号不正确";
                message.setFlag(0);
            }
        }
        System.out.println(flag);
        message.setMessage(flag);
        return message;
    }
    /*从seddion中返回普通用户数据*/
    @RequestMapping("/finduser")
    @ResponseBody
    public User test2(HttpServletRequest request){
           return  (User) request.getSession().getAttribute("user");
    }
    /*从session中返回工人数据*/
    @RequestMapping("/findworker")
    @ResponseBody
    public Worker test3(HttpServletRequest request){
          return (Worker) request.getSession().getAttribute("user");
    }

    /*用户注册*/
    @RequestMapping("/insert")
    @ResponseBody
    public Message insert(String userid,String password,String num) {
        int num1=Integer.parseInt(num);
    System.out.println(userid+" "+password);
        /*表示是插入普通用户*/
        if(num1==1){
            User user=new User();
            user.setUserid(userid);
            user.setPassword(password);
            int i=0;
            try {
                 i=loginService.insertuser(user);
            } catch (Exception e) {
                i=-1;
            }
            if(i==1){
                message.setFlag(1);
                message.setMessage("注册成功！");
            }else {
                message.setFlag(0);
                message.setMessage("注册失败！");
            }
        }if (num1==2){
            Worker worker=new Worker();
            worker.setUserid(userid);
            worker.setPassword(password);
            int i=0;
            try {
                i=loginService.insertworker(worker);
            } catch (Exception e) {
                i=-1;
            }
            if(i==1){
                message.setFlag(1);
                message.setMessage("注册成功！");
            }else {
                message.setFlag(0);
                message.setMessage("注册失败！");
            }
        }
        return message;

    }

    /*清除session 并退出*/
    @RequestMapping("/exit")
    public String test4(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return   "redirect:/manage.html" ;
    }


}
