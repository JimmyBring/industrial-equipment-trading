package com.industrial.trading.controller.admin;

import com.industrial.trading.dao.AdminMapper;
import com.industrial.trading.entity.Admin;
import com.industrial.trading.util.MD5Util;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 管理员控制器
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminMapper adminMapper;
    
    /**
     * 管理员登录页面
     */
    @GetMapping("/login")
    public String loginPage() {
        return "admin/login";
    }
    
    /**
     * 管理员登录处理
     */
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam String username, 
                                     @RequestParam String password, 
                                     HttpSession session) {
        try {
            Admin admin = adminMapper.selectByUsername(username);
            if (admin == null) {
                return ResultUtil.error("管理员不存在");
            }
            
            String encryptedPassword = MD5Util.encrypt(password);
            if (!encryptedPassword.equals(admin.getPassword())) {
                return ResultUtil.error("密码错误");
            }
            
            if (admin.getStatus() == 0) {
                return ResultUtil.error("账号已被禁用");
            }
            
            session.setAttribute("admin", admin);
            return ResultUtil.success("登录成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 管理员退出
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/admin/login";
    }
    
    /**
     * 管理首页
     */
    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }
}
