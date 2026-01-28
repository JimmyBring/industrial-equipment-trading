<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>商品管理</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head><body>
<div class="container">
    <h2>商品管理</h2>
    <table class="table table-striped">
        <thead><tr><th>商品名称</th><th>价格</th><th>状态</th><th>操作</th></tr></thead>
        <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.name}</td><td>¥${product.price}</td>
                    <td>
                        <c:choose>
                            <c:when test="${product.status == 0}">待审核</c:when>
                            <c:when test="${product.status == 1}">已上架</c:when>
                            <c:when test="${product.status == 2}">已下架</c:when>
                            <c:when test="${product.status == 3}">审核拒绝</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${product.status == 0}">
                            <button class="btn btn-sm btn-success" onclick="audit(${product.id}, 1)">通过</button>
                            <button class="btn btn-sm btn-danger" onclick="audit(${product.id}, 3)">拒绝</button>
                        </c:if>
                        <c:if test="${product.status == 1}">
                            <button class="btn btn-sm btn-warning" onclick="audit(${product.id}, 2)">下架</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script>
function audit(id, status) {
    $.post('${pageContext.request.contextPath}/admin/products/audit', {id: id, status: status}, function(result) {
        alert(result.message);
        if (result.success) location.reload();
    });
}
</script>
</body></html>
