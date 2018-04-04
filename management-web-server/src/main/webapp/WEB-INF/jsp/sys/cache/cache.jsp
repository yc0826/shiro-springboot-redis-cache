<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>缓存</title>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
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
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>会所管理</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item layui-row">

                        <div class="layui-inline layui-col-md8">
                            <div class="layui-inline">
                                <label class="layui-form-label">状态</label>
                                <div class="layui-input-inline">
                                    <select name="cacheName">
                                        <option value="all">全选</option>
                                        <c:forEach items="${shb:getListByType('0069')}" var="gen">
                                            <option value="${gen.genSubName}">${gen.resItem}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="layui-inline layui-col-md3">
                            <shiro:hasPermission name="cache:refresh">
                                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="refresh">刷 新</button>
                            </shiro:hasPermission>
                        </div>

                    </div>
                </form>
            </div>

        </div>

    </div>

    <!--main content end-->
    <jsp:include page="../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'form'], function () {
        var $ = layui.jquery, element = layui.element, layer = layui.layer, form = layui.form;

        form.on("submit(refresh)", function (data) {
            $.post("${ctx}/cache/refreshCache",
                {
                    cacheName: data.field.cacheName
                },
                function (data) {
                    if (data.status === 200) {
                        layer.alert("缓存刷新成功");
                    }
                }
            );
            return false;
        });

    });


</script>
</body>
</html>
