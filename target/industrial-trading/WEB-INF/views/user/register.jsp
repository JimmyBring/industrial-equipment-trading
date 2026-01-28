<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" value="用户注册" scope="request"/>
<jsp:include page="../common/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">用户注册</h3>
                </div>
                <div class="panel-body">
                    <form id="registerForm">
                        <div class="form-group">
                            <label>用户名 *</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="form-group">
                            <label>密码 *</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="form-group">
                            <label>真实姓名 *</label>
                            <input type="text" class="form-control" name="realName" required>
                        </div>
                        <div class="form-group">
                            <label>联系电话 *</label>
                            <input type="text" class="form-control" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input type="email" class="form-control" name="email">
                        </div>
                        <div class="form-group">
                            <label>用户类型 *</label>
                            <select class="form-control" name="userType" id="userType" required>
                                <option value="1">买家</option>
                                <option value="2">卖家</option>
                            </select>
                        </div>
                        <div id="sellerFields" style="display:none;">
                            <div class="form-group">
                                <label>公司名称</label>
                                <input type="text" class="form-control" name="companyName">
                            </div>
                            <div class="form-group">
                                <label>公司地址</label>
                                <input type="text" class="form-control" name="companyAddress">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">注册</button>
                    </form>
                    <hr>
                    <p class="text-center">
                        已有账号？<a href="${pageContext.request.contextPath}/user/login">立即登录</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {
    $('#userType').change(function() {
        if ($(this).val() == '2') {
            $('#sellerFields').show();
        } else {
            $('#sellerFields').hide();
        }
    });
    
    $('#registerForm').submit(function(e) {
        e.preventDefault();
        $.post('${pageContext.request.contextPath}/user/register', $(this).serialize(), function(result) {
            alert(result.message);
            if (result.success) {
                window.location.href = '${pageContext.request.contextPath}/user/login';
            }
        });
    });
});
</script>

<jsp:include page="../common/footer.jsp"/>
