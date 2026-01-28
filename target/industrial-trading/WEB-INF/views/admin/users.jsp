<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>用户管理</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head><body>
<div class="container">
    <h2>用户管理</h2>
    <table class="table table-striped">
        <thead><tr><th>用户名</th><th>姓名</th><th>类型</th><th>状态</th><th>操作</th></tr></thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.username}</td><td>${user.realName}</td>
                    <td>${user.userType == 1 ? '买家' : '卖家'}</td>
                    <td>${user.status == 0 ? '待审核' : (user.status == 1 ? '正常' : '禁用')}</td>
                    <td>
                        <c:if test="${user.status == 0}">
                            <button class="btn btn-sm btn-success" onclick="audit(${user.id}, 1)">通过</button>
                            <button class="btn btn-sm btn-danger" onclick="audit(${user.id}, 2)">拒绝</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script>
function audit(id, status) {
    $.post('${pageContext.request.contextPath}/admin/users/audit', {id: id, status: status}, function(result) {
        alert(result.message);
        if (result.success) location.reload();
    });
}
</script>
</body></html>
