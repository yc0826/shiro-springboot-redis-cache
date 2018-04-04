<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>授权管理</title>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">

</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <jsp:include page="../../header.jsp"/>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <jsp:include page="../../aside.jsp"/>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <div class="layui-body">


        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>授权管理</h5>
            </div>
            <div class="form-horizontal style-form">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select name="subsyCode">
                                        <option value="">请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}">${subsy.subsyDispName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input id="name" name="name" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline">
                                    <input id="mobile" name="mobile" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                                <button type="reset" class="layui-btn layui-btn-normal" >清 空</button>
                                <shiro:hasPermission name="authorization:create">
                                    <button id="add" class="layui-btn layui-btn-normal" lay-submit lay-filter="add">新 增</button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 25%;">会所</th>
                                    <th style="width: 25%;">用户</th>
                                    <th style="width: 25%;">角色列表</th>
                                    <th style="width: 25%;">手机号</th>
                                    <th style="width: 25%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>


        </div>

    </div><!-- /col-xs-12 END SECTION MIDDLE -->

    <jsp:include page="../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<!--script for this page-->
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer, form = layui.form,
            datatable = layui.datatable;

        form.on('submit(search)', function (data) {
            initTable(data.field.subsyCode, data.field.name, data.field.mobile);
            return false;
        });

        form.on('submit(add)', function () {
            window.location.href = "${ctx}/authorization/create";
            return false;
        });

        $(function () {
            initTable();
        });

        //初始化表格
        function initTable(subsyCode, name, mobile) {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/authorization/getAuthorizationListData';
            json.param = [
                {
                    name: "subsyCode",
                    value: subsyCode
                }, {
                    name: "name",
                    value: name
                }, {
                    name: "mobile",
                    value: mobile
                }];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "subsyName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "name",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "rollNames",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "mobile",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        <shiro:hasPermission name="authorization:update">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.userCode + "," + row.subsyCode + "\">");
                        array.push("<i title=\"编辑\" class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        <shiro:hasPermission name="authorization:delete">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm delete\" vb=\"" + row.userCode + "," + row.subsyCode + "\">");
                        array.push("<i title=\"删除\" class=\"layui-icon\">&#xe640;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $(document).on('click', ".toEdit", function () {
            var codes = $(this).attr("vb");
            window.location.href = "${ctx}/authorization/" + codes + "/update"
        });

        $(document).on('click', ".delete", function () {
            var codes = $(this).attr("vb");
            layer.confirm("是否删除？", function (index) {
                $.post("${ctx}/authorization/" + codes + "/delete", function (data) {
                    if (data.status === 200) {
                        layer.alert("操作成功");
                        $("#table_data").dataTable().fnDraw(false);
                    } else {
                        //layer.alert(data.errorMsg);
                        if(data.status === 500){
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }, 'json');
                layer.close(index);
            })

        });

    });

</script>
</body>
</html>
