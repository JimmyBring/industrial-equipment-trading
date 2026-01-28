package com.industrial.trading.service;

import com.industrial.trading.entity.Order;

import java.util.List;
import java.util.Map;

/**
 * 订单服务接口
 */
public interface OrderService {
    
    /**
     * 创建订单
     */
    Order create(Order order);
    
    /**
     * 根据ID查询订单
     */
    Order findById(Integer id);
    
    /**
     * 根据订单号查询订单
     */
    Order findByOrderNo(String orderNo);
    
    /**
     * 查询订单列表
     */
    List<Order> findList(Map<String, Object> params);
    
    /**
     * 查询订单总数
     */
    int count(Map<String, Object> params);
    
    /**
     * 更新订单状态
     */
    boolean updateStatus(Integer id, Integer status);
}
