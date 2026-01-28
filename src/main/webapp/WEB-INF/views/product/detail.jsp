<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="title" value="${product.name}" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-6"><img src="${product.mainImage}" class="img-responsive"></div>
        <div class="col-md-6">
            <h2>${product.name}</h2>
            <p class="text-danger"><strong>价格：¥<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></strong></p>
            <p>品牌：${product.brand}</p>
            <p>型号：${product.model}</p>
            <p>库存：${product.stock} ${product.unit}</p>
            <a href="${pageContext.request.contextPath}/order/confirm/${product.id}" class="btn btn-primary btn-lg">立即购买</a>
        </div>
    </div>
    <div class="row"><div class="col-md-12"><h3>商品描述</h3><p>${product.description}</p></div></div>
</div>
<jsp:include page="../common/footer.jsp"/>
