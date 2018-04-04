<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>护理记录</title>
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


        .rolestye{
            margin-left: 10px;
            display: inline-block;
            width: 40px;
            border-radius: 6px;
            line-height: 15px;
            height: 19px;
            border: 1px solid #ef68ab;
            color: #ef68ab;
            background-color: #ef68ab14;
            text-align: center;
            float: right;
        }
        .bbstye{
            margin-left: 10px;
            display: inline-block;
            width: 40px;
            border-radius: 6px;
            line-height: 15px;
            height: 19px;
            border: 1px solid #57ce50;
            color: #57ce50;
            background-color: #57ce5017;
            line-height: 15px;
            text-align: center;
            float: right;
        }
        .rolelink{
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
        <iframe src="${ctx}/nurs/report/index.html/#/nurseRecords?v=${webVersion}" frameborder="0" style="width: 100%;height: 99%"></iframe>
            <%--<iframe src="http://192.168.1.188:8080/#/nurseRecords" frameborder="0" style="width: 100%;height: 99%"></iframe>--%>
        <%--<div class="form-panel">--%>
            <%--<div class="panel-heading">--%>
                <%--<h5 class="mb"><i class="fa fa-list-ul"></i>修改护理记录</h5>--%>
            <%--</div>--%>


            <%--<div class="form-horizontal style-form ">--%>
                <%--<form class="layui-form">--%>
                    <%--<div class="layui-form-item">--%>

                        <%--<div class="layui-inline">--%>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">会所</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<select id="subsyCode" name="subsyCode">--%>
                                        <%--<option value="4">上海静安会所</option>--%>
                                        <%--<option value="5">上海花木会所</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">客户名称</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input id="activName" name="activName" class="layui-input" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">房间号</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input id="roomName" name="activName" class="layui-input" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">活动状态</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<select id="activStatusCode" name="activStatusCode">--%>
                                        <%--<option value="">在住</option>--%>
                                        <%--<option value="">离所</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                <%--</form>--%>
                <%--<div class="form-group">--%>
                    <%--<div class="col-xs-12 mt">--%>

                        <%--<div class="content-panel">--%>
                            <%--<table id="table_data" class="dataTable table table-hover">--%>
                                <%--<thead>--%>
                                <%--<tr>--%>
                                    <%--<th style="width: 5%;">#</th>--%>
                                    <%--<th style="width: 20%;">房间号</th>--%>
                                    <%--<th style="width: 15%;">客户名称</th>--%>
                                    <%--<th style="width: 20%;">会所名称</th>--%>
                                    <%--<th style="width: 20%;">入住状态</th>--%>
                                <%--</tr>--%>
                                <%--</thead>--%>
                                <%--<tbody>--%>
                                <%--<tr>--%>
                                    <%--<td>1</td>--%>
                                    <%--<td>8201</td>--%>
                                    <%--<td >--%>
                                        <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                        <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                    <%--</td>--%>
                                    <%--<td>上海静安会所</td>--%>
                                    <%--<td>已离所</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td>1</td>--%>
                                    <%--<td>8201</td>--%>
                                    <%--<td >--%>
                                        <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                        <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                    <%--</td>--%>
                                    <%--<td>上海静安会所</td>--%>
                                    <%--<td>已离所</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td>1</td>--%>
                                    <%--<td>8201</td>--%>
                                    <%--<td >--%>
                                        <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                        <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                    <%--</td>--%>
                                    <%--<td>上海静安会所</td>--%>
                                    <%--<td>已离所</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td>1</td>--%>
                                    <%--<td>8201</td>--%>
                                    <%--<td >--%>
                                        <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                        <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                    <%--</td>--%>
                                    <%--<td>上海静安会所</td>--%>
                                    <%--<td>已离所</td>--%>
                                <%--</tr>--%>

                                <%--<td>1</td>--%>
                                <%--<td>8201</td>--%>
                                <%--<td >--%>
                                    <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                    <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                <%--</td>--%>
                                <%--<td>上海静安会所</td>--%>
                                <%--<td>已离所</td>--%>
                                <%--</tr>--%>

                                <%--<td>1</td>--%>
                                <%--<td>8201</td>--%>
                                <%--<td >--%>
                                    <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                    <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                <%--</td>--%>
                                <%--<td>上海静安会所</td>--%>
                                <%--<td>已离所</td>--%>
                                <%--</tr>--%>

                                <%--<td>1</td>--%>
                                <%--<td>8201</td>--%>
                                <%--<td >--%>
                                    <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                    <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                <%--</td>--%>
                                <%--<td>上海静安会所</td>--%>
                                <%--<td>已离所</td>--%>
                                <%--</tr>--%>

                                <%--<td>1</td>--%>
                                <%--<td>8201</td>--%>
                                <%--<td >--%>
                                    <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                    <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                <%--</td>--%>
                                <%--<td>上海静安会所</td>--%>
                                <%--<td>已离所</td>--%>
                                <%--</tr>--%>

                                <%--<td>1</td>--%>
                                <%--<td>8201</td>--%>
                                <%--<td >--%>
                                    <%--<div style="text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华</span><span class="rolestye">妈妈</span></div>--%>
                                    <%--<div style="margin-top: 7px;text-align: left;width: 170px;float: right;"><span class="rolelink">王庆华之女</span><span class="bbstye">宝宝</span></div>--%>
                                <%--</td>--%>
                                <%--<td>上海静安会所</td>--%>
                                <%--<td>已离所</td>--%>
                                <%--</tr>--%>
                                <%--</tbody>--%>
                            <%--</table>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>

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





        //初始化表格
        $(document).on('click', ".rolelink", function () {
            window.location.href = "${ctx}/nurs/linkdata"
        });


    });

</script>


</body>
</html>
