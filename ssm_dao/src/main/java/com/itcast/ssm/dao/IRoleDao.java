package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Create by Kenson on 2018/10/14
 */

public interface IRoleDao {

    @Select("select * from role where id in (select roleId from users_role where userId=#{id})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions", column = "id",javaType = List.class,many = @Many(select = "com.itcast.ssm.dao.IPermissionDao.findPermissionById"))
    })
    public List<Role> findRoleById(String id) throws Exception;
}
