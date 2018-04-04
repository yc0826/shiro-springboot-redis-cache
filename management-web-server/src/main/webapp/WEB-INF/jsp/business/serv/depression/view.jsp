<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>${op}抑郁量问卷管理</title>

    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel layui-col-md12">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>抑郁量问卷信息</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md2">
                        <label>客户姓名：</label>
                        <label>${depressionDataInfoByCodeDate.userName}</label>
                    </div>
                    <div class="layui-col-md5">
                        <label>答题日期：</label>
                        <label>${depressionDataInfoByCodeDate.depressionTime}</label>
                    </div>
                    <div class="layui-col-md5">
                        <label>问卷分数：</label>
                        <label>${depressionDataInfoByCodeDate.ratingScore}&nbsp;分</label>
                    </div>
                </div>
                <c:if test="${not empty depressionDataInfo}">
                    <c:forEach items="${depressionDataInfo}" var="depression">
                        <div class="layui-form-item layui-row">
                            <div class="layui-col-md2">
                                <label>题目</label>
                                <label>${depression.depressionSeq}：</label>
                            </div>
                            <div class="layui-col-md5">
                                <label>${depression.depressionQName}</label>
                            </div>
                            <div class="layui-col-md5">
                                <label>答案：</label>
                                <label>${depression.depressionAName}&nbsp;&nbsp;${depression.depressionValue}分</label>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form>
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
            location.href = "${ctx}/depression/depressionList";
        });
    });
</script>

</body>
</html>
