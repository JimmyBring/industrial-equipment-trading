package com.industrial.trading.dao;

import com.industrial.trading.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 分类Mapper接口
 */
public interface CategoryMapper {
    
    /**
     * 查询所有分类
     */
    List<Category> selectAll();
    
    /**
     * 根据ID查询分类
     */
    Category selectById(@Param("id") Integer id);
}
