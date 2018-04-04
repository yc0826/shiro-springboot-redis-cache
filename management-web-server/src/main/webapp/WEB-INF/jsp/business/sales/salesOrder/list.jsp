<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../common/resource.jsp" %>
    <%@ include file="../../../common/tags.jsp" %>

    <title>护理师工资明细</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
    <style>
        .detail {
            color: #1E9FFF;
            cursor: pointer;
        }
    </style>
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>销售订单查询</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item layui-row">

                        <div class="layui-inline layui-col-md8">
                            <div class="layui-inline">
                                <label class="layui-form-label">开始时间</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="startDate" id="startDate" readonly autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">结束时间</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="endDate" id="endDate" readonly autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">客户姓名</label>
                                <div class="layui-input-inline">
                                    <input id="exterUserName" name="exterUserName" class="layui-input" type="text"/>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select name="subsyCode" lay-search>
                                        <option value="">请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}" <c:if test="${subsy.subsyCode == subsyCode}">selected</c:if> >${subsy.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="layui-inline layui-col-md3">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                            <button type="reset" class="layui-btn layui-btn-normal">清 空</button>
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
                                    <th style="width: 10%;">会所</th>
                                    <th style="width: 5%;">订单编号</th>
                                    <th style="width: 5%;">下单日期</th>
                                    <th style="width: 8%;">客户姓名</th>
                                    <th style="width: 10%;">手机号</th>
                                    <th style="width: 10%;">订单金额</th>
                                    <th style="width: 10%;">订单状态</th>
                                    <th style="width: 10%;">入所时间</th>
                                    <th style="width: 10%;">离所时间</th>
                                    <th style="width: 10%;">签单销售</th>
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
    </div>
    <!--main content end-->
    <jsp:include page="../../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'laydate', 'jquery', 'form'], function () {
        var $ = layui.jquery, datatable = layui.datatable, form = layui.form, laydate = layui.laydate;
        $("#startDate").val(getCurrentMonthFirst());
        $("#endDate").val(getToday());
        //日期前后联动
        var startDate = laydate.render({
            elem: '#startDate',
            btns: ['confirm'],
            done: function (value, date) {
                endDate.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        var endDate = laydate.render({
            elem: '#endDate',
            btns: ['confirm'],
            done: function (value, date) {
                startDate.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            }
        });

        $(function () {
            initTable(getCurrentMonthFirst(), getToday(), "", "")
        });

        form.on('submit(search)', function (data) {
            initTable(data.field.startDate, data.field.endDate, data.field.subsyCode, data.field.exterUserName);
            return false;
        });


        //初始化表格
        function initTable(startDate, endDate, subsyCode, exterUserName) {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/sales/salesOrder/getSalesOrderList';
            json.param = [{
                name: "startDate",
                value: startDate
            }, {
                name: "endDate",
                value: endDate
            }, {
                name: "exterUserName",
                value: exterUserName
            }, {
                name: "subsyCode",
                value: subsyCode
            }];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                }, {
                    "mData": "subsyName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "orderNo",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }, {
                    "mData": "orderCrtTime",
                    "sWidth": "120px",
                    "sClass": "text-center"
                }, {
                    "mData": "exterUserName",
                    "sWidth": "100px",
                    "sClass": "text-center",
                }, {
                    "mData": "exterUserMobNum",
                    "sWidth": "100px",
                    "sClass": "text-center",
                }, {
                    "mData": "payAmt",
                    "sWidth": "100px",
                    "sClass": "text-right-important",
                    "mRender": function (data, type, row) {
                        return "<span class='detail' vb='" + row.orderCode + "' vbStartDate='" + startDate + "' vbEndDate='" + endDate + "' title ='原价：" + row.orderAmt + "'>" + row.payAmt + "</span>"
                    }
                }, {
                    "mData": "orderStatusName",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }, {
                    "mData": "cinDate",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }, {
                    "mData": "coutDate",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }, {
                    "mData": "orderBelongInterUserName",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }
            ];
            datatable.tableManaged(json).init();
        }


        $(document).on('click', ".detail", function () {
            if ($(this).html() === "0") {
                layer.alert("暂无明细信息");
                return;
            }
            var orderCode = $(this).attr("vb");
            var startDate = $(this).attr("vbStartDate");
            var endDate = $(this).attr("vbEndDate");
            $.post("${ctx}/sales/salesOrder/getSalesOrderListDtl", {
                orderCode: orderCode,
                startDate: startDate,
                endDate: endDate
            }, function (data) {
                var array = [];
                array.push('<table class="table" id="layer_Box" >');
                array.push('<thead>');
                array.push('<tr>');
                array.push('<th>#</th>');
                array.push('<th>产品名称</th>');
                array.push('<th>产品原价</th>');
                array.push('<th>产品折后价</th>');
                array.push('<th>数量/天数</th>');
                array.push('<th>开始日期~结束日期</th>');
                array.push('</tr>');
                array.push('</thead>');
                array.push("<tbody>");
                for (var i = 0; i < data.length; i++) {
                    array.push("<tr>");
                    array.push("<td>#" + (i + 1) + "</td>");
                    array.push("<td>" + data[i].prodName + "</td>");
                    array.push("<td>" + data[i].prodAmt + "</td>");
                    array.push("<td>" + data[i].salesAmt + "</td>");
                    array.push("<td>" + data[i].prodCount + "</td>");
                    array.push("<td>" + data[i].startEndDate + "</td>");
                    array.push("</tr>");
                }
                array.push("</tbody></table>");

                var title = "订单详情";
                // if(serivceType === "00800002") {
                //     title = data[0].mmatronName + '会所服务天数明细';
                // } else {
                //     title = data[0].mmatronName + '住家服务天数明细';
                // }
                layer.open({
                    title: title
                    , resize: false
                    , area: ['800px', '600px']
                    , move: false
                    , content: array.join("")

                })
            })

        });

    });


</script>
</body>
</html>
