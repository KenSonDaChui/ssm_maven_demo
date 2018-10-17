package com.itcast.ssm.controller;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Create by Kenson on 2018/10/17
 */



/*@Component
@Aspect*/
public class Test {
    @Before("execution(* com.itcast.ssm.controller.*.*(..))")
    public void be(){
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
        System.out.println("天王盖地虎");
    }
}
