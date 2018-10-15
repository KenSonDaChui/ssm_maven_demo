package com.itcast.ssm.dao;

import com.itcast.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.userdetails.User;

import java.util.List;

/**
 * Create by Kenson on 2018/10/13
 */

public interface IUserDao {

    @Select("select * from Users where username=#{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many=@Many(select = "com.itcast.ssm.dao.IRoleDao.findRoleById")),

    })
    UserInfo findByUsername(String username);


    @Select("select * from users")
    List<UserInfo> findAll() throws Exception;


    @Insert("insert into users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo);


    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many=@Many(select = "com.itcast.ssm.dao.IRoleDao.findRoleById")),

    })

    UserInfo findById(String id);
}
