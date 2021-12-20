package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.piao.springbootmp.bean.Movie;
import com.piao.springbootmp.bean.User;
import com.piao.springbootmp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/hello")
@CrossOrigin

public class HelloController {
    @Autowired
    private UserMapper userMapper;

    //localhost:8080/user/hello
    //@RequestMapping(value = "/hello",method= RequestMethod.GET)
    @GetMapping("hello")
    public String hello(){
        return "测试";
    }

    @PostMapping("test")
    public String test(){
        return "test";
    }

    @PostMapping("login")
    public String login(@RequestParam String username,@RequestParam String password){
        return "账号："+username+"密码："+password;
    }

    @GetMapping ("search")
    public String search(@RequestParam String msg){
        return "要搜索的内容为："+msg;
    }

    @GetMapping ("search2/{msg}")
    public String search2(@PathVariable String msg){
        return "要搜索的内容为："+msg;
    }

    @GetMapping("jsontest")
    public String jsonTest(){
        Movie m = new Movie();
        m.setTitle("金刚狼");
        m.setCount(1000);
        m.setYear("2012");
        return JSON.toJSONString(m);
    }

    //http://localhost:8080/user/mpuser
    @GetMapping("mpuser")
    public String userTest(){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id",3).or().eq("name","zhangsan");
        List list = userMapper.selectList(queryWrapper);
        return JSON.toJSONString(list);
    }

    @GetMapping("del")
    public String del(@RequestParam int id){
        userMapper.deleteById(id);
        return "";
    }

    @GetMapping("add")
    public String add(@RequestParam String name,@RequestParam int age){
        User u = new User();
        u.setAge(age);
        u.setName(name);
        int i = userMapper.insert(u);
        return ""+i;
    }
}
