<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>销售指标</title>
    <shiro:hasPermission name="saleTarget:update">
        <c:set value="1" var="allow_update"/>
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

        .rolestye {
            margin-left: 10px;
            display: inline-block;
            width: 40px;
            border-radius: 6px;
            height: 17px;
            border: 1px solid #777;
            color: #777;
            text-align: center;
        }

        .rolelink {
            cursor: pointer;
            color: #1E9FFF;
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>销售指标</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select id="subsyCode" name="subsyCode">
                                        <c:forEach items="${subsyList}" var="subsyList">
                                            <option value="${subsyList.subsyCode}"
                                                    <c:if test="${subsyList.subsyCode == subsyCode}">selected</c:if> >${subsyList.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">销售姓名</label>
                                <div class="layui-input-inline">
                                    <input id="interUserName" name="interUserName" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label label-style">选择时间：</label>
                                <div class="layui-input-inline">
                                    <select id="year" name="year">

                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search">
                                    查 询
                                </button>
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
                                    <th style="width: 15%;">销售名称</th>
                                    <th style="width: 20%;">会所名称</th>
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

    </div>


    <!--main content end-->
    <jsp:include page="../../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域

    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'jqueryui', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer, datatable = layui.datatable, form = layui.form;
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //常规用法
            laydate.render({
                elem: '#test1'
            });
        });
        if ('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }


        $(function () {

            var myDate = new Date();
            var startYear = myDate.getFullYear() - 1;//起始年份
            var endYear = myDate.getFullYear() + 3;//结束年份
            var obj = document.getElementById('year');
            for (var i = startYear; i <= endYear; i++) {
                obj.options.add(new Option(i, i));
            }
            obj.options[obj.options.length - 4].selected = 1;
            form.render('select');

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
            json.url = '${ctx}/saleTarget/getSaleTargetList';
            json.param = [
                {
                    "name": "interUserName",
                    "value": $("#interUserName").val()
                },
                {
                    "name": "subsyCode",
                    "value": $("#subsyCode").val()
                },
                {
                    "name": "year",
                    "value": $("#year").val()
                }
            ];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "interUserName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "subsyName",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {

                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");

                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.tranSalesTargetCode + "|" + row.subsyCode + "|" + row.interUserCode + "|" + row.subsyName + "|" + row.interUserName + "|" + $("#year").val() + "\">");
                        array.push("<i class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>")


                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $(document).on('click', ".toEdit", function () {
            var salesTargetCode = $(this).attr("vb");
            window.location.href = "${ctx}/saleTarget/" + salesTargetCode + "/updateSalesTarget"
        });


    });

</script>


</body>
</html>
