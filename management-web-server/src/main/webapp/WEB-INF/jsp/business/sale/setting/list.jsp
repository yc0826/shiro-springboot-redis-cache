<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>设置参数</title>

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

        .sale-title-box {
            margin: 15px 0;
        }

        .sale .colla-content-box {
            margin: 5px 10px;
        }

        .sale .colla-content-box .title1 {
            display: inline-block;
            width: 300px
        }

        .sale .colla-content-box .title2 {
            display: inline-block;
            margin-left: 80px;
        }
    </style>
</head>


<body class="layui-layout-body sale">
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>销售管理</h5>
            </div>

            <form class="layui-form" id="salesActTypeForm">
                <div class="form-horizontal style-form ">

                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select id="subsyCode" name="subsyCode" lay-verify="required" lay-verType="tips">
                                        <option value="">请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}"
                                                    <c:if test="${subsy.subsyCode==entity.subsyCode}">selected="selected"</c:if>>${subsy.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal search" lay-filter="search">
                                    查 询
                                </button>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-xs-12 mt">

                            <div class="content-panel">
                                <div class="col_main lightshadow form-panel layui-col-md12">
                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                        <legend>默认参数</legend>
                                    </fieldset>


                                    <div class="layui-collapse">


                                        <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">咨询客户</h2>
                                            <div class="layui-colla-content ">
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：首次电话沟通</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：电话邀约客户参观会所</span><span class="title2">备注：创建后14天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：向客户推送会所H5宣传</span><span class="title2">备注：创建后3天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：会所品牌软文分享</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>

                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户预产期</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户生产医院</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户微信号</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户姓名</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户手机号</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">参观客户</h2>
                                            <div class="layui-colla-content ">
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：客户试吃月子餐</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：客户入住意向评估</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：会所品牌软文分享</span><span class="title2">备注：创建后15天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：向客户推送最新会所促销方案</span><span class="title2">备注：创建后7天完成此行动</span>
                                                </div>

                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户来源具体渠道</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户微信号</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户名称</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户手机号</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户家庭住址</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户生产医院</span><span class="title2">备注：创建后10天完成此行动</span>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">签约客户</h2>
                                            <div class="layui-colla-content ">
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：客户入住前宣讲咨询</span><span class="title2">备注：创建后30天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：妈妈课程邀约</span><span class="title2">备注：创建后30天完成此行动</span>
                                                </div>


                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户预产期</span><span class="title2">备注：创建后3天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户生产医院</span><span class="title2">备注：创建后3天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户家庭住址</span><span class="title2">备注：创建后3天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户生日</span><span class="title2">备注：创建后3天完成此行动</span>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">入住客户</h2>
                                            <div class="layui-colla-content ">
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：客户入住须知宣讲签署</span><span class="title2">备注：创建后1天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：宝宝满月派对</span><span class="title2">备注：创建后0天完成此行动</span>
                                                </div>


                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户入住日期</span><span class="title2">备注：创建后2天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户宝宝生日</span><span class="title2">备注：创建后2天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户宝宝昵称</span><span class="title2">备注：创建后2天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：维护客户宝宝性别</span><span class="title2">备注：创建后2天完成此行动</span>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">离店客户</h2>
                                            <div class="layui-colla-content ">
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：客户返店活动邀约</span><span class="title2">备注：创建后365天完成此行动</span>
                                                </div>
                                                <div class="colla-content-box"><span
                                                        class="title1">销售行动：会所品牌软文分享</span><span class="title2">备注：创建后365天完成此行动</span>
                                                </div>


                                            </div>
                                        </div>


                                    </div>


                                </div>
                                <div class="col_main lightshadow form-panel layui-col-md12">
                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                        <legend>新增销售行为</legend>
                                    </fieldset>

                                    <p id="salesActTypeList_Div"></p>


                                    <div class="layui-form-item layui-row layui-form" style="text-align: center;">
                                        <div style="display: inline-block">
                                            <label class="layui-form-label label-style"><span
                                                    style="color:red">※</span>销售行动：</label>
                                            <div class="layui-input-inline inline-adress">
                                                <input type="text" class="layui-input" autocomplete="false"
                                                       lay-verify="required"
                                                       id="salesActName" name="salesActName" placeholder="输入参数名称"
                                                       maxlength="32"/>
                                            </div>
                                            <label class="layui-form-label label-style"><span style="color:red">※</span>备注：</label>
                                            <div style="display: inline-block;float: left; margin-left: 30px;">

                                                <select id="userLeave" name="userLeave" lay-verify="required"
                                                        lay-verType="tips">
                                                    <c:forEach items="${shb:getListByType('0001')}" var="gen"
                                                               varStatus="vs">
                                                        <option value="${gen.genCode}"> ${gen.genSubName}</option>
                                                    </c:forEach>
                                                </select>

                                                <div class="sale-title-box">

                                                    <span style="display: inline-block;">创建后</span>
                                                    <span style="width: 25px;display: inline-block;">
                                            <div class="layui-input-inline" style="width: 90px;">
                                                <input type="text" class="layui-input" autocomplete="false"
                                                       lay-verify="required"
                                                       id="salesActDay"
                                                       name="salesActDay"
                                                       placeholder=""
                                                       maxlength="2"/>
                                            </div>
                                        </span>
                                                    <span style="display: inline-block;margin-left: 70px;">天完成此行动</span>
                                                </div>


                                            </div>
                                            <div class="layui-input-inline inline-adress"
                                                 style="     width: 0px;   margin-left: 30px;">
                                                <label class="layui-form-label label-style" style="width: 200px">

                                                    <button class="layui-btn layui-btn-primary layui-btn-sm toAdd"
                                                            lay-submit lay-filter="toAdd">
                                                        <i class="layui-icon"
                                                           style="font-size: 30px; color: #1E9FFF;">&#xe608;</i>
                                                    </button>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">

                    </div>
                </div>
            </form>
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
        if ('${msg}') {
            layer.alert("${msg}", {icon: 1})
        }

        //初始化表格
        function initTable(data) {
            var salesActTypeListDiv = $("#salesActTypeList_Div");
            salesActTypeListDiv.empty();

            $.ajax({
                url: "${ctx}/sale/newSalesActTypelist",
                type: 'post',
                data: data,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        var outPutHtml = '';
                        for (i = 0; i < data.mstSalesActTypeEntity.length; i++) {
                            outPutHtml += "<div class=\"layui-form-item layui-row\" style=\"text-align: center;\">";
                            outPutHtml += "<div style=\"display: inline-block\">";
                            outPutHtml += "<label class=\"layui-form-label label-style\"><span style=\"color:red\">※</span>销售行动：</label>";
                            outPutHtml += "<div class=\"layui-input-inline inline-adress\">";
                            outPutHtml += "<label class=\"layui-form-label label-style\">" + data.mstSalesActTypeEntity[i].salesActName + "</label></div>";
                            outPutHtml += "<label class=\"layui-form-label label-style\"><span style=\"color:red\">※</span>备注：</label>";
                            outPutHtml += "<div style=\"display: inline-block;float: left;\">";

                            for (j = 0; j < data.mstSalesActTypeDtlEntityList.length; j++) {
                                if (data.mstSalesActTypeDtlEntityList[j].mstSalesActTypeCode == data.mstSalesActTypeEntity[i].mstSalesActTypeCode) {
                                    outPutHtml += "<div class=\"sale-title-box\"><span style=\"width: 70px;display: inline-block;\">";
                                    if (data.mstSalesActTypeDtlEntityList[j].userLeaveCode == '00010001') {
                                        outPutHtml += "咨询客户";
                                    }
                                    if (data.mstSalesActTypeDtlEntityList[j].userLeaveCode == '00010002') {
                                        outPutHtml += "参观客户";
                                    }
                                    if (data.mstSalesActTypeDtlEntityList[j].userLeaveCode == '00010003') {
                                        outPutHtml += "签约用户";
                                    }
                                    if (data.mstSalesActTypeDtlEntityList[j].userLeaveCode == '00010004') {
                                        outPutHtml += "入住用户";
                                    }
                                    if (data.mstSalesActTypeDtlEntityList[j].userLeaveCode == '00010005') {
                                        outPutHtml += "离所用户";
                                    }
                                    outPutHtml += "</span>创建后<span style=\"width: 25px;display: inline-block;\">" + data.mstSalesActTypeDtlEntityList[j].finishDay + "</span>天完成此行动";
                                    outPutHtml += "</div>";
                                }
                            }
                            outPutHtml += "</div><div class=\"layui-input-inline inline-adress\" style=\"width: 0px;\"><label class=\"layui-form-label label-style\">";
                            outPutHtml += "<button class=\"layui-btn layui-btn-primary layui-btn-sm toDelete\" lay-filter=\"\" vb=" + data.mstSalesActTypeEntity[i].mstSalesActTypeCode + ">";
                            outPutHtml += "<i class=\"layui-icon\" style=\"font-size: 30px; color: #ca1b1b;\">&#xe640;</i></button></label></div></div></div>";
                        }
                        salesActTypeListDiv.append(outPutHtml);

                    } else {
                        layer.alert(data.errorMsg)
                    }
                }
            });
        }

        $(document).on('click', ".search", function () {

            initTable({
                subsyCode: $("#subsyCode").val()
            });
        });


        //监听提交
        <%--form.on('submit(saveSalesTypeAct)', function (data) {--%>
            <%--$.ajax({--%>
                <%--url: "${ctx}/sale/createInitSalesActType",--%>
                <%--type: 'post',--%>
                <%--data: data.field,--%>
                <%--dataType: 'json',--%>
                <%--timeout: 10000,--%>
                <%--success: function (data) {--%>
                    <%--if (data.status === 200) {--%>
                        <%--layer.alert("保存成功", function () {--%>
                            <%--window.location.href = "${ctx}/sale/list";--%>
                        <%--})--%>
                    <%--} else {--%>
                        <%--layer.alert(data.errorMsg)--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>

        <%--});--%>

        //监听提交
        form.on('submit(toAdd)', function (data) {
            layer.confirm('是否保存？', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        url: "${ctx}/sale/create",
                        type: 'post',
                        data: data.field,
                        dataType: 'json',
                        timeout: 10000,
                        success: function (data) {
                            if (data.status === 200) {
                                layer.alert("创建成功");
                                initTable(data);
                                $(':input', '#salesActTypeForm')
                                    .not(':button, :submit, :reset, :hidden')
                                    .val('')
                                    .removeAttr('checked')
                                    .removeAttr('selected');

                                form.render();

                            } else {
                                layer.alert(data.errorMsg)
                            }
                        }
                    });
                }
            )
            return false
        });
        <%--$(document).on('click', ".toAdd", function (data) {--%>
        <%--layer.confirm('是否保存？', {icon: 3, title: '提示'}, function (index) {--%>
        <%--$.ajax({--%>
        <%--url: "${ctx}/sale/create",--%>
        <%--type: 'post',--%>
        <%--data: data.field,--%>
        <%--dataType: 'json',--%>
        <%--timeout: 10000,--%>
        <%--success: function (data) {--%>
        <%--if (data.status === 200) {--%>
        <%--layer.alert("创建销售行动成功");--%>
        <%--initTable(data);--%>
        <%--} else {--%>
        <%--layer.alert(data.errorMsg)--%>
        <%--}--%>
        <%--}--%>
        <%--});--%>
        <%--}--%>
        <%--)--%>
        <%--return false;--%>
        <%--});--%>

        $(document).on('click', ".toDelete", function () {
            var salesActTypeCode = $(this).attr("vb");
            layer.confirm('是否删除？', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        url: "${ctx}/sale/" + salesActTypeCode + "/salesActTypeDelete",
                        type: "POST",
                        dataType: "json",
                        success: function (data) {
                            if (data.status === 200) {
                                layer.alert("删除成功");
                                initTable(data);
                            } else {
                                layer.alert(data.errorMsg);
                            }

                        }
                    })
                    layer.close(index);
                }
            )
            return false;
        });


    });

</script>


</body>
</html>
