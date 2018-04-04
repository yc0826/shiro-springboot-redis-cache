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
        .itembox{
            position: relative;
        }
        .itemchoose{
            position: absolute;
            right: 0;
            top: 10px;
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
                <h5 class="mb"><i class="fa fa-list-ul"></i>服务管理</h5>
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
                                            <option value="${subsyList.subsyCode}" <c:if test="${subsyList.subsyCode == subsyCode}">selected</c:if> >${subsyList.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal btnsearch">查 询</button>
                            </div>
                        </div>

                    </div>
                </form>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <div class="col_main lightshadow form-panel layui-col-md12">
                                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                    <legend>服务项目</legend>
                                </fieldset>
                                <div class="layui-collapse">
                                    <c:forEach items="${servItemList}" var="servItemList">
                                        <div class="layui-colla-item itembox">
                                        <h2 class="layui-colla-title">${servItemList.servCateName}服务</h2>
                                        <c:forEach items="${servItemList.servItemList}" var="getServItemList">
                                            <div class="layui-colla-content">
                                                <div class="layui-collapse">
                                                    <div class="layui-colla-item itembox">
                                                        <h3 class="layui-colla-title">${getServItemList.servItemName}</h3>
                                                        <c:choose>
                                                            <c:when test="${getServItemList.sonServItemList != null && getServItemList.sonServItemList.size() > 0}">
                                                                <c:forEach items="${getServItemList.sonServItemList}" var="getSonServItemList">
                                                                    <div class="layui-colla-content">
                                                                        <div class="layui-collapse">
                                                                            <div class="layui-colla-item itembox">
                                                                                <h3 class="layui-colla-title">${getSonServItemList.servItemName}</h3>
                                                                                <div class="layui-colla-content ">
                                                                                    <c:if test="${getSonServItemList.servItemPrice != null && getSonServItemList.servItemPrice != '0'}">
                                                                                        <span>单价：${getSonServItemList.servItemPrice}元</span>
                                                                                    </c:if>
                                                                                    <span style="margin-left: 10px">接收岗位：${getSonServItemList.servRollName}</span><c:if test="${'' != getSonServItemList.solveTimeLimit}"><span style="margin-left: 10px">响应时间：${getSonServItemList.solveTimeLimit}分钟</span></c:if>
                                                                                </div>
                                                                                <div class="itemchoose">
                                                                                    <shiro:hasPermission name="servi:update">
                                                                                        <span style="margin-right: 5px" class="btnedit" vb="${getSonServItemList.servItemCode}">
                                                                                            <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe642;</i>
                                                                                        </span>
                                                                                        <c:if test="${getSonServItemList.hasDefult != '1'}">
                                                                                        <span style="margin-right: 5px" class="btndel" vb="${getSonServItemList.servItemCode}">
                                                                                            <i class="layui-icon" style="font-size: 20px; color: #ca1b1b;">&#xe640;</i>
                                                                                        </span>
                                                                                        </c:if>
                                                                                    </shiro:hasPermission>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="layui-colla-content ">
                                                                    <c:if test="${getServItemList.servItemPrice != null && getServItemList.servItemPrice != '0'}">
                                                                        <span>单价：${getServItemList.servItemPrice}元</span>
                                                                    </c:if>
                                                                    <span style="margin-left: 10px">接收岗位：${getServItemList.servRollName}</span><c:if test="${'' != getServItemList.solveTimeLimit}"><span style="margin-left: 10px">响应时间：${getServItemList.solveTimeLimit}分钟</span></c:if>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="itemchoose">
                                                            <shiro:hasPermission name="servi:create">
                                                                <span style="margin-right: 5px" class="btnadd" vb="${getServItemList.servItemCode}">
                                                                    <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe608;</i>
                                                                </span>
                                                            </shiro:hasPermission>
                                                            <shiro:hasPermission name="servi:update">
                                                                <span style="margin-right: 5px" class="btnedit" vb="${getServItemList.servItemCode}">
                                                                    <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe642;</i>
                                                                </span>
                                                                <c:choose>
                                                                    <c:when test="${getServItemList.sonServItemList != null && getServItemList.sonServItemList.size() > 0}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${getServItemList.hasDefult != '1'}">
                                                                        <span style="margin-right: 5px" class="btndel" vb="${getServItemList.servItemCode}">
                                                                            <i class="layui-icon" style="font-size: 20px; color: #ca1b1b;">&#xe640;</i>
                                                                        </span>
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </shiro:hasPermission>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="itemchoose">
                                                <shiro:hasPermission name="servi:create">
                                                    <span style="margin-right: 5px" class="btnadd" vb="${servItemList.servCateCode}">
                                                        <i class="layui-icon " style="font-size: 20px; color: #1E9FFF;">&#xe608;</i>
                                                    </span>
                                                </shiro:hasPermission>
                                            </div>
                                        </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div class="layui-form-item btn-position">
                <div class=" layui-inline">
                    <%--<button class="layui-btn command-btn-submit" lay-submit lay-filter="activBaseEntity">保存</button>--%>
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
        var $= layui.jquery, layer = layui.layer;

        $(".btnsearch").click(function () {
            var getSubsyCode = $("#subsyCode").val();
            window.location.href = "${ctx}/servi/" + getSubsyCode + "/list";
        });

        $(".btnadd").click(function () {
            var getSubsyCode = $("#subsyCode").val();
            var itemCode = $(this).attr("vb") + "%7C" + getSubsyCode;
            window.location.href = "${ctx}/servi/" + itemCode + "/add";
        });

        $(".btnedit").click(function () {
            var getSubsyCode = $("#subsyCode").val();
            var itemCode = $(this).attr("vb") + "%7C" + getSubsyCode;
            window.location.href = "${ctx}/servi/" + itemCode + "/edit";
        });

        $(document).on('click', ".btndel", function () {
            var getSubsyCode = $("#subsyCode").val();
            var itemCode = $(this).attr("vb") + "%7C" + getSubsyCode;
            layer.confirm("是否删除？", function (index) {
                $.post("${ctx}/servi/" + itemCode + "/delete", function (data) {
                    if (data.status === 200) {
                        layer.open({
                            content: '操作成功'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                window.location.href = "${ctx}/servi/" + getSubsyCode + "/list";
                            }
                        });
                    } else {
                        layer.alert(data.errorMsg);
                    }
                }, 'json');
                layer.close(index);
            })

        });
    });
</script>


</body>
</html>
