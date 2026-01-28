<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="我的订单" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>我的订单</h2>
    <ul class="nav nav-tabs">
        <li class="${type == 'buyer' ? 'active' : ''}"><a href="?type=buyer">我的购买</a></li>
        <li class="${type == 'seller' ? 'active' : ''}"><a href="?type=seller">我的销售</a></li>
    </ul>
    <table class="table table-striped">
        <thead><tr><th>订单号</th><th>商品</th><th>金额</th><th>状态</th><th>操作</th></tr></thead>
        <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.orderNo}</td>
                    <td>${order.productName}</td>
                    <td>¥${order.totalAmount}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 1}">待发货</c:when>
                            <c:when test="${order.status == 2}">已发货</c:when>
                            <c:when test="${order.status == 3}">已完成</c:when>
                            <c:when test="${order.status == 4}">已取消</c:when>
                        </c:choose>
                    </td>
                    <td><a href="${pageContext.request.contextPath}/order/detail/${order.id}">查看</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="../common/footer.jsp"/>
