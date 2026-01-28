package com.industrial.trading.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密工具类
 */
public class MD5Util {
    
    /**
     * MD5加密
     * @param source 原始字符串
     * @return 加密后的字符串
     */
    public static String encrypt(String source) {
        if (source == null || source.length() == 0) {
            return null;
        }
        
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(source.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                String hex = Integer.toHexString(b & 0xFF);
                if (hex.length() == 1) {
                    sb.append("0");
                }
                sb.append(hex);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5加密失败", e);
        }
    }
    
    public static void main(String[] args) {
        // 测试: admin123 => 0192023a7bbd73250516f069df18b500
        System.out.println("admin123: " + encrypt("admin123"));
        // 测试: 123456 => e10adc3949ba59abbe56e057f20f883e
        System.out.println("123456: " + encrypt("123456"));
    }
}
