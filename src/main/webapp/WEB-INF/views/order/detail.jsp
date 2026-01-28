<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="订单详情" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>订单详情</h2>
    <div class="panel panel-default">
        <div class="panel-body">
            <p><strong>订单号：</strong>${order.orderNo}</p>
            <p><strong>商品名称：</strong>${order.productName}</p>
            <p><strong>购买数量：</strong>${order.quantity}</p>
            <p><strong>订单金额：</strong>¥${order.totalAmount}</p>
            <p><strong>收货人：</strong>${order.receiverName}</p>
            <p><strong>联系电话：</strong>${order.receiverPhone}</p>
            <p><strong>收货地址：</strong>${order.receiverAddress}</p>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
