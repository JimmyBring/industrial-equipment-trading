package com.industrial.trading.service;

import com.industrial.trading.entity.Logistics;
import com.industrial.trading.entity.LogisticsTrack;

import java.util.List;

/**
 * 物流服务接口
 */
public interface LogisticsService {
    
    /**
     * 创建物流
     */
    Logistics create(Logistics logistics);
    
    /**
     * 根据ID查询物流
     */
    Logistics findById(Integer id);
    
    /**
     * 根据订单ID查询物流
     */
    Logistics findByOrderId(Integer orderId);
    
    /**
     * 更新物流
     */
    boolean update(Logistics logistics);
    
    /**
     * 添加物流跟踪记录
     */
    boolean addTrack(LogisticsTrack track);
    
    /**
     * 查询物流跟踪记录列表
     */
    List<LogisticsTrack> findTrackList(Integer logisticsId);
}
