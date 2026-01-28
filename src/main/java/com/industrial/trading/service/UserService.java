package com.industrial.trading.service;

import com.industrial.trading.entity.User;

import java.util.List;
import java.util.Map;

/**
 * 用户服务接口
 */
public interface UserService {
    
    /**
     * 用户注册
     */
    User register(User user);
    
    /**
     * 用户登录
     */
    User login(String username, String password);
    
    /**
     * 根据ID查询用户
     */
    User findById(Long id);
    
    /**
     * 根据用户名查询用户
     */
    User findByUsername(String username);
    
    /**
     * 查询用户列表
     */
    List<User> findList(Map<String, Object> params);
    
    /**
     * 查询用户总数
     */
    int count(Map<String, Object> params);
    
    /**
     * 更新用户
     */
    boolean update(User user);
    
    /**
     * 审核用户
     */
    boolean audit(Long id, Integer status);
}
