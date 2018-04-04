<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>会所用户管理</title>
    <shiro:hasPermission name="roomFloor:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="roomFloor:delete">
        <c:set value="1" var="allow_delete"/>
    </shiro:hasPermission>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">

    <!-- Custom styles for this template -->

    <style>
        #printArea {
            font-size: 12px;
            margin-top: 30px;
        }

        .firstbox {
            margin-left: 76px;
            float: left;
        }

        .secondbox {
            float: left;
            margin-top: 4px;
            margin-left: 44px;
        }

        .firstbox2 {
            margin-left: 16px;
            float: left;
        }

        .secondbox2 {
            float: left;
            margin-top: 4px;
            margin-left: 14px;
        }
    </style>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <jsp:include page="../../../header.jsp"/>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <jsp:include page="../../../aside.jsp"/>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <div class="layui-body">


        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>会所用户管理</h5>
            </div>


            <div class="form-horizontal style-form">
                <div class="form-group">

                    <div class="col-xs-10">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">姓名</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="exterUserName" name="exterUserName" type="text"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">手机号</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="mobNum" name="mobNum" type="text"/>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-2">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search"> 查 询</button>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 40%;">会所</th>
                                    <th style="width: 15%;">姓名</th>
                                    <th style="width: 20%;">手机号</th>
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
    <jsp:include page="../../../footer.jsp"/>
</div>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>


    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'form'], function () {
        var $ = layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable, form = layui.form;
        if ('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }

        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable();
        });

        //初始化表格
        function initTable() {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/exterUserInfo/getExterUserInfoInList';
            json.param = [
                {
                    "name": "exterUserName",
                    "value": $("#exterUserName").val()
                },
                {
                    "name": "mobNum",
                    "value": $("#mobNum").val()
                }


            ];
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
                    "mData": "exterUserName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "mobNum",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "exterUserCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");

                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + row.exterUserCode + "\">");
                        array.push("<i class=\"layui-icon\">&#xe63c;</i>");
                        array.push("</button>")

                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }



        $(document).on('click', ".toDetail", function () {
            var exterUserCode = $(this).attr("vb");
            window.location.href = "${ctx}/exterUserInfo/" + exterUserCode + "/exterUserInfo"
        });

    });


</script>


</body>
</html>
