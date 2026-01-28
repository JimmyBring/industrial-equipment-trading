package com.industrial.trading.service.impl;

import com.industrial.trading.dao.OrderMapper;
import com.industrial.trading.entity.Order;
import com.industrial.trading.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * 订单服务实现类
 */
@Service
public class OrderServiceImpl implements OrderService {
    
    @Autowired
    private OrderMapper orderMapper;
    
    @Override
    public Order create(Order order) {
        // 生成订单号
        String orderNo = generateOrderNo();
        order.setOrderNo(orderNo);
        
        // 设置默认状态为待发货
        if (order.getStatus() == null) {
            order.setStatus(1);
        }
        
        orderMapper.insert(order);
        return order;
    }
    
    @Override
    public Order findById(Integer id) {
        return orderMapper.selectById(id);
    }
    
    @Override
    public Order findByOrderNo(String orderNo) {
        return orderMapper.selectByOrderNo(orderNo);
    }
    
    @Override
    public List<Order> findList(Map<String, Object> params) {
        return orderMapper.selectList(params);
    }
    
    @Override
    public int count(Map<String, Object> params) {
        return orderMapper.selectCount(params);
    }
    
    @Override
    public boolean updateStatus(Integer id, Integer status) {
        return orderMapper.updateStatus(id, status) > 0;
    }
    
    /**
     * 生成订单号：时间戳 + 6位随机数
     */
    private String generateOrderNo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());
        Random random = new Random();
        int randomNum = random.nextInt(900000) + 100000;
        return timestamp + randomNum;
    }
}
