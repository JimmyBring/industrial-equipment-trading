package com.industrial.trading.controller;

import com.industrial.trading.entity.Order;
import com.industrial.trading.entity.Product;
import com.industrial.trading.entity.User;
import com.industrial.trading.service.OrderService;
import com.industrial.trading.service.ProductService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单控制器
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private ProductService productService;
    
    /**
     * 确认订单页面
     */
    @GetMapping("/confirm/{productId}")
    public String confirmPage(@PathVariable Integer productId, Model model) {
        Product product = productService.findById(productId);
        model.addAttribute("product", product);
        return "order/confirm";
    }
    
    /**
     * 创建订单
     */
    @PostMapping("/create")
    @ResponseBody
    public Map<String, Object> create(@RequestParam Integer productId,
                                     @RequestParam Integer quantity,
                                     @RequestParam String receiverName,
                                     @RequestParam String receiverPhone,
                                     @RequestParam String receiverAddress,
                                     @RequestParam(required = false) String remark,
                                     HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            Product product = productService.findById(productId);
            
            if (product == null) {
                return ResultUtil.error("商品不存在");
            }
            
            if (product.getStock() < quantity) {
                return ResultUtil.error("库存不足");
            }
            
            Order order = new Order();
            order.setBuyerId(user.getId().intValue());
            order.setSellerId(product.getSellerId());
            order.setProductId(productId);
            order.setProductName(product.getName());
            order.setProductImage(product.getMainImage());
            order.setPrice(product.getPrice());
            order.setQuantity(quantity);
            order.setTotalAmount(product.getPrice().multiply(new BigDecimal(quantity)));
            order.setReceiverName(receiverName);
            order.setReceiverPhone(receiverPhone);
            order.setReceiverAddress(receiverAddress);
            order.setRemark(remark);
            
            orderService.create(order);
            return ResultUtil.success("订单创建成功", order);
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 我的订单
     */
    @GetMapping("/my-orders")
    public String myOrders(@RequestParam(defaultValue = "buyer") String type,
                          @RequestParam(defaultValue = "1") int page,
                          @RequestParam(defaultValue = "10") int pageSize,
                          HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        
        Map<String, Object> params = new HashMap<>();
        if ("buyer".equals(type)) {
            params.put("buyerId", user.getId().intValue());
        } else {
            params.put("sellerId", user.getId().intValue());
        }
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<Order> orders = orderService.findList(params);
        int total = orderService.count(params);
        
        model.addAttribute("orders", orders);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("type", type);
        
        return "order/my-orders";
    }
    
    /**
     * 订单详情
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        Order order = orderService.findById(id);
        model.addAttribute("order", order);
        return "order/detail";
    }
}
