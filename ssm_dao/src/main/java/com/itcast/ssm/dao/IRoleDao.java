package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

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


    @Select("select * from role where id not in (select roleId from users_role where userId=#{id})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
    })
    List<Role> findRoleNotInById(String id) throws Exception;


    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void saveRole(Role role) throws Exception;

    @Select("select * from  role ")
    List<Role> findAll()throws Exception;

    @Select("select * from role where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions", column = "id",javaType = List.class,many = @Many(select = "com.itcast.ssm.dao.IPermissionDao.findPermissionById"))
    })
    Role findById(String id) throws Exception;


    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "permissions", column = "id",javaType = List.class,many = @Many(select = "com.itcast.ssm.dao.IPermissionDao.findPermissionNotInById"))
    })
    Role findRoleByIdAndAllPer(String roleId)throws Exception;

    @Insert("insert into role_permission values(#{permissionId},#{roleId})")
    void addPerToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId) throws Exception;
}
