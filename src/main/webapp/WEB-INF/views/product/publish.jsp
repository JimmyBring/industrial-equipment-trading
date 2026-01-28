<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="发布商品" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>发布商品</h2>
    <form id="publishForm">
        <div class="form-group"><label>商品名称 *</label><input type="text" class="form-control" name="name" required></div>
        <div class="form-group"><label>分类 *</label><select class="form-control" name="categoryId" required>
            <c:forEach items="${categories}" var="category"><option value="${category.id}">${category.name}</option></c:forEach>
        </select></div>
        <div class="form-group"><label>价格 *</label><input type="number" class="form-control" name="price" step="0.01" required></div>
        <div class="form-group"><label>库存 *</label><input type="number" class="form-control" name="stock" required></div>
        <div class="form-group"><label>品牌</label><input type="text" class="form-control" name="brand"></div>
        <div class="form-group"><label>型号</label><input type="text" class="form-control" name="model"></div>
        <div class="form-group"><label>描述</label><textarea class="form-control" name="description" rows="5"></textarea></div>
        <button type="submit" class="btn btn-primary">发布商品</button>
    </form>
</div>
<script>
$('#publishForm').submit(function(e) {
    e.preventDefault();
    $.post('${pageContext.request.contextPath}/product/publish', $(this).serialize(), function(result) {
        alert(result.message);
        if (result.success) window.location.href = '${pageContext.request.contextPath}/product/my-products';
    });
});
</script>
<jsp:include page="../common/footer.jsp"/>
