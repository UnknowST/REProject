package com.service.impl;

import com.daomain.*;
import com.mapper.Adminmapper;
import com.service.Adminservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("adminservice")
public class AdminserviceImpl implements Adminservice {
    @Autowired
    private Adminmapper adminmapper;
    @Override
    public List<Infor> listOf() {
        return adminmapper.listOf();
    }

    @Override
    public List<Worker> listworker() {
    return adminmapper.listworker();
    }

    @Override
    public List<Worker_type> typeList() {
        return adminmapper.typeList();
    }

    @Override
    public List<Infor> daiinfor() {
        return adminmapper.daiinfor();
    }

    @Override
    public List<Infor> waitinfor() {
    return adminmapper.waitinfor();
    }

    @Override
    public List<Infor> inginfor() {
    return adminmapper.inginfor();
    }

    @Override
    public List<Infor> succinfor() {
    return adminmapper.succinfor();
    }

    @Override
    public int suminfor(String workerid){
    return adminmapper.suminfor(workerid);
    }

    @Override
    public int uiworker(String num, String workerid) {
        int i=0;
        try {
            i=adminmapper.uiworker(num,workerid);
        } catch (Exception e) {
            i=-1;
        }
        if (i==1) return 1;
        else return 0;
    }

    @Override
    public List<User> userlist() {
    return adminmapper.userlist();
    }

    @Override
    public int deleteuser(String num) {
    return adminmapper.deleteuser(num);
    }

    @Override
    public int resetpassword(String num) {
        return adminmapper.resetpassword(num);
    }

    @Override
    public List<User> searchuser(User user ) {
    return adminmapper.searchuser(user);
    }

    @Override
    public List<Bill> billlist() {
        return adminmapper.billlist();
    }

    @Override
    public int deletebill(String snum) {
    return adminmapper.deletebill(snum);
    }

    @Override
    public int updatebill(Bill bill) {
    return adminmapper.updatebill(bill);
    }

    @Override
    public int InsertUser(User user) {
    return adminmapper.InsertUser(user);
    }

    @Override
    public int InsertWorker(Worker worker) {
    return adminmapper.InsertWorker(worker);
    }

    @Override
    public int deleteworker(String num) {
    return adminmapper.deleteworker(num);
    }

    @Override
    public int resetworker(String num) {
    return adminmapper.resetworker(num);
    }

    @Override
    public int updateworker(Worker worker) {
        return adminmapper.updateworker(worker);
    }

    @Override
    public List<Worker> searchworkers(Worker worker) {
    return adminmapper.searchworkers(worker);
    }

    @Override
    public List<Bill> searchbill(Bill bill) {
    return adminmapper.searchbill(bill);
    }

}
