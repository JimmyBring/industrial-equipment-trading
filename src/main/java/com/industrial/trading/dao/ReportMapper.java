package com.industrial.trading.dao;

import com.industrial.trading.entity.Report;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 举报Mapper接口
 */
public interface ReportMapper {
    
    /**
     * 根据ID查询举报
     */
    Report selectById(@Param("id") Integer id);
    
    /**
     * 查询举报列表
     */
    List<Report> selectList(Map<String, Object> params);
    
    /**
     * 查询举报总数
     */
    int selectCount(Map<String, Object> params);
    
    /**
     * 插入举报
     */
    int insert(Report report);
    
    /**
     * 更新举报
     */
    int update(Report report);
}
