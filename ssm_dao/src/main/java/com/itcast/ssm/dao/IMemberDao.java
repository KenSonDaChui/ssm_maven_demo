package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

/**
 * Create by Kenson on 2018/10/12
 */

public interface IMemberDao {

    @Select("select * from member where id=#{memberId}")
    public Member findById(String memberId);
}
