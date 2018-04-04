<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>活动管理</title>
    <shiro:hasPermission name="activ:update">
        <c:set value="1" var="allow_update"/>
    </shiro:hasPermission>
    <shiro:hasPermission name="activ:delete">
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>活动管理</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select id="subsyCode" name="subsyCode">
                                        <option value="">全部</option>
                                        <c:forEach items="${subsyList}" var="subsyList">
                                            <option value="${subsyList.subsyCode}" <c:if test="${subsyList.subsyCode == subsyCode}">selected</c:if> >${subsyList.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">活动名称</label>
                                <div class="layui-input-inline">
                                    <input id="activName" name="activName" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">活动状态</label>
                                <div class="layui-input-inline">
                                    <select id="activStatusCode" name="activStatusCode">
                                        <option value="">全部</option>
                                        <c:forEach items="${shb:getListByType('0035')}" var="gen">
                                            <option value="${gen.genCode}">${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                                <button type="button" class="btn btn-clear">清 空</button>
                                <shiro:hasPermission name="activ:create">
                                    <button id="add" type="button" class="layui-btn layui-btn-normal">新 增</button>
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
                                    <th style="width: 20%;">会所</th>
                                    <th style="width: 15%;">活动分类</th>
                                    <th style="width: 20%;">活动名称</th>
                                    <th style="width: 20%;">活动显示开始时间</th>
                                    <th style="width: 20%;">活动显示结束时间</th>
                                    <th style="width: 20%;">浏览数量</th>
                                    <th style="width: 20%;">预约数量</th>
                                    <th style="width: 20%;">活动状态</th>
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
        var $= layui.jquery, layer = layui.layer, datatable = layui.datatable;
        if('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }

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
            json.url = '${ctx}/activ/queryActivList';
            json.param = [
                {
                    "name": "subsyCode",
                    "value": $("#subsyCode").val()
                },
                {
                    "name": "activName",
                    "value": $("#activName").val()
                },
                {
                    "name": "activStatusCode",
                    "value": $("#activStatusCode").val()
                }

            ];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                }, {
                    "mData": "subsyName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                }, {
                    "mData": "activCateCode",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "activName",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "activDispStartTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "activDispEndTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "browseCount",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "resvCount",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "activStatusCode",
                    "sWidth": "150px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        if(data=='报名中'){
                            array.push("<span style='color:green'><b>" + data + "</b></span>");
                        }else{
                            array.push("<span style='color:gray'>" + data + "</span>");
                        }
                        return array.join("");
                    }
                }, {
                    "mData": "activCode",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        <c:if test="${allow_update==1}">
                        array.push("<button type='button' class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.activCode + "\">");
                        array.push("<i class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>");
                        </c:if>
                        <c:if test="${allow_update==1}">
                        array.push("<button type='button' class=\"layui-btn layui-btn-primary layui-btn-sm deleteItem\" vb=\"" + row.activCode + "\">");
                        array.push("<i class=\"layui-icon\">&#xe640;</i>");
                        array.push("</button>");
                        </c:if>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $("#add").click(function () {
            window.location.href = "${ctx}/activ/create"
        });

        $(document).on('click', ".toEdit", function () {
            var code = $(this).attr("vb");
            window.location.href = "${ctx}/activ/" + code + "/update"
        });
        $(document).on('click', ".deleteItem", function () {
            var code = $(this).attr("vb");
            layer.confirm('是否删除？', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        url: "${ctx}/activ/" + code + "/delete",
                        type: "POST",
                        dataType : "json",
                        timeout: 10000,
                        success: function (data) {
                            if(data.status === 200) {
                                layer.alert("删除成功");
                                initTable();
                            } else {
                                if(data.status === 500) {
                                    layer.alert("服务器繁忙，请联系管理员，谢谢。");
                                }else if(data.status === 555){
                                    layer.alert(data.errorMsg)
                                }else {
                                    layer.alert(data.msg)
                                }
                            }
                        }
                    });
                    layer.close(index);
                }
            )
        });
    });

</script>


</body>
</html>
