package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.piao.springbootmp.bean.Emp;
import com.piao.springbootmp.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.R;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private EmpMapper empMapper;
    @GetMapping("all")
    public String getEmps(){
        List list = empMapper.selectList(null);
        R r = R.ok().data("items",list);
        return JSON.toJSONString(r);
    }

    @GetMapping("del")
    public R delete(@RequestParam int id){
        int i = empMapper.deleteById(id);
        if(i > 0){
            return R.ok();
        }else {
            return R.error();
        }
    }

    @PostMapping("add")
    public R addEmp(@RequestBody Emp emp){
        int i = empMapper.insert(emp);
        if (i > 0){
            return R.ok();
        }else {
            return R.error();
        }
    }

    @GetMapping("get")
    public R getEmpbyempno(@RequestParam int id){
        Emp emp = empMapper.selectById(id);
        return R.ok().data("emp",emp);
    }

    @PostMapping("update")
    public R updateEmp(@RequestBody Emp emp){
        int i = empMapper.updateById(emp);
        if (i > 0){
            return R.ok();
        }else {
            return R.error();
        }
    }
}
