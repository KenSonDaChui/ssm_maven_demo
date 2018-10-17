package com.itcast.ssm.dao;

import com.itcast.ssm.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Create by Kenson on 2018/10/17
 */

public interface ISysLogDao {
    @Insert("insert into SYSLOG(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void saveLog(SysLog sysLog) throws  Exception;


    @Select("select * from SYSLOG")
    List<SysLog> findAll() throws Exception;
}
