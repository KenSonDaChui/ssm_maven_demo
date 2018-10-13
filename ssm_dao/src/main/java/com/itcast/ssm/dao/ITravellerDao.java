package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Create by Kenson on 2018/10/12
 */

public interface ITravellerDao {


    @Select("select * from TRAVELLER where id in (select travellerId from order_traveller where orderId=#{id})")
    public List<Traveller> findById(String id);
}
