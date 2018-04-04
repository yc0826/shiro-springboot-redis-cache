<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>${op}押金管理</title>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel layui-col-md12">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>押金信息</legend>
            </fieldset>
            <div class="layui-form-item layui-row">
            <form class="layui-form" action="">
                <div class="form-group">
                    <div class="col-xs-12 mt">
                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 15%;">客户姓名</th>
                                    <th style="width: 15%;">联系电话</th>
                                    <th style="width: 10%;">操作前余额</th>
                                    <th style="width: 10%;">操作金额</th>
                                    <th style="width: 10%;">操作后余额</th>
                                    <th style="width: 20%;">操作日期</th>
                                    <th style="width: 10%;">操作类型</th>
                                    <th style="width: 10%;">操作人员</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty dpstDataInfo}">
                                    <c:forEach items="${dpstDataInfo}" var="dpst">
                                        <tr>
                                            <td>${dpst.exterUserName}</td>
                                            <td>${dpst.mobNum}</td>
                                            <td>${dpst.beforeDpstAmt}</td>
                                            <td>${dpst.dpstAmt}</td>
                                            <td>${dpst.afterDpstAmt}</td>
                                            <td>${dpst.dpstDate}</td>
                                            <td>${dpst.operTranName}</td>
                                            <td>${dpst.crtUserName}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </form>
            </div>
            <div class="layui-form-item btn-position">
                <div class=" layui-inline">
                    <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'jqueryui', 'form'], function () {
        var $= layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable,laydate = layui.laydate, form = layui.form;

        $("#back").on("click", function(event){
            location.href = "${ctx}/dpst/dpstList";
        });
    });
</script>

</body>
</html>
