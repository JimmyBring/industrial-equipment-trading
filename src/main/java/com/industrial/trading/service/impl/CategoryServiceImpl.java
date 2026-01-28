package com.industrial.trading.service.impl;

import com.industrial.trading.dao.CategoryMapper;
import com.industrial.trading.entity.Category;
import com.industrial.trading.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 分类服务实现类
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    
    @Autowired
    private CategoryMapper categoryMapper;
    
    @Override
    public List<Category> findAll() {
        return categoryMapper.selectAll();
    }
    
    @Override
    public Category findById(Integer id) {
        return categoryMapper.selectById(id);
    }
}
