package com.itcast.ssm.test;

import com.itcast.ssm.dao.IProductDao;
import com.itcast.ssm.domain.Product;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @author caiwen
 * @version 1.0
 * @date 2018-10-8
 * @describetion TODO
 */
public class ItemsDaoTest {

    private IProductDao iProductDao;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring/applicationContext-dao.xml");
        iProductDao = ac.getBean(IProductDao.class);
    }


    @Test
    public void testFindById() throws Exception {
        Product product = iProductDao.findById("676C5BD1D35E429A8C2E114939C5685A");
        System.out.println(product);
    }

    @Test
    public void testFindAll() throws  Exception{
        List<Product> products = iProductDao.findAll();
        System.out.println(products);
    }

}
