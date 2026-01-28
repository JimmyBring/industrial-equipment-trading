package com.industrial.trading.service;

import com.industrial.trading.entity.Report;

import java.util.List;
import java.util.Map;

/**
 * 举报服务接口
 */
public interface ReportService {
    
    /**
     * 提交举报
     */
    Report submit(Report report);
    
    /**
     * 根据ID查询举报
     */
    Report findById(Integer id);
    
    /**
     * 查询举报列表
     */
    List<Report> findList(Map<String, Object> params);
    
    /**
     * 查询举报总数
     */
    int count(Map<String, Object> params);
    
    /**
     * 处理举报
     */
    boolean handle(Integer id, Integer status, String adminReply);
}
