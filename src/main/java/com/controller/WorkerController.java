package com.controller;

import com.daomain.Infor;
import com.daomain.Message;
import com.daomain.Worker;
import com.service.Workerservice;
import com.service.impl.WorkerserviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<Infor> test2(String workerid){
        return workerservice.Listinfor(workerid);
    }

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

}
