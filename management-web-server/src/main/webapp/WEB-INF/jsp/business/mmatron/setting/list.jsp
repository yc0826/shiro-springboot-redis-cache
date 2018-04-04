<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>设置参数</title>
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
        <iframe src="${ctx}/nurs/report/index.html/#/sisterArguments?v=${webVersion}" frameborder="0" style="width: 100%;height: 99%"></iframe>
        <%--<div class="form-panel" style="box-shadow: none;">--%>
            <%--<div class="panel-heading">--%>
                <%--<h5 class="mb"><i class="fa fa-list-ul"></i>设置参数</h5>--%>
            <%--</div>--%>


            <%--<div class="form-horizontal style-form nurs-box ">--%>
                <%--<form class="layui-form">--%>
                    <%--<div class="layui-form-item">--%>

                        <%--<div class="layui-inline">--%>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">会所</label>--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<select id="subsyCode" name="subsyCode">--%>
                                        <%--<option value="1">上海静安会所</option>--%>
                                        <%--<option value="2">上海花木会所</option>--%>
                                        <%--<option value="3">上海悦悦满会所</option>--%>
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
                        <%--<div class="form-horizontal style-form ">--%>
                            <%--<div class="content-panel">--%>
                                <%--<div class="col_main lightshadow form-panel layui-col-md12" style="box-shadow: none;">--%>
                                    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
                                        <%--<legend>默认参数</legend>--%>
                                    <%--</fieldset>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">22</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--2--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div>第一次:10:00</div>--%>
                                            <%--<div>第二次:15:00</div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">高于22为高血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">420</span>--%>
                                            <%--<span class="col-noborder-context"><</span>--%>
                                            <%--<span class="col-noborder-context">520</span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">22</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--2--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div>第一次:10:00</div>--%>
                                            <%--<div>第二次:15:00</div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">高于22为高血压</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">420</span>--%>
                                            <%--<span class="col-noborder-context"><</span>--%>
                                            <%--<span class="col-noborder-context">520</span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="col_main lightshadow form-panel layui-col-md12" style="box-shadow: none;">--%>
                                    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
                                        <%--<legend>新增参数</legend>--%>
                                    <%--</fieldset>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">22</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--2--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div>第一次:10:00</div>--%>
                                            <%--<div>第二次:15:00</div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">高于22为高血压</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">420</span>--%>
                                            <%--<span class="col-noborder-context"><</span>--%>
                                            <%--<span class="col-noborder-context">520</span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">22</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--2--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div>第一次:10:00</div>--%>
                                            <%--<div>第二次:15:00</div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">高于22为高血压</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">420</span>--%>
                                            <%--<span class="col-noborder-context"><</span>--%>
                                            <%--<span class="col-noborder-context">520</span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">血压</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">22</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--2--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div>第一次:10:00</div>--%>
                                            <%--<div>第二次:15:00</div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">高于22为高血压</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">420</span>--%>
                                            <%--<span class="col-noborder-context"><</span>--%>
                                            <%--<span class="col-noborder-context">520</span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                    <%--<div class="layui-form-item layui-row">--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">项目名称：</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32"  />--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">预警值：</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32"  />--%>
                                        <%--</span>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<div>--%>
                                                <%--<span class="col-noborder-title">每日采集次数：</span>--%>
                                                <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32" value="2" />--%>
                                             <%--</span>--%>
                                            <%--</div>--%>
                                            <%--<div style="margin-top: 5px"><span style="display: inline-block">第一次时间:</span><input type="text" class="layui-input nurs-input" style="width: 70px;height: 27px;display: inline-block;margin-left: 36px;" autocomplete="false" lay-verify="required"--%>
                                                                                                                                 <%--id="activName" name="activName"  placeholder="" maxlength="32"  /></div>--%>
                                            <%--<div style="margin-top: 5px"><span style="display: inline-block">第二次时间:</span><input type="text" class="layui-input nurs-input" style="width: 70px;height: 27px;display: inline-block;margin-left: 36px;" autocomplete="false" lay-verify="required"--%>
                                                                                                                                 <%--id="activName" name="activName"  placeholder="" maxlength="32"  /></div>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-col-md2">--%>
                                            <%--<span class="col-noborder-title">备注：</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32"  />--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="layui-col-md2" style="width: 330px;">--%>
                                            <%--<span class="col-noborder-title">系统临界区域：</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32"  />--%>
                                        <%--</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<--%>
                                        <%--</span>--%>
                                            <%--<span class="col-noborder-context">--%>
                                            <%--<input type="text" class="layui-input nurs-input" autocomplete="false" lay-verify="required"--%>
                                                   <%--id="activName" name="activName"  placeholder="" maxlength="32"  />--%>
                                        <%--</span>--%>
                                            <%--<span style="display: inline-block;margin-left: 12px"><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe608;</i></span>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>














                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item btn-position">--%>
                <%--<div class=" layui-inline">--%>
                    <%--<button class="layui-btn command-btn-submit" lay-submit lay-filter="activBaseEntity">保存</button>--%>
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

        // $(function () {
        //     initTable();
        // });

        $(".btn-search").click(function () {
            initTable();
        });


        //初始化表格

        $("#add").click(function () {
            window.location.href = "${ctx}/activ/create"
        });

    });

</script>


</body>
</html>
