package com.industrial.trading.controller.admin;

import com.industrial.trading.entity.Product;
import com.industrial.trading.service.ProductService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员-商品管理控制器
 */
@Controller
@RequestMapping("/admin/products")
public class AdminProductController {
    
    @Autowired
    private ProductService productService;
    
    /**
     * 商品列表
     */
    @GetMapping
    public String list(@RequestParam(required = false) Integer status,
                      @RequestParam(defaultValue = "1") int page,
                      @RequestParam(defaultValue = "20") int pageSize,
                      Model model) {
        Map<String, Object> params = new HashMap<>();
        if (status != null) {
            params.put("status", status);
        }
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<Product> products = productService.findList(params);
        int total = productService.count(params);
        
        model.addAttribute("products", products);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("status", status);
        
        return "admin/products";
    }
    
    /**
     * 审核商品
     */
    @PostMapping("/audit")
    @ResponseBody
    public Map<String, Object> audit(@RequestParam Integer id, @RequestParam Integer status) {
        try {
            productService.audit(id, status);
            return ResultUtil.success("审核成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 下架商品
     */
    @PostMapping("/offline")
    @ResponseBody
    public Map<String, Object> offline(@RequestParam Integer id) {
        try {
            productService.audit(id, 2);
            return ResultUtil.success("下架成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
}
