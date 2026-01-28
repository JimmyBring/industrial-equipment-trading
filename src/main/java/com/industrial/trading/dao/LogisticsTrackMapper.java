package com.industrial.trading.dao;

import com.industrial.trading.entity.LogisticsTrack;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 物流跟踪Mapper接口
 */
public interface LogisticsTrackMapper {
    
    /**
     * 根据物流ID查询跟踪记录列表
     */
    List<LogisticsTrack> selectByLogisticsId(@Param("logisticsId") Integer logisticsId);
    
    /**
     * 插入物流跟踪记录
     */
    int insert(LogisticsTrack track);
}
