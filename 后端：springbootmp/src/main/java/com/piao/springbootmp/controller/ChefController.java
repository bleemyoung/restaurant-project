package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.piao.springbootmp.bean.Dish;
import com.piao.springbootmp.mapper.ChefMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.R;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/dishes")
public class ChefController {
    @Autowired
    private ChefMapper chefMapper;
    @GetMapping("all")
    public String getDishes(){
        List list = chefMapper.selectList(null);
        R r = R.ok().data("items",list);
        return JSON.toJSONString(r);
    }

    @GetMapping("cook")
    public R cook(@RequestParam int id){
        Dish dish = chefMapper.selectById(id);
        dish.setIsfinished(1);
        int i = chefMapper.updateById(dish);
        if (i > 0){
            return R.ok();
        }else {
            return R.error();
        }
    }
}
