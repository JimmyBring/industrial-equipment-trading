// 工业设备交易平台公共JS

// 格式化金额
function formatMoney(money) {
    return '¥' + parseFloat(money).toFixed(2).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
}

// 格式化日期
function formatDate(timestamp) {
    var date = new Date(timestamp);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var h = date.getHours();
    var min = date.getMinutes();
    var s = date.getSeconds();
    m = m < 10 ? '0' + m : m;
    d = d < 10 ? '0' + d : d;
    h = h < 10 ? '0' + h : h;
    min = min < 10 ? '0' + min : min;
    s = s < 10 ? '0' + s : s;
    return y + '-' + m + '-' + d + ' ' + h + ':' + min + ':' + s;
}

// Ajax请求配置
$.ajaxSetup({
    contentType: "application/x-www-form-urlencoded;charset=UTF-8",
    complete: function(xhr, status) {
        if (xhr.status == 401) {
            alert('请先登录');
            window.location.href = '/user/login';
        }
    }
});
