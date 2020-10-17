package com.service.impl;

import com.daomain.User;
import com.daomain.Worker;
import com.mapper.Loginmapper;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginservice")
public class LoginServiceImpl implements LoginService {
    @Autowired
    Loginmapper loginmapper;
    @Override
    public User Userlogin(User user) {
        return loginmapper.Userlogin(user);
    }

    @Override
    public Worker Workerlogin(Worker worker) {
        return loginmapper.Workerlogin(worker);
    }

    @Override
    public int insertuser(User user) {
        return loginmapper.insertuser(user);
    }

    @Override
    public int insertworker(Worker worker) {
        return loginmapper.insertworker(worker);
    }
}
