<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="title" value="首页 - 工业设备交易平台" scope="request"/>
<jsp:include page="common/header.jsp"/>

<div class="container">
    <div class="jumbotron">
        <h1>工业设备交易平台</h1>
        <p>专业的B2B工业设备交易市场，连接买家和卖家</p>
        <p>
            <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/product/list">浏览商品</a>
            <c:if test="${sessionScope.user.userType == 2}">
                <a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/product/publish">发布商品</a>
            </c:if>
        </p>
    </div>

    <h2>商品分类</h2>
    <div class="row">
        <c:forEach items="${categories}" var="category">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h4><a href="${pageContext.request.contextPath}/product/list?categoryId=${category.id}">${category.name}</a></h4>
                        <p class="text-muted">${category.description}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <h2>最新商品</h2>
    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-3">
                <div class="thumbnail">
                    <img src="${product.mainImage != null ? product.mainImage : '/static/images/no-image.jpg'}" alt="${product.name}">
                    <div class="caption">
                        <h4><a href="${pageContext.request.contextPath}/product/detail/${product.id}">${product.name}</a></h4>
                        <p class="text-danger"><strong>¥<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></strong></p>
                        <p class="text-muted">${product.brand} | ${product.model}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="common/footer.jsp"/>
