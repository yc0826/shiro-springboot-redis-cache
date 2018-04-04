<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>
    <title>资源管理</title>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.css?v=${webVersion}" >
    <link rel="stylesheet" href="${ctx}/static/css/jquery.treetable.css">
    <link rel="stylesheet" href="${ctx}/static/css/jquery.treetable.theme.default.css">
</head>

<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">
    <jsp:include page="../../header.jsp"/>
    <jsp:include page="../../aside.jsp"/>
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>菜单管理</h5>
            </div>
            <div class="form-horizontal style-form" >
                <table id="table" style="visibility: hidden">
                    <thead>
                    <tr>
                        <th width="130px;">名称</th>
                        <th width="50px;">类型</th>
                        <th width="300px;">URL路径</th>
                        <th width="90px;">权限字符串</th>
                        <th width="100px;">操作</th>
                    </tr>
                    </thead>
                    <tbody >
                    <c:forEach items="${resourceList}" var="resource">
                        <tr data-tt-id='${resource.resoCode}'
                            <c:if test="${not resource.rootNode}">data-tt-parent-id='${resource.parentResoCode}'</c:if>>
                            <td class="autoIfreamHeight" width="130px;">${resource.resoName}</td>
                            <td width="50px;">
                                <c:if test="${resource.resoTypeCode == '00040003'}">菜单</c:if>
                                <c:if test="${resource.resoTypeCode == '00040004'}">按钮</c:if>
                            <td width="300px;">${resource.url}</td>
                            <td width="90px;">${resource.permission}</td>
                            <td width="100px;">
                                <c:if test="${resource.resoTypeCode ne '00040004'}">
                                    <a href="${ctx}/resource/${resource.resoCode}/appendChild">添加子节点</a>
                                </c:if>
                                <a href="${ctx}/resource/${resource.resoCode}/update">修改</a>
                                <c:if test="${not resource.rootNode}">
                                    <a class="deleteBtn" href="#" data-id="${resource.resoCode}">删除</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="../../footer.jsp"/>
</div>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['element', 'treetable'], function () {
        var $ = layui.jquery;
        $(function () {
            $("#table").treetable({expandable: true}).treetable("expandNode", 1);
            $("#table tbody").on("mousedown", "tr", function() {
                $(".selected").not(this).removeClass("selected");
                $(this).toggleClass("selected");
            });
            $("table").css("visibility", "visible");
            $(".deleteBtn").on('click', function () {
                if (confirm("确认删除吗?")) {
                    location.href = "${ctx}/resource/" + $(this).data("id") + "/delete";
                }
            });
            $(".autoIfreamHeight").on("click", function () {
                $("#iframe", parent.document).height($(".col_main").height());
            });
        });
    });
</script>

</body>
</html>
