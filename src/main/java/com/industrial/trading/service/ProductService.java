package com.industrial.trading.service;

import com.industrial.trading.entity.Product;

import java.util.List;
import java.util.Map;

/**
 * 商品服务接口
 */
public interface ProductService {
    
    /**
     * 发布商品
     */
    Product publish(Product product);
    
    /**
     * 根据ID查询商品
     */
    Product findById(Integer id);
    
    /**
     * 查询商品列表
     */
    List<Product> findList(Map<String, Object> params);
    
    /**
     * 查询商品总数
     */
    int count(Map<String, Object> params);
    
    /**
     * 更新商品
     */
    boolean update(Product product);
    
    /**
     * 审核商品
     */
    boolean audit(Integer id, Integer status);
    
    /**
     * 增加商品浏览量
     */
    void increaseViewCount(Integer id);
}
