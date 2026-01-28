<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="我的商品" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>我的商品</h2>
    <table class="table table-striped">
        <thead><tr><th>商品名称</th><th>价格</th><th>库存</th><th>状态</th><th>操作</th></tr></thead>
        <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.name}</td>
                    <td>¥${product.price}</td>
                    <td>${product.stock}</td>
                    <td>
                        <c:choose>
                            <c:when test="${product.status == 0}">待审核</c:when>
                            <c:when test="${product.status == 1}">已上架</c:when>
                            <c:when test="${product.status == 2}">已下架</c:when>
                            <c:when test="${product.status == 3}">审核拒绝</c:when>
                        </c:choose>
                    </td>
                    <td><a href="${pageContext.request.contextPath}/product/detail/${product.id}">查看</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="../common/footer.jsp"/>
