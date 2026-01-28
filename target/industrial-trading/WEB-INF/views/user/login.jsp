<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="用户登录" scope="request"/>
<jsp:include page="../common/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">用户登录</h3>
                </div>
                <div class="panel-body">
                    <form id="loginForm">
                        <div class="form-group">
                            <label>用户名</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </form>
                    <hr>
                    <p class="text-center">
                        还没有账号？<a href="${pageContext.request.contextPath}/user/register">立即注册</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        $.post('${pageContext.request.contextPath}/user/login', $(this).serialize(), function(result) {
            if (result.success) {
                alert(result.message);
                window.location.href = '${pageContext.request.contextPath}/';
            } else {
                alert(result.message);
            }
        });
    });
});
</script>

<jsp:include page="../common/footer.jsp"/>
