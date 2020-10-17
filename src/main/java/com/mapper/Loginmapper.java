package com.mapper;

import com.daomain.User;
import com.daomain.Worker;

public interface Loginmapper {
    User Userlogin(User user);
    Worker Workerlogin(Worker worker);
    int insertuser(User user);
    int insertworker(Worker worker);

}
