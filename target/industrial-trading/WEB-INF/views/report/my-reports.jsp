<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="我的举报" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>我的举报</h2>
    <table class="table table-striped">
        <thead><tr><th>标题</th><th>类型</th><th>状态</th><th>提交时间</th></tr></thead>
        <tbody>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.title}</td>
                    <td>
                        <c:choose>
                            <c:when test="${report.reportType == 1}">商品异常</c:when>
                            <c:when test="${report.reportType == 2}">卖家异常</c:when>
                            <c:when test="${report.reportType == 3}">物流异常</c:when>
                            <c:when test="${report.reportType == 4}">其他</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${report.status == 1}">待处理</c:when>
                            <c:when test="${report.status == 2}">处理中</c:when>
                            <c:when test="${report.status == 3}">已处理</c:when>
                            <c:when test="${report.status == 4}">已关闭</c:when>
                        </c:choose>
                    </td>
                    <td>${report.createTime}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="../common/footer.jsp"/>
