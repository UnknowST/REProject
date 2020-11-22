package com.service.impl;

import com.daomain.Bill;
import com.daomain.Equipment;
import com.daomain.Infor;
import com.daomain.Worker;
import com.mapper.Workermapper;
import com.service.Workerservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("workerservice")
public class WorkerserviceImpl implements Workerservice {

    @Autowired
   private Workermapper workermapper;
    @Override
    public Worker updatewoker(Worker worker) {
        int i=workermapper.updatewoker(worker);
        Worker worker1=workermapper.returnworker(String.valueOf(worker.getNum()));
        return worker1;
    }

    @Override
    public List<Infor> Listinfor(String workerid) {
    return workermapper.Listinfor(workerid);
    }

    @Override
    public int modifpass(String num,String password) {

    int i=0;
        try {
            i=workermapper.modifpass(num,password);
      System.out.println("i+++++"+i);
        } catch (Exception e) {
            i=-1;
        }
       if(i==1) return 1;
       else return 0;
    }

    @Override
    public List<Infor> infor_ing(String workerid) {
        return workermapper.infor_ing(workerid);
    }

    @Override
    public List<Infor> infor_ok(String workerid) {
    return workermapper.infor_ok(workerid);
    }

    @Override
    public int ok_infor(String num) {
        return workermapper.ok_infor(num);
    }

    @Override
    public int success_infor(String num,String state) {
    return workermapper.success_infor(num,state);
    }

    @Override
    public String billnum() {
    return workermapper.billnum();
    }

    @Override
    public int insertbill(Bill bill) {
    return workermapper.insertbill(bill);
    }

    @Override
    public List<Bill> listbill(String workerid) {
    return workermapper.listbill(workerid);
    }

    @Override
    public int updatehead(String workerid, String headpath) {
        return workermapper.updatehead(workerid,headpath);
    }

    @Override
    public List<Equipment> equipmentlist() {
    return workermapper.equipmentlist();
    }

    @Override
    public int worker_success(String num, String eid, String state, String detail, String numbers) {
    System.out.println("test++++++"+num+eid+state+detail+numbers);
        int j=1;
        int i=workermapper.success_infor(num,state);
        if("0".equals(eid)==false){
             System.out.println("play_equipment");
            try {
                j=workermapper.play_equipment(eid,numbers);
            } catch (Exception e) {
                j=-1;
            }
        }

        int h=workermapper.play_replay(num,detail,eid,numbers);
        if(i==1&&j==1&&h==1) return 1;
        return 0;
    }
}
