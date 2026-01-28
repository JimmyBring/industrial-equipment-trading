<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="卖家信息" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>卖家信息</h2>
    <div class="panel panel-default">
        <div class="panel-body">
            <p><strong>公司名称：</strong>${seller.companyName}</p>
            <p><strong>联系人：</strong>${seller.realName}</p>
            <p><strong>联系电话：</strong>${seller.phone}</p>
            <p><strong>公司地址：</strong>${seller.companyAddress}</p>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
