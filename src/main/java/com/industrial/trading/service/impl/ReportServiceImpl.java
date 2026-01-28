package com.industrial.trading.service.impl;

import com.industrial.trading.dao.ReportMapper;
import com.industrial.trading.entity.Report;
import com.industrial.trading.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 举报服务实现类
 */
@Service
public class ReportServiceImpl implements ReportService {
    
    @Autowired
    private ReportMapper reportMapper;
    
    @Override
    public Report submit(Report report) {
        // 设置默认状态为待处理
        if (report.getStatus() == null) {
            report.setStatus(1);
        }
        
        reportMapper.insert(report);
        return report;
    }
    
    @Override
    public Report findById(Integer id) {
        return reportMapper.selectById(id);
    }
    
    @Override
    public List<Report> findList(Map<String, Object> params) {
        return reportMapper.selectList(params);
    }
    
    @Override
    public int count(Map<String, Object> params) {
        return reportMapper.selectCount(params);
    }
    
    @Override
    public boolean handle(Integer id, Integer status, String adminReply) {
        Report report = new Report();
        report.setId(id);
        report.setStatus(status);
        report.setAdminReply(adminReply);
        report.setHandleTime(new Date());
        return reportMapper.update(report) > 0;
    }
}
