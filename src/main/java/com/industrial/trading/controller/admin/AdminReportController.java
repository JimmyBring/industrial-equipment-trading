package com.industrial.trading.controller.admin;

import com.industrial.trading.entity.Report;
import com.industrial.trading.service.ReportService;
import com.industrial.trading.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员-举报管理控制器
 */
@Controller
@RequestMapping("/admin/reports")
public class AdminReportController {
    
    @Autowired
    private ReportService reportService;
    
    /**
     * 举报列表
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
        
        List<Report> reports = reportService.findList(params);
        int total = reportService.count(params);
        
        model.addAttribute("reports", reports);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("status", status);
        
        return "admin/reports";
    }
    
    /**
     * 回复举报
     */
    @PostMapping("/reply")
    @ResponseBody
    public Map<String, Object> reply(@RequestParam Integer id, 
                                     @RequestParam String adminReply) {
        try {
            reportService.handle(id, 3, adminReply);
            return ResultUtil.success("回复成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
    
    /**
     * 关闭举报
     */
    @PostMapping("/close")
    @ResponseBody
    public Map<String, Object> close(@RequestParam Integer id) {
        try {
            reportService.handle(id, 4, null);
            return ResultUtil.success("关闭成功");
        } catch (Exception e) {
            return ResultUtil.error(e.getMessage());
        }
    }
}
