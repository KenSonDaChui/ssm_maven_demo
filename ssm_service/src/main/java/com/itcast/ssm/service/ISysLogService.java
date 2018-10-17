package com.itcast.ssm.service;

import com.itcast.ssm.domain.SysLog;

import java.util.List;

/**
 * Create by Kenson on 2018/10/17
 */

public interface ISysLogService {

    public void saveLog(SysLog sysLog)throws Exception;


    //查看所有日志
    List<SysLog> findAll() throws Exception;

}
