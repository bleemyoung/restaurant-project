package com.piao.springbootmp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.piao.springbootmp.bean.Dish;
import org.springframework.stereotype.Component;

@Component
public interface ChefMapper extends BaseMapper<Dish> {
}
