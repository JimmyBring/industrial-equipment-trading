package com.industrial.trading.dao;

import com.industrial.trading.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户Mapper接口
 */
public interface UserMapper {
    
    /**
     * 根据ID查询用户
     */
    User selectById(@Param("id") Long id);
    
    /**
     * 根据用户名查询用户
     */
    User selectByUsername(@Param("username") String username);
    
    /**
     * 查询用户列表
     */
    List<User> selectList(Map<String, Object> params);
    
    /**
     * 查询用户总数
     */
    int selectCount(Map<String, Object> params);
    
    /**
     * 插入用户
     */
    int insert(User user);
    
    /**
     * 更新用户
     */
    int update(User user);
    
    /**
     * 更新用户状态
     */
    int updateStatus(@Param("id") Long id, @Param("status") Integer status);
}
