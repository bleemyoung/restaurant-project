package com.piao.springbootmp.controller;

import com.alibaba.fastjson.JSON;
import com.piao.springbootmp.bean.Notice;
import com.piao.springbootmp.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.R;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeMapper noticeMapper;
    @GetMapping("all")
    public String getNotices(){
        List list = noticeMapper.selectList(null);
        R r = R.ok().data("items",list);
        return JSON.toJSONString(r);
    }

    @PostMapping("add")
    public R addNotice(@RequestBody Notice notice){
        int i = noticeMapper.insert(notice);
        if (i > 0){
            return R.ok();
        }else {
            return R.error();
        }
    }

}
