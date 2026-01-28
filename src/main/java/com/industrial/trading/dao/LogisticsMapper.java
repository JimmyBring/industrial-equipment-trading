package com.industrial.trading.dao;

import com.industrial.trading.entity.Logistics;
import org.apache.ibatis.annotations.Param;

/**
 * 物流Mapper接口
 */
public interface LogisticsMapper {
    
    /**
     * 根据ID查询物流
     */
    Logistics selectById(@Param("id") Integer id);
    
    /**
     * 根据订单ID查询物流
     */
    Logistics selectByOrderId(@Param("orderId") Integer orderId);
    
    /**
     * 插入物流
     */
    int insert(Logistics logistics);
    
    /**
     * 更新物流
     */
    int update(Logistics logistics);
}
