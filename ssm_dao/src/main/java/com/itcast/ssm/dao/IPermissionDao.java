package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Create by Kenson on 2018/10/14
 */

public interface IPermissionDao {

    @Select("select * from Permission where id in (select PermissionId from Role_Permission where roleId=#{id})")
    List<Permission> findPermissionById(String id);
}
