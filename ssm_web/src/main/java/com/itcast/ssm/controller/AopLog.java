package com.itcast.ssm.controller;

import com.itcast.ssm.domain.SysLog;
import com.itcast.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * Create by Kenson on 2018/10/17
 */

@Component
@Aspect
public class AopLog {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService iSysLogServiceimpl;


    private long visitTime;     //访问总时间
    private Date startTime;     //访问开始的时间
    private Class clazz;        //访问的是哪一个类
    private Method method;      //访问的方法
    private String url;
    private String username;
    private String ip;



    //配置前置通知
    @Before("execution(* com.itcast.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        System.out.println("我进来了");
        startTime = new Date();              //开始时间为当前时间
        clazz = jp.getTarget().getClass();   //获取当前的类是哪一个
        String methodName = jp.getSignature().getName();   //获得当前方法的名称
        Object[] args = jp.getArgs();        //获取所有的参数
        if (args == null || args.length == 0) {
            //该方法没有参数
            method = clazz.getMethod(methodName);
        } else {
            //该方法含有参数
            Class[] methodArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                methodArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName, methodArgs);
        }
    }


    //配置后置通知
    @After("execution(* com.itcast.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        visitTime = new Date().getTime() - startTime.getTime();         //获取访问时间
        //获得url
        if (clazz != null && method != null && clazz != AopLog.class) {    //不是日志类
            RequestMapping classannotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (classannotation != null) {
                String[] value = classannotation.value();
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = value[0] + methodValue[0];
                }
            }
        }
        //获取ip
       ip=request.getRemoteAddr();
        //获取操作者
        //User use = (User) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        SecurityContext context = SecurityContextHolder.getContext();
        User principal = (User) context.getAuthentication().getPrincipal();
        username = principal.getUsername();

        //封装到Syslog对象中
        SysLog sysLog = new SysLog();
        sysLog.setMethod("[类名]"+clazz.getName()+"[方法名]"+method.getName());                    //封装方法
        sysLog.setIp(ip);                               //封装ip
        sysLog.setUrl(url);                             //封装url
        sysLog.setExecutionTime(startTime);   //封装开始时间
        sysLog.setVisitTime(visitTime);                 //封装执行时间
        sysLog.setUsername(username);                   //封装操作者姓名

        System.out.println("================syslog======================");
        System.out.println("================syslog======================");
        System.out.println("================syslog======================");
        System.out.println("================syslog======================");
        System.out.println("================syslog======================");
        System.out.println("================syslog======================");
        System.out.println(sysLog);


        iSysLogServiceimpl.saveLog(sysLog);


    }
}
