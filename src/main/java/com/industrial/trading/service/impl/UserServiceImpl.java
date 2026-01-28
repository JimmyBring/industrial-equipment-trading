package com.industrial.trading.service.impl;

import com.industrial.trading.dao.UserMapper;
import com.industrial.trading.entity.User;
import com.industrial.trading.service.UserService;
import com.industrial.trading.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 用户服务实现类
 */
@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public User register(User user) {
        // 检查用户名是否已存在
        User existUser = userMapper.selectByUsername(user.getUsername());
        if (existUser != null) {
            throw new RuntimeException("用户名已存在");
        }
        
        // 密码MD5加密
        user.setPassword(MD5Util.encrypt(user.getPassword()));
        
        // 设置默认状态为待审核
        if (user.getStatus() == null) {
            user.setStatus(0);
        }
        
        userMapper.insert(user);
        return user;
    }
    
    @Override
    public User login(String username, String password) {
        User user = userMapper.selectByUsername(username);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        
        // 验证密码
        String encryptedPassword = MD5Util.encrypt(password);
        if (!encryptedPassword.equals(user.getPassword())) {
            throw new RuntimeException("密码错误");
        }
        
        // 验证状态
        if (user.getStatus() == 0) {
            throw new RuntimeException("账号待审核");
        } else if (user.getStatus() == 2) {
            throw new RuntimeException("账号已被禁用");
        }
        
        return user;
    }
    
    @Override
    public User findById(Long id) {
        return userMapper.selectById(id);
    }
    
    @Override
    public User findByUsername(String username) {
        return userMapper.selectByUsername(username);
    }
    
    @Override
    public List<User> findList(Map<String, Object> params) {
        return userMapper.selectList(params);
    }
    
    @Override
    public int count(Map<String, Object> params) {
        return userMapper.selectCount(params);
    }
    
    @Override
    public boolean update(User user) {
        // 如果更新密码，需要MD5加密
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            user.setPassword(MD5Util.encrypt(user.getPassword()));
        }
        return userMapper.update(user) > 0;
    }
    
    @Override
    public boolean audit(Long id, Integer status) {
        return userMapper.updateStatus(id, status) > 0;
    }
}
