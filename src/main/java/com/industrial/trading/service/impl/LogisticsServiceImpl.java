package com.industrial.trading.service.impl;

import com.industrial.trading.dao.LogisticsMapper;
import com.industrial.trading.dao.LogisticsTrackMapper;
import com.industrial.trading.entity.Logistics;
import com.industrial.trading.entity.LogisticsTrack;
import com.industrial.trading.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 物流服务实现类
 */
@Service
public class LogisticsServiceImpl implements LogisticsService {
    
    @Autowired
    private LogisticsMapper logisticsMapper;
    
    @Autowired
    private LogisticsTrackMapper logisticsTrackMapper;
    
    @Override
    public Logistics create(Logistics logistics) {
        // 设置默认状态为待揽件
        if (logistics.getStatus() == null) {
            logistics.setStatus(1);
        }
        
        logisticsMapper.insert(logistics);
        return logistics;
    }
    
    @Override
    public Logistics findById(Integer id) {
        Logistics logistics = logisticsMapper.selectById(id);
        if (logistics != null) {
            // 加载物流跟踪记录
            List<LogisticsTrack> trackList = logisticsTrackMapper.selectByLogisticsId(id);
            logistics.setTrackList(trackList);
        }
        return logistics;
    }
    
    @Override
    public Logistics findByOrderId(Integer orderId) {
        Logistics logistics = logisticsMapper.selectByOrderId(orderId);
        if (logistics != null) {
            // 加载物流跟踪记录
            List<LogisticsTrack> trackList = logisticsTrackMapper.selectByLogisticsId(logistics.getId());
            logistics.setTrackList(trackList);
        }
        return logistics;
    }
    
    @Override
    public boolean update(Logistics logistics) {
        return logisticsMapper.update(logistics) > 0;
    }
    
    @Override
    public boolean addTrack(LogisticsTrack track) {
        return logisticsTrackMapper.insert(track) > 0;
    }
    
    @Override
    public List<LogisticsTrack> findTrackList(Integer logisticsId) {
        return logisticsTrackMapper.selectByLogisticsId(logisticsId);
    }
}
