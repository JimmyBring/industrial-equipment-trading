package com.industrial.trading.controller;

import com.industrial.trading.entity.User;
import com.industrial.trading.service.UserService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    /**
     * 登录页面
     */
    @GetMapping("/login")
    public String loginPage() {
        return "user/login";
    }
    
    /**
     * 登录处理
     */
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam String username, 
                                     @RequestParam String password, 
                                     HttpSession session) {
        try {
            User user = userService.login(username, password);
            session.setAttribute("user", user);
            return ResultUtil.success("登录成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 注册页面
     */
    @GetMapping("/register")
    public String registerPage() {
        return "user/register";
    }
    
    /**
     * 注册处理
     */
    @PostMapping("/register")
    @ResponseBody
    public Map<String, Object> register(User user) {
        try {
            userService.register(user);
            return ResultUtil.success("注册成功，请等待审核");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 退出登录
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
    
    /**
     * 获取当前用户
     */
    @GetMapping("/current")
    @ResponseBody
    public Map<String, Object> current(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return ResultUtil.success(user);
        }
        return ResultUtil.error("未登录");
    }
    
    /**
     * 查看卖家信息
     */
    @GetMapping("/seller/{id}")
    public String sellerInfo(@PathVariable Long id, Model model) {
        User seller = userService.findById(id);
        model.addAttribute("seller", seller);
        return "user/seller-info";
    }
}
