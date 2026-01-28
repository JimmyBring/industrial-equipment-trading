<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="确认订单" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>确认订单</h2>
    <form id="orderForm">
        <input type="hidden" name="productId" value="${product.id}">
        <div class="form-group"><label>商品名称</label><input type="text" class="form-control" value="${product.name}" readonly></div>
        <div class="form-group"><label>单价</label><input type="text" class="form-control" value="¥${product.price}" readonly></div>
        <div class="form-group"><label>数量 *</label><input type="number" class="form-control" name="quantity" value="1" min="1" max="${product.stock}" required></div>
        <div class="form-group"><label>收货人 *</label><input type="text" class="form-control" name="receiverName" required></div>
        <div class="form-group"><label>联系电话 *</label><input type="text" class="form-control" name="receiverPhone" required></div>
        <div class="form-group"><label>收货地址 *</label><textarea class="form-control" name="receiverAddress" rows="3" required></textarea></div>
        <div class="form-group"><label>备注</label><textarea class="form-control" name="remark" rows="2"></textarea></div>
        <button type="submit" class="btn btn-primary btn-lg">提交订单</button>
    </form>
</div>
<script>
$('#orderForm').submit(function(e) {
    e.preventDefault();
    $.post('${pageContext.request.contextPath}/order/create', $(this).serialize(), function(result) {
        alert(result.message);
        if (result.success) window.location.href = '${pageContext.request.contextPath}/order/my-orders';
    });
});
</script>
<jsp:include page="../common/footer.jsp"/>
