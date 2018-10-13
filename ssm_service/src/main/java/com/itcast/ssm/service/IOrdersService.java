package com.itcast.ssm.service;


import com.itcast.ssm.domain.Orders;

import java.util.List;

public interface IOrdersService {


    /**
     * 查询订单所有的信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    List<Orders> findAll(int page, int size) throws Exception;


    /**
     * 查询订单信息
     * @param id
     * @return
     * @throws Exception
     */
    Orders findById(String id) throws Exception;
}
