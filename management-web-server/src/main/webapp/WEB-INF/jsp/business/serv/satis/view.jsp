<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>${op}用户会所满意度管理</title>
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
                <legend>用户会所满意度信息</legend>
            </fieldset>
            <c:if test="${not empty satisUserDataInfo}">
                <c:forEach items="${satisUserDataInfo}" var="satisUser">
                    <div class="layui-form-item layui-row">
                        <div class="layui-col-md2">
                            <label>题目</label>
                            <label>${satisUser.satisQstSeq}：</label>
                        </div>
                        <div class="layui-col-md5">
                            <label>${satisUser.satisQstName}</label>
                        </div>
                        <div class="layui-col-md5">
                            <label>分数：</label>
                            <label>${satisUser.satisScore}分</label>
                        </div>
                        <c:if test="${not empty satisUser.otherDesc}">
                            <div class="layui-col-md12">
                                <label>意见：</label>
                                <label>${satisUser.otherDesc}</label>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </c:if>
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
            location.href = "${ctx}/satis/satisList";
        });
    });
</script>

</body>
</html>
