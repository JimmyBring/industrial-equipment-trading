package com.industrial.trading.dao;

import com.industrial.trading.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品Mapper接口
 */
public interface ProductMapper {
    
    /**
     * 根据ID查询商品
     */
    Product selectById(@Param("id") Integer id);
    
    /**
     * 查询商品列表
     */
    List<Product> selectList(Map<String, Object> params);
    
    /**
     * 查询商品总数
     */
    int selectCount(Map<String, Object> params);
    
    /**
     * 插入商品
     */
    int insert(Product product);
    
    /**
     * 更新商品
     */
    int update(Product product);
    
    /**
     * 更新商品状态
     */
    int updateStatus(@Param("id") Integer id, @Param("status") Integer status);
    
    /**
     * 增加商品浏览量
     */
    int increaseViewCount(@Param("id") Integer id);
}
