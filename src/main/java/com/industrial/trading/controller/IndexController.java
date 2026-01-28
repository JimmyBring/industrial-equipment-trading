package com.industrial.trading.controller;

import com.industrial.trading.entity.Category;
import com.industrial.trading.entity.Product;
import com.industrial.trading.service.CategoryService;
import com.industrial.trading.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页控制器
 */
@Controller
public class IndexController {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProductService productService;
    
    @GetMapping("/")
    public String index(Model model) {
        // 查询所有分类
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        
        // 查询最新商品（已上架）
        Map<String, Object> params = new HashMap<>();
        params.put("status", 1);
        params.put("offset", 0);
        params.put("limit", 8);
        List<Product> products = productService.findList(params);
        model.addAttribute("products", products);
        
        return "index";
    }
}
