package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.piao.springbootmp.bean.Menu;
import com.piao.springbootmp.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.R;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuMapper menuMapper;
    @GetMapping("all")
    public String getMenu(){
        List list = menuMapper.selectList(null);
        R r = R.ok().data("items",list);
        return JSON.toJSONString(r);
    }
    @GetMapping("add")
    public R addDish(@RequestBody Menu d){
        d.setNumber(d.getNumber()+1);
        int i=menuMapper.updateById(d);
        if(i>0){

            System.out.println("right");
            return R.ok();
        }else{
            System.out.println("error");
            return R.error();
        }
    }
    @GetMapping("del")
    public R delDish(@RequestBody Menu d) {
        d.setNumber(d.getNumber() - 1);
        int i = menuMapper.updateById(d);
        if (i > 0) {

            System.out.println("right");
            return R.ok();
        } else {
            System.out.println("error");
            return R.error();
        }
    }
}
