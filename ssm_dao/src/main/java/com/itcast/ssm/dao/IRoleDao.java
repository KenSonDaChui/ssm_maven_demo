package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Create by Kenson on 2018/10/14
 */

public interface IRoleDao {

    @Select("select * from role where id in(select roleId from users_role where userId=#{id})")
    public List<Role> findRoleById(String id) throws Exception;
}
