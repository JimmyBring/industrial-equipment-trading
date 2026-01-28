<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title != null ? title : '工业设备交易平台'}</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">工业设备交易平台</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/product/list">商品市场</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                ${sessionScope.user.realName} <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <c:if test="${sessionScope.user.userType == 2}">
                                    <li><a href="${pageContext.request.contextPath}/product/publish">发布商品</a></li>
                                    <li><a href="${pageContext.request.contextPath}/product/my-products">我的商品</a></li>
                                    <li class="divider"></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath}/order/my-orders">我的订单</a></li>
                                <li><a href="${pageContext.request.contextPath}/report/my-reports">我的举报</a></li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/user/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/user/login">登录</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/register">注册</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<div style="height: 70px;"></div>
