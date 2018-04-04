<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>服务请求统计表</title>
    <shiro:hasPermission name="activ:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="activ:delete">
        <c:set value="1" var="allow_delete"/>
    </shiro:hasPermission>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <link href="${ctx}/static/css/jquery-ui.css" rel="stylesheet">
    <style>
        .ui-autocomplete-loading {
            background: white url("${ctx}/static/img/ui-anim_basic_16x16.gif") right center no-repeat;
        }
    </style>
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <iframe src="${ctx}/nurs/report/index.html/#/ServReqReport?v=${webVersion}" frameborder="0" style="width: 100%;height: 99%"></iframe>

    </div>


    <!--main content end-->
    <jsp:include page="../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域

    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'jqueryui', 'form'], function () {
        var $= layui.jquery, layer = layui.layer, datatable = layui.datatable;
        if('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }

        // $(function () {
        //     initTable();
        // });

        $(".btn-search").click(function () {
            initTable();
        });


        //初始化表格

        $("#add").click(function () {
            window.location.href = "${ctx}/activ/create"
        });

    });

</script>


</body>
</html>
