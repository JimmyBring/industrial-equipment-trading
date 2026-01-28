package com.industrial.trading.controller;

import com.industrial.trading.entity.Report;
import com.industrial.trading.entity.User;
import com.industrial.trading.service.ReportService;
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
 * 举报控制器
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    
    @Autowired
    private ReportService reportService;
    
    /**
     * 举报页面
     */
    @GetMapping("/submit")
    public String submitPage(@RequestParam(required = false) Integer orderId,
                            @RequestParam(required = false) Integer productId,
                            Model model) {
        model.addAttribute("orderId", orderId);
        model.addAttribute("productId", productId);
        return "report/submit";
    }
    
    /**
     * 提交举报
     */
    @PostMapping("/submit")
    @ResponseBody
    public Map<String, Object> submit(Report report, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            report.setUserId(user.getId().intValue());
            reportService.submit(report);
            return ResultUtil.success("举报提交成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 我的举报
     */
    @GetMapping("/my-reports")
    public String myReports(@RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "10") int pageSize,
                           HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        
        Map<String, Object> params = new HashMap<>();
        params.put("userId", user.getId().intValue());
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);
        
        List<Report> reports = reportService.findList(params);
        int total = reportService.count(params);
        
        model.addAttribute("reports", reports);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        
        return "report/my-reports";
    }
}
