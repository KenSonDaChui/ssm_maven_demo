package com.itcast.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.itcast.ssm.dao.ISysLogDao;
import com.itcast.ssm.domain.SysLog;
import com.itcast.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by Kenson on 2018/10/17
 */

@Service
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao iSysLogDao;

    @Override
    public void saveLog(SysLog sysLog) throws Exception {
        System.out.println("进来service");
        System.out.println(sysLog);
        iSysLogDao.saveLog(sysLog);
    }

    @Override
    public List<SysLog> findAll() throws Exception {
       return iSysLogDao.findAll();
    }
}
