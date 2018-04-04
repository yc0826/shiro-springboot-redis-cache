<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>入住管理</title>

    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <link href="${ctx}/static/css/jquery-ui.css" rel="stylesheet">
    <!-- Custom styles for this template -->


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
                <h5 class="mb"><i class="fa fa-list-ul"></i>入住管理</h5>
            </div>


            <div class="form-horizontal style-form layui-form">

                <div class="layui-form-item">

                    <div class="layui-inline">

                        <div class="layui-inline">
                            <label class="layui-form-label">会所名称</label>
                            <div class="layui-input-inline">
                                <input class="layui-input" type="text" id="subsyName"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">入住用户</label>
                            <div class="layui-input-inline">
                                <input class="layui-input" type="text" id="exterUserName"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">订单号</label>
                            <div class="layui-input-inline">
                                <input class="layui-input" type="text" id="orderNo"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间号</label>
                            <div class="layui-input-inline">
                                <input class="layui-input" type="text" id="roomNo"/>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">入住开始时间</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" autocomplete="false"
                                       id="cinStartTime" name="cinStartTime"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">入住结束时间</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" autocomplete="false"
                                       id="cinEndTime" name="cinEndTime"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">护理师名</label>
                            <div class="layui-input-inline">
                                <input class="layui-input" type="text" id="ncareName"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">在住状态</label>
                            <div class="layui-input-inline">
                            <select id="checkStatus">
                                <option value="">请选择</option>
                                <option value="1">在住</option>
                                <option value="2">离所</option>
                            </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-2">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search"> 查 询</button>
                </div>


                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 20%;">会所名</th>
                                    <th style="width: 15%;">入住用户</th>
                                    <th style="width: 20%;">订单号</th>
                                    <th style="width: 20%;">入住房间</th>
                                    <th style="width: 20%;">入住开始日期</th>
                                    <th style="width: 20%;">入住结束日期</th>
                                    <th style="width: 20%;">入住天数</th>
                                    <th style="width: 20%;">护理师</th>
                                    <th style="width: 20%;">在住状态</th>
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
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'jqueryui', 'form', 'laydate'], function () {
        var $ = layui.jquery, layer = layui.layer, datatable = layui.datatable, form = layui.form, laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#cinStartTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });
        laydate.render({
            elem: '#cinEndTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });


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
            json.url = '${ctx}/roomCheckIn/getRoomCheckInList';
            json.param = [
                {
                    "name": "roomNo",
                    "value": $("#roomNo").val()
                },
                {
                    "name": "subsyName",
                    "value": $("#subsyName").val()
                },
                {
                    "name": "exterUserName",
                    "value": $("#exterUserName").val()
                },
                {
                    "name": "orderNo",
                    "value": $("#orderNo").val()
                },
                {
                    "name": "ncareName",
                    "value": $("#ncareName").val()
                },
                {
                    "name": "cinStartTime",
                    "value": $("#cinStartTime").val()
                },
                {
                    "name": "cinEndTime",
                    "value": $("#cinEndTime").val()
                },
                {
                    "name": "checkStatus",
                    "value": $("#checkStatus").val()
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
                    "mData": "orderNo",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "roomNo",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinStartTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinEndTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinDays",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "ncareName",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "checkStatus",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinInfoCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + row.cinInfoCode + "\">");
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
            var cinCode = $(this).attr("vb");
            window.location.href = "${ctx}/roomCheckIn/" + cinCode + "/checkInInfo"
        });


    });

</script>


</body>
</html>
