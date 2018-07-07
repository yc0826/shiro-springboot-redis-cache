<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>shiro管理平台</title>

    <%@ include file="../jsp/common/resource.jsp"%>
    <%@ include file="../jsp/common/tags.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="header.jsp"/>

    <jsp:include page="aside.jsp"/>

    <div class="layui-body index-body">
        欢迎
    </div>
    <jsp:include page="footer.jsp"/>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.jquery;
    });


</script>
</body>
</html>