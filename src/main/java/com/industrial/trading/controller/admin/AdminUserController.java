package com.industrial.trading.controller.admin;

import com.industrial.trading.entity.User;
import com.industrial.trading.service.UserService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员-用户管理控制器
 */
@Controller
@RequestMapping("/admin/users")
public class AdminUserController {
    
    @Autowired
    private UserService userService;
    
    /**
     * 用户列表
     */
    @GetMapping
    public String list(@RequestParam(required = false) Integer userType,
                      @RequestParam(required = false) Integer status,
                      @RequestParam(defaultValue = "1") int page,
                      @RequestParam(defaultValue = "20") int pageSize,
                      Model model) {
        Map<String, Object> params = new HashMap<>();
        if (userType != null) {
            params.put("userType", userType);
        }
        if (status != null) {
            params.put("status", status);
        }
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<User> users = userService.findList(params);
        int total = userService.count(params);
        
        model.addAttribute("users", users);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("userType", userType);
        model.addAttribute("status", status);
        
        return "admin/users";
    }
    
    /**
     * 审核用户
     */
    @PostMapping("/audit")
    @ResponseBody
    public Map<String, Object> audit(@RequestParam Long id, @RequestParam Integer status) {
        try {
            userService.audit(id, status);
            return ResultUtil.success("审核成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 禁用用户
     */
    @PostMapping("/disable")
    @ResponseBody
    public Map<String, Object> disable(@RequestParam Long id) {
        try {
            userService.audit(id, 2);
            return ResultUtil.success("禁用成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
}
