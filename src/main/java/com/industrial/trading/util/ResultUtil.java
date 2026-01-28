package com.industrial.trading.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回结果工具类
 */
public class ResultUtil {
    
    /**
     * 返回成功结果
     */
    public static Map<String, Object> success() {
        return success("操作成功");
    }
    
    /**
     * 返回成功结果（带消息）
     */
    public static Map<String, Object> success(String message) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("message", message);
        return result;
    }
    
    /**
     * 返回成功结果（带数据）
     */
    public static Map<String, Object> success(Object data) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("data", data);
        return result;
    }
    
    /**
     * 返回成功结果（带消息和数据）
     */
    public static Map<String, Object> success(String message, Object data) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("message", message);
        result.put("data", data);
        return result;
    }
    
    /**
     * 返回失败结果
     */
    public static Map<String, Object> error(String message) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        result.put("message", message);
        return result;
    }
}
