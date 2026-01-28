package com.industrial.trading.controller;

import com.industrial.trading.entity.Logistics;
import com.industrial.trading.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 物流控制器
 */
@Controller
@RequestMapping("/logistics")
public class LogisticsController {
    
    @Autowired
    private LogisticsService logisticsService;
    
    /**
     * 物流跟踪
     */
    @GetMapping("/track/{orderId}")
    public String track(@PathVariable Integer orderId, Model model) {
        Logistics logistics = logisticsService.findByOrderId(orderId);
        model.addAttribute("logistics", logistics);
        return "logistics/track";
    }
}
