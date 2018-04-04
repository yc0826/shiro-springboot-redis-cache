<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>会所管理</title>
    <shiro:hasPermission name="subsy:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="subsy:delete">
        <c:set value="1" var="allow_delete"/>
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>会所管理</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item layui-row">

                        <div class="layui-inline layui-col-md8">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所名称</label>
                                <div class="layui-input-inline">
                                    <input id="name" name="name" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">品牌</label>
                                <div class="layui-input-inline">
                                    <select id="brandCode" name="brandCode">
                                        <option value="">请选择</option>
                                        <c:forEach items="${shb:getNormalSubsyBrandList()}" var="gen">
                                            <option value="${gen.genCode}">${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">所在城市</label>
                                <div class="layui-input-inline">
                                    <input class="layui-input" placeholder="简拼/全拼/汉字" id="city" type="text"/>
                                    <input type="hidden" id="cityCode" name="cityCode"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">状态</label>
                                <div class="layui-input-inline">
                                    <select id="statCode" name="statCode">
                                        <option value="">请选择</option>
                                        <c:forEach items="${shb:getListByType('0066')}" var="gen">
                                            <option value="${gen.genCode}">${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="layui-inline layui-col-md3">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                            <button type="reset" class="layui-btn layui-btn-normal" >清 空</button>
                            <shiro:hasPermission name="subsy:create">
                                <button id="add" class="layui-btn layui-btn-normal" lay-submit lay-filter="add">新 增</button>
                            </shiro:hasPermission>
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
                                    <th style="width: 8%;">会所code</th>
                                    <th style="width: 10%;">会所名称</th>
                                    <th style="width: 10%;">品牌名</th>
                                    <th style="width: 10%;">所在省</th>
                                    <th style="width: 10%;">所在市</th>
                                    <th style="width: 20%;">地址</th>
                                    <th style="width: 5%;">状态</th>
                                    <th style="width: 5%;">最终更新时间</th>
                                    <th style="width: 10%;">操作</th>
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
        var $ = layui.jquery, datatable = layui.datatable, form = layui.form;

        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable(data.field.brandCode, data.field.statCode)
            return false;
        });


        form.on('submit(add)', function () {
            window.location.href = "${ctx}/subsy/create";
            return false;
        });
        //初始化表格
        function initTable(brandCode, statCode) {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/subsy/getSubsyListData';
            json.param = [{
                name: "name",
                value: $("#name").val()
            }, {
                name: "brandCode",
                value: brandCode
            }, {
                name: "cityCode",
                value: $("#cityCode").val()
            }, {
                name: "statCode",
                value: statCode
            }];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "subsyCode",
                    "sWidth": "180px",
                    "sClass": "text-center"
                }, {
                    "mData": "subsyDispName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                }, {
                    "mData": "brandName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "provName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "cityName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "subsyAddr",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "auditStatusName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "updTime",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        if (row.updTime) {
                            return longToDateTime(row.updTime);
                        } else {
                            return longToDateTime(row.crtTime);
                        }
                    }

                }, {
                    "mData": "subsyCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group tr-min-width\">");
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + row.subsyCode + "\">");
                        array.push("<i title=\"查看\" class=\"layui-icon\">&#xe63c;</i>");
                        array.push("</button>");
                        <c:if test="${allow_update==1}">
                        if (row.auditStatusCode !== '00660001') {
                            array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.subsyCode + "\">");
                            array.push("<i title=\"编辑\" class=\"layui-icon\">&#xe642;</i>");
                            array.push("</button>");
                        }
                        </c:if>
                        <shiro:hasPermission name="subsy:audit">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toAudit\" vb=\"" + row.subsyCode + "\">");
                        array.push("<i title=\"审核\" class=\"layui-icon\">&#xe616;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }


        $(document).on('click', ".toDetail", function () {
            var subsyCode = $(this).attr("vb");
            window.location.href = "${ctx}/subsy/" + subsyCode + "/detail"
        });

        $(document).on('click', ".toEdit", function () {
            var subsyCode = $(this).attr("vb");
            window.location.href = "${ctx}/subsy/" + subsyCode + "/update"
        });

        $(document).on('click', ".toAudit", function () {
            var subsyCode = $(this).attr("vb");
            window.location.href = "${ctx}/subsy/" + subsyCode + "/audit"
        });

        $("#city").autocomplete({
            autoFocus: true,
            source: function (request, response) {
                $.ajax({
                    url: getBasePath() + "/common/region/getCityList.json?showLoading=false",
                    type: 'POST',
                    data: {
                        term: request.term
                    },
                    success: function (data) {
                        response(data);
                    }
                });
            },
            minLength: 2,
            change: function (event, ui) {
                if (ui.item && ui.item.id) {
                    $("#cityCode").val(ui.item.id);
                    $("#city").val(ui.item.value);
                } else {
                    $("#city").val("");
                    $("#cityCode").val("");
                }
            }

        });

    });


</script>
</body>
</html>
