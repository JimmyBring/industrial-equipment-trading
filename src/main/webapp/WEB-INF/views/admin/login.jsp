<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>管理员登录</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head><body>
<div class="container"><div class="row"><div class="col-md-4 col-md-offset-4" style="margin-top:100px;">
    <div class="panel panel-default"><div class="panel-heading"><h3>管理员登录</h3></div>
    <div class="panel-body">
        <form id="loginForm">
            <div class="form-group"><input type="text" class="form-control" name="username" placeholder="用户名" required></div>
            <div class="form-group"><input type="password" class="form-control" name="password" placeholder="密码" required></div>
            <button type="submit" class="btn btn-primary btn-block">登录</button>
        </form>
    </div></div>
</div></div></div>
<script>
$('#loginForm').submit(function(e) {
    e.preventDefault();
    $.post('${pageContext.request.contextPath}/admin/login', $(this).serialize(), function(result) {
        if (result.success) {
            window.location.href = '${pageContext.request.contextPath}/admin/dashboard';
        } else {
            alert(result.message);
        }
    });
});
</script>
</body></html>
