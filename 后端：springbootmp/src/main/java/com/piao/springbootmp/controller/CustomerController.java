package com.piao.springbootmp.controller;

import com.piao.springbootmp.bean.Dish;
import com.piao.springbootmp.mapper.ChefMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.R;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private ChefMapper dishMapper;
    @GetMapping("show")
    public R showDishes(){
        List customer=dishMapper.selectList(null);
        return R.ok().data("items",customer);
    }
    @GetMapping("add")
    public R addDish(@RequestBody Dish d){
        d.setNumber(d.getNumber()+1);
        int i=dishMapper.updateById(d);
        if(i>0){

            System.out.println("right");
            return R.ok();
        }else{
            System.out.println("error");
            return R.error();
        }
    }
    @GetMapping("del")
    public R delDish(@RequestBody Dish d){
        d.setNumber(d.getNumber()-1);
        int i=dishMapper.updateById(d);
        if(i>0){

            System.out.println("right");
            return R.ok();
        }else{
            System.out.println("error");
            return R.error();
        }
    }
}
