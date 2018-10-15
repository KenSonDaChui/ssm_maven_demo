package com.itcast.ssm.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Create by Kenson on 2018/10/14
 */

public class PasswordEncoder {

    public static  String getPasswordEncoder(String password){

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String s = encoder.encode(password);
        return s;

    }

    public static void main(String[] args) {
        String passwordEncoder = getPasswordEncoder("1111");
        System.out.println(passwordEncoder);
    }
}
