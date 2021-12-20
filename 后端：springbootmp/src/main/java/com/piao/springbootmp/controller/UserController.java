package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.piao.springbootmp.bean.EleUser;
import com.piao.springbootmp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/user")
@CrossOrigin
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @PostMapping("login")
    public String login(@RequestBody EleUser user){
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        HashMap map = new HashMap<>();
        map.put("code",20000);
        HashMap token = new HashMap<>();
        token.put("token","admin-token");
        map.put("data",token);
        return JSON.toJSONString(map);
    }

    @GetMapping("info")
    public String getUserInfo(@RequestParam String token){
        HashMap map = new HashMap<>();
        map.put("code",20000);
        HashMap data = new HashMap<>();
        data.put("name","chef");
        data.put("avatar","https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
        map.put("data",data);
        return JSON.toJSONString(map);
    }
}
