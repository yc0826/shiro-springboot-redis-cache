<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>打印手环</title>
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>打印手环</h5>
            </div>


            <div class="form-horizontal style-form">
                <div class="form-group">

                    <div class="col-xs-10">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">房间号</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="roomNo" type="text"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">用户名</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="motherName" type="text"/>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">订单编号</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="orderNo" type="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">入住日期</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" type="text"/>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <button type="button" class="layui-btn layui-btn-normal btn-search"> 查 询</button>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 20%;">订单编号</th>
                                    <th style="width: 15%;">房间号</th>
                                    <th style="width: 20%;">用户名</th>
                                    <th style="width: 20%;">入住日期</th>
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

<script src="${ctx}/static/js/common/jquery-1.11.1.min.js?v=${webVersion}"></script>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/bootstrap.min.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<!--script for this page-->

<script src="${ctx}/static/js/print/jquery.jqprint-0.3.js?v=${webVersion}"></script>

<script>

    function print(orderCode, flag, userCode) {
        $.ajax({
            url: "${ctx}/subsy/queryPrintInfoByOrderCode",
            data: {
                'orderCode': orderCode,
                'userCode': userCode
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                var html = "";
                if (flag === "mum") {
                    html = getMotherHtml(data, orderCode);
                } else {
                    html = getBabyHtml(data, orderCode, userCode);
                }
                $("<div>").attr("id", "printArea").html(html).appendTo("body");
                $("#printArea").jqprint();
                $("#printArea").remove();
            }
        });


    }

    function getMotherHtml(data, orderCode) {
        var array = [];
        array.push("<div class=\"firstbox\" style=\"float: left;margin-left:52px;margin-top:20px;\">");
        array.push("<div style=\"line-height: 22px;\"><span>姓名：" + data.motherName + "</span><span style=\"margin-left:12px;\">" + data.qrCode + "</span></div>");
        array.push("<div style=\"line-height: 22px;\"><span>日期：" + data.cinDate + "</span><span style=\"margin-left:12px;\">房间：" + data.roomNo + "</span></div>");
        array.push("<div style=\"line-height: 22px;\">" + data.subsyName + "</div>");
        array.push("</div>");
        array.push("<div class=\"secondbox\" style=\"float: left;;margin-left: 36px;margin-top: 15px;\"><img src=\"${ctx}/subsy/generateBandQrCode?orderCode=" + orderCode + "\"></div>");
        return array.join("");
    }

    function getBabyHtml(data, orderCode, userCode) {
        var array = [];
        array.push("<div class=\"firstbox2\" style=\"float:left;margin-left:32px;margin-top:20px;\">");
        array.push("<div><span>姓名：" + data.motherName + "</span><span style=\"margin-left:12px;\">" + data.qrCode + "</span></div>");
        array.push("<div><span>日期：" + data.cinDate + "</span><span style=\"margin-left:12px;\">房间：" + data.roomNo + "</span></div>");
        array.push("<div>" + data.subsyName + "</div>");
        array.push("</div>");
        array.push("<div class=\"secondbox2\" style=\"float:left; margin-left:5px; margin-top:5px;\"><img src=\"${ctx}/subsy/generateBandQrCode?orderCode=" + orderCode + "&userCode=" + userCode + "\" width=\"80\" height=\"80\"></div>");
        return array.join("");
    }
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery'], function () {
        var $= layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable;

        $(function () {
            initTable();
        });

        $(".btn-search").click(function () {
            initTable();
        });

        //初始化表格
        function initTable() {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/subsy/getSubsyPrintListData';
            json.param = [
                {
                    "name": "orderNo",
                    "value": $("#orderNo").val()
                },
                {
                    "name": "roomNo",
                    "value": $("#roomNo").val()
                },
                {
                    "name": "motherName",
                    "value": $("#motherName").val()
                }

            ];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "orderNo",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "roomNo",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "motherName",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinDate",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "orderCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push(" <div class=\"btn-group\">");
                        array.push("<button type=\"button\" class=\"btn btn-theme dropdown-toggle\" data-toggle=\"dropdown\">");
                        array.push("<i class=\"fa fa-print \"></i> <span class=\"margin10\">打印</span> <span class=\"caret\"></span>");
                        array.push("</button>");
                        array.push("<ul class=\"dropdown-menu\" role=\"menu\">");
                        var index = 0;
                        $.each(row.printUserDtoList, function (n, value) {
                            var flag = "";
                            if (index === 0) {
                                flag = "mum";
                            } else {

                                flag = "baby";
                            }
                            array.push("<li><a href=\"javascript:print('" + row.orderCode + "', '" + flag + "', '" + value.printUserCode + "')\">" + value.printUserName + "</a></li>")
                            index++;
                        });
                        array.push("</ul>");
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }


    });

</script>


</body>
</html>
