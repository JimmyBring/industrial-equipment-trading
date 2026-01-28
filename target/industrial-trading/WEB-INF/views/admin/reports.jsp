<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>举报管理</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head><body>
<div class="container">
    <h2>举报管理</h2>
    <table class="table table-striped">
        <thead><tr><th>标题</th><th>举报人</th><th>状态</th><th>操作</th></tr></thead>
        <tbody>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.title}</td>
                    <td>${report.user.username}</td>
                    <td>${report.status == 1 ? '待处理' : (report.status == 3 ? '已处理' : '已关闭')}</td>
                    <td>
                        <c:if test="${report.status == 1}">
                            <button class="btn btn-sm btn-primary" onclick="reply(${report.id})">回复</button>
                            <button class="btn btn-sm btn-warning" onclick="close(${report.id})">关闭</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script>
function reply(id) {
    var adminReply = prompt('请输入回复内容');
    if (adminReply) {
        $.post('${pageContext.request.contextPath}/admin/reports/reply', {id: id, adminReply: adminReply}, function(result) {
            alert(result.message);
            if (result.success) location.reload();
        });
    }
}
function close(id) {
    if (confirm('确认关闭此举报？')) {
        $.post('${pageContext.request.contextPath}/admin/reports/close', {id: id}, function(result) {
            alert(result.message);
            if (result.success) location.reload();
        });
    }
}
</script>
</body></html>
