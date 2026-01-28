<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="提交举报" scope="request"/>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <h2>提交举报</h2>
    <form id="reportForm">
        <input type="hidden" name="orderId" value="${orderId}">
        <input type="hidden" name="productId" value="${productId}">
        <div class="form-group"><label>举报类型 *</label>
            <select class="form-control" name="reportType" required>
                <option value="1">商品异常</option>
                <option value="2">卖家异常</option>
                <option value="3">物流异常</option>
                <option value="4">其他</option>
            </select>
        </div>
        <div class="form-group"><label>举报标题 *</label><input type="text" class="form-control" name="title" required></div>
        <div class="form-group"><label>举报内容 *</label><textarea class="form-control" name="content" rows="5" required></textarea></div>
        <button type="submit" class="btn btn-primary">提交举报</button>
    </form>
</div>
<script>
$('#reportForm').submit(function(e) {
    e.preventDefault();
    $.post('${pageContext.request.contextPath}/report/submit', $(this).serialize(), function(result) {
        alert(result.message);
        if (result.success) window.location.href = '${pageContext.request.contextPath}/report/my-reports';
    });
});
</script>
<jsp:include page="../common/footer.jsp"/>
