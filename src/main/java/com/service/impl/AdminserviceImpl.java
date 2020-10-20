package com.service.impl;

import com.daomain.Infor;
import com.daomain.Worker;
import com.daomain.Worker_type;
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
    public int suminfor(String workerid){
    return adminmapper.suminfor(workerid);
    }
}
