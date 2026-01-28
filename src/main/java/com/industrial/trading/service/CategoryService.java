package com.industrial.trading.service;

import com.industrial.trading.entity.Category;

import java.util.List;

/**
 * 分类服务接口
 */
public interface CategoryService {
    
    /**
     * 查询所有分类
     */
    List<Category> findAll();
    
    /**
     * 根据ID查询分类
     */
    Category findById(Integer id);
}
