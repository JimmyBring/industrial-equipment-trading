package com.industrial.trading.dao;

import com.industrial.trading.entity.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * 管理员Mapper接口
 */
public interface AdminMapper {
    
    /**
     * 根据用户名查询管理员
     */
    Admin selectByUsername(@Param("username") String username);
}
