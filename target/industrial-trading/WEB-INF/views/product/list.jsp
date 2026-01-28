<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="title" value="商品列表" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>商品列表</h2>
    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-3"><div class="thumbnail">
                <img src="${product.mainImage}" alt="${product.name}">
                <div class="caption">
                    <h4><a href="${pageContext.request.contextPath}/product/detail/${product.id}">${product.name}</a></h4>
                    <p class="text-danger"><strong>¥<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></strong></p>
                </div>
            </div></div>
        </c:forEach>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
