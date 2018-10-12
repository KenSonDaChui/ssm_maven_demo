package com.itcast.ssm.service.test;

import com.itcast.ssm.dao.IProductDao;
import com.itcast.ssm.domain.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author caiwen
 * @version 1.0
 * @date 2018-10-9
 * @describetion TODO
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-service.xml")
public class ItemsServiceTest {

    @Autowired
    private IProductDao iProductDao;

    @Test
    public void testFindAll() throws Exception {
        List<Product> products = iProductDao.findAll();
        System.out.println(products);
    }

    @Test
    public void testFindById() throws Exception {
        Product product = iProductDao.findById("9F71F01CB448476DAFB309AA6DF9497F");
        System.out.println(product);
    }
}
