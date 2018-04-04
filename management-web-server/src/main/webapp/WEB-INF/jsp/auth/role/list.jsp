<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>角色管理</title>
    <shiro:hasPermission name="role:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="role:delete">
        <c:set value="1" var="allow_delete"/>
    </shiro:hasPermission>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <style>
        .text-left {
            text-align: left !important;

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


        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i> 角色管理</h5>
            </div>
            <div class="form-horizontal style-form">
                <div class="layui-inline layui-col-md8">
                    <div class="layui-inline">
                    </div>
                </div>
                <div class="layui-inline layui-col-md3">
                    <shiro:hasPermission name="role:create">
                        <button id="add" type="button" class="layui-btn layui-btn-normal">新 增</button>
                    </shiro:hasPermission>
                </div>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover" >
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 20%;">角色名称</th>
                                    <th style="width: 40%; text-align: center !important;">角色描述</th>
                                    <th style="width: 20%;">操作</th>
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

    <!--main content end-->
    <jsp:include page="../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>


    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery'], function () {
        var $ = layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable;
        $(function () {
            initTable();
        });


        //初始化表格
        function initTable() {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/role/getRoleListData';
            json.param = [];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "rollName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "rollDesc",
                    "sWidth": "180px",
                    "sClass": "text-left"
                },
                {
                    "mData": "rollCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        <c:if test="${allow_update==1}">
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.rollCode + "\">");
                        array.push("<i class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>")
                        </c:if>
                        <c:if test="${allow_delete==1}">
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm deleteRoll\" vb=\"" + row.rollCode + "\">");
                        array.push("<i class=\"layui-icon\">&#xe640;</i>");
                        array.push("</button>")
                        </c:if>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $("#add").click(function () {
            window.location.href = "${ctx}/role/create"
        });

        $(document).on('click', ".toEdit", function () {
            var rollCode = $(this).attr("vb");
            window.location.href = "${ctx}/role/" + rollCode + "/update"
        });
        $(document).on('click', ".deleteRoll", function () {
            var rollCode = $(this).attr("vb");
            layer.confirm('是否删除？', {icon: 3, title: '提示'}, function (index) {
                    $.post("${ctx}/role/" + rollCode + "/delete",
                        function (data) {
                            if (data.status === 200) {
                                layer.alert("删除成功");
                                initTable();
                            } else {
                                //layer.alert(data.errorMsg);
                                if(data.status === 500){
                                    layer.alert("服务器繁忙，请联系管理员，谢谢。");
                                }else {
                                    layer.alert(data.msg)
                                }
                            }

                        }, 'json'
                    );
                    layer.close(index);
                }
            )
        });

    });


</script>
</body>
</html>
