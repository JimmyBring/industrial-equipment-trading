package com.industrial.trading.controller;

import com.industrial.trading.entity.Category;
import com.industrial.trading.entity.Product;
import com.industrial.trading.entity.User;
import com.industrial.trading.service.CategoryService;
import com.industrial.trading.service.ProductService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品控制器
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    /**
     * 商品列表
     */
    @GetMapping("/list")
    public String list(@RequestParam(required = false) Integer categoryId,
                      @RequestParam(required = false) String keyword,
                      @RequestParam(defaultValue = "1") int page,
                      @RequestParam(defaultValue = "12") int pageSize,
                      Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("status", 1); // 只显示已上架的商品
        if (categoryId != null) {
            params.put("categoryId", categoryId);
        }
        if (keyword != null && !keyword.isEmpty()) {
            params.put("keyword", keyword);
        }
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<Product> products = productService.findList(params);
        int total = productService.count(params);
        List<Category> categories = categoryService.findAll();
        
        model.addAttribute("products", products);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("categories", categories);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("keyword", keyword);
        
        return "product/list";
    }
    
    /**
     * 商品详情
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        Product product = productService.findById(id);
        if (product != null) {
            // 增加浏览量
            productService.increaseViewCount(id);
            model.addAttribute("product", product);
            return "product/detail";
        }
        return "redirect:/product/list";
    }
    
    /**
     * 商品上架页面
     */
    @GetMapping("/publish")
    public String publishPage(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "product/publish";
    }
    
    /**
     * 发布商品
     */
    @PostMapping("/publish")
    @ResponseBody
    public Map<String, Object> publish(Product product, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            if (user.getUserType() != 2) {
                return ResultUtil.error("只有卖家可以发布商品");
            }
            product.setSellerId(user.getId().intValue());
            productService.publish(product);
            return ResultUtil.success("商品发布成功，等待审核");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 我的商品
     */
    @GetMapping("/my-products")
    public String myProducts(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "10") int pageSize,
                            HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        
        Map<String, Object> params = new HashMap<>();
        params.put("sellerId", user.getId().intValue());
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<Product> products = productService.findList(params);
        int total = productService.count(params);
        
        model.addAttribute("products", products);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        
        return "product/my-products";
    }
}
