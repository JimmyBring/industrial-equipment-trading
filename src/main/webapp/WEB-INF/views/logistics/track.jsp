<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="物流跟踪" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>物流跟踪</h2>
    <c:if test="${logistics != null}">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>物流公司：</strong>${logistics.logisticsCompany}</p>
                <p><strong>物流单号：</strong>${logistics.logisticsNo}</p>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">物流跟踪信息</div>
            <div class="panel-body">
                <c:forEach items="${logistics.trackList}" var="track">
                    <p><strong>${track.createTime}</strong> ${track.location} - ${track.content}</p>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${logistics == null}">
        <p class="text-center">暂无物流信息</p>
    </c:if>
</div>
<jsp:include page="../common/footer.jsp"/>
