package com.service;

import com.daomain.User;
import com.daomain.Worker;

public interface LoginService {
    public User Userlogin(User user);
    public Worker Workerlogin(Worker worker);
    int insertuser(User user);
    int insertworker(Worker worker);
}
