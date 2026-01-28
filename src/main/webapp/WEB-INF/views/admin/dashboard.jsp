<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>管理后台</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head><body>
<nav class="navbar navbar-inverse"><div class="container-fluid">
    <div class="navbar-header"><a class="navbar-brand" href="#">管理后台</a></div>
    <ul class="nav navbar-nav">
        <li><a href="${pageContext.request.contextPath}/admin/users">用户管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/products">商品管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/reports">举报管理</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}/admin/logout">退出</a></li>
    </ul>
</div></nav>
<div class="container"><h2>管理后台首页</h2><p>欢迎使用工业设备交易平台管理系统</p></div>
</body></html>
