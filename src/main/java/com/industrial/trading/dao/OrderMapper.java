package com.industrial.trading.dao;

import com.industrial.trading.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 订单Mapper接口
 */
public interface OrderMapper {
    
    /**
     * 根据ID查询订单
     */
    Order selectById(@Param("id") Integer id);
    
    /**
     * 根据订单号查询订单
     */
    Order selectByOrderNo(@Param("orderNo") String orderNo);
    
    /**
     * 查询订单列表
     */
    List<Order> selectList(Map<String, Object> params);
    
    /**
     * 查询订单总数
     */
    int selectCount(Map<String, Object> params);
    
    /**
     * 插入订单
     */
    int insert(Order order);
    
    /**
     * 更新订单状态
     */
    int updateStatus(@Param("id") Integer id, @Param("status") Integer status);
}
