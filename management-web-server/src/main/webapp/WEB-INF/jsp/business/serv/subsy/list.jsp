<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>会所预约管理</title>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">

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
                <h5 class="mb"><i class="fa fa-list-ul"></i>会所预约管理</h5>
            </div>


            <div class="form-horizontal style-form layui-form">
                <div class="form-group">

                    <div class="col-xs-10">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">客户姓名</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="userName" name="userName" type="text" maxlength="50"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">参观状态</label>
                                    <div class="col-xs-9">
                                        <div class="layui-input-inline">
                                            <select id="bookingStatus" name="bookingStatus" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="1">已参观</option>
                                                <option value="0">未参观</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">联系电话</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="mobNum" name="mobNum" type="text" maxlength="20"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">报名日期</label>
                                    <div class="col-xs-9">
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" autocomplete="false" id="bookingStartTime" name="bookingStartTime" />
                                        </div>
                                        ~
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" autocomplete="false" id="bookingEndTime" name="bookingEndTime" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search"> 查 询</button>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 20%;">会所名称</th>
                                    <th style="width: 20%;">客户姓名</th>
                                    <th style="width: 20%;">联系电话</th>
                                    <th style="width: 20%;">报名日期</th>
                                    <th style="width: 15%;">参观状态</th>
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
<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<!--script for this page-->
<script>

    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'laydate', 'jqueryui', 'form'], function () {
        var $= layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable,laydate = layui.laydate, form = layui.form;

        //日期
        laydate.render({
            elem: '#bookingStartTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });
        laydate.render({
            elem: '#bookingEndTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });

        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable();
            return false;
        });

        //初始化表格
        function initTable() {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/subsyBooking/querySubsyBookingData';
            json.param = [
                {
                    "name": "userName",
                    "value": $("#userName").val()
                },
                {
                    "name": "mobNum",
                    "value": $("#mobNum").val()
                },
                {
                    "name": "bookingStartTime",
                    "value": $("#bookingStartTime").val()
                },
                {
                    "name": "bookingEndTime",
                    "value": $("#bookingEndTime").val()
                },
                {
                    "name": "bookingStatus",
                    "value": $("#bookingStatus").val()
                }

            ];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "subsyDispName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "userName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "mobNum",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "bookingTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "bookingStatus",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }
            ];
            datatable.tableManaged(json).init();
        }


    });

</script>


</body>
</html>
