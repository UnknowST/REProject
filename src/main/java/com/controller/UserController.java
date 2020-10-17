package com.controller;

import com.daomain.Infor;
import com.daomain.Message;
import com.daomain.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.Userservice;
import com.service.impl.UserserviceImpl;


import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController  {
    @Autowired
    private Userservice userservice=new UserserviceImpl();
    private Message message=new Message();

    @RequestMapping("/update")
    public Message saveuser(User user){
   /*     Map<String, String[]> map = request.getParameterMap();
        User user=new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }*/
         System.out.println("save");
         System.out.println(user);
        int i=0;
        try {
            i= userservice.updateuser(user);
        } catch (Exception e) {
            i=-1;
        }
        if(i==1){
            message.setFlag(1);
            message.setMessage("修改成功！");
        }else{
            message.setFlag(0);
            message.setMessage("修改失败，请重试");
        }
        return message;
    }





    /*文件上传方法*/
    @RequestMapping("/upfile")
    @ResponseBody
    public  Message test5(@RequestParam("file")MultipartFile file,@RequestParam("userid") String userid,@RequestParam("place")String place,
                          @RequestParam("equip")String equip,@RequestParam("detail")String detail,
                          HttpServletRequest request){
    if (!file.isEmpty()) {
        Infor info=new Infor();
        //保存到数据库中的路径
        String sqlpath=null;
        //实际路径
        String truepath=null;
        String originalFilename = file.getOriginalFilename();
        System.out.println(originalFilename);

        System.out.println(userid);
        //生成uuid作为文件名称
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        //获得文件类型（可以判断如果不是图片，禁止上传）
        String contentType=file.getContentType();
        //获得文件后缀名
        String suffixName=contentType.substring(contentType.indexOf("/")+1);
        //得到新的文件名
        String newfilename=uuid+"."+suffixName;
         System.out.println("newfilename"+newfilename);
        File directory = new File("");// 参数为空
        //获取上传文件路径
       String path = request.getSession().getServletContext().getRealPath("/images/");

          System.out.println(path);
        //获取上传文件名
        String filename = file.getOriginalFilename();
        File filepath = new File(path+newfilename);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) {
         System.out.println("创建文件夹");
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        try {
            file.transferTo(new File(path + newfilename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        truepath=path+newfilename;
        sqlpath="/images/"+newfilename;
        info.setUserid(userid);
        //输出文件上传最终的路径 测试查看
        System.out.println(path+newfilename);
        message.setFlag(1);
        message.setMessage(truepath);
        //创建infor对象
        info.setUserid(userid);
        info.setImagepath(sqlpath);
        info.setPlace(place);
        info.setEquip(equip);
        info.setDetail(detail);
        int i=0;
        i=userservice.insertinfor(info);
        System.out.println("num+++"+info.getNum());  //获得了infor数据表的主键号
        if(i==1){
            message.setFlag(1);
            message.setMessage("申报成功！");}
        else {
            message.setFlag(0);
            message.setMessage("申报失败！");}
        return message;
    }else{
        Infor info=new Infor();
        info.setUserid(userid);
        info.setPlace(place);
        info.setEquip(equip);
        info.setDetail(detail);
        int i=0;
        i=userservice.insertinfor(info);
        if(i==1){
          message.setFlag(1);
         message.setMessage("申报成功！");}
        else {
            message.setFlag(0);
            message.setMessage("申报失败！");}
        return message;
    }

    }


    /*
    * 查找指定id的维修记录*/
    @RequestMapping("/allinfor")
    @ResponseBody
    public List<Infor> test6(String userid){
        return userservice.findbyuserid(userid);
    }

}
