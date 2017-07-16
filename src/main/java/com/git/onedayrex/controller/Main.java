package com.git.onedayrex.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by onedayrex on 2017/7/16.
 */
@RestController
@RequestMapping("/test")
public class Main {

    @RequestMapping("/index")
    public Object index(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = format.format(new Date());
        return now;
    }
}
