<%@ page import="com.shiro.management.common.utils.AcpService" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>产后修复订单</title>
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


<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>产后修复订单</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">

                    <div class="form-group">
                        <div class="col-xs-3">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label class="col-xs-3  control-label">会所</label>
                                        <div class="col-xs-9">
                                            <input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
                                            <select id="subsyCode" name="subsyCode">
                                                <c:forEach items="${subsyList}" var="subsyList">
                                                    <option value="${subsyList.subsyCode}" <c:if test="${subsyList.subsyCode == subsyCode}">selected</c:if> >${subsyList.subsyName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label class="col-xs-3  control-label">订单日期</label>
                                        <div class="col-xs-9">
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" autocomplete="false" id="orderStartTime" name="orderStartTime" value="${orderStartTime}" />
                                            </div>
                                            ~
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" autocomplete="false" id="orderEndTime" name="orderEndTime" value="${orderEndTime}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-1">
                            <button type="button" class="layui-btn layui-btn-normal btnsearch">查 询</button>
                        </div>

                    </div>

                </form>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <div class="col_main lightshadow form-panel layui-col-md12">
                                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                    <legend>产后修复订单</legend>
                                </fieldset>
                                <div class="layui-collapse">
                                    <c:forEach items="${recvyOrderList}" var="recvyOrderList">
                                        <div class="layui-colla-item itembox">
                                            <h2 class="layui-colla-title">
                                                <table width="100%">
                                                    <tr>
                                                        <td width="15%">
                                                            <span>${recvyOrderList.orderName}</span>
                                                        </td>
                                                        <td width="10%">
                                                            <span>客户：${recvyOrderList.exterUserName}</span>
                                                        </td>
                                                        <td width="10%">
                                                            <span>金额：${recvyOrderList.payAmt}</span>
                                                        </td>
                                                        <td width="15%">
                                                            <span>日期：${recvyOrderList.orderCrtTime}</span>
                                                        </td>
                                                        <td width="10%">
                                                            <span>状态：${recvyOrderList.orderStatusName}</span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </h2>
                                            <c:choose>
                                                <c:when test="${recvyOrderList.orderConsumeStreamOutputBeanList != null && recvyOrderList.orderConsumeStreamOutputBeanList.size() > 0}">
                                                    <c:forEach items="${recvyOrderList.orderConsumeStreamOutputBeanList}" var="orderConsumeStreamOutputBeanList">
                                                        <div class="layui-colla-content">
                                                            <div class="layui-collapse">
                                                                <div class="layui-colla-item itembox">
                                                                    <h3 class="layui-colla-title"><span>服务项目：${orderConsumeStreamOutputBeanList.prodName}</span></h3>
                                                                    <div class="layui-colla-content ">
                                                                        <span>服务人员：<c:if test="${null != orderConsumeStreamOutputBeanList.crtLastName}">${orderConsumeStreamOutputBeanList.crtLastName}</c:if><c:if test="${null != orderConsumeStreamOutputBeanList.crtFirstName}">${orderConsumeStreamOutputBeanList.crtFirstName}</c:if></span><br>
                                                                        <span>服务时间：${orderConsumeStreamOutputBeanList.crtConsumeTime}</span><br>
                                                                        <span>服务得分：${orderConsumeStreamOutputBeanList.satisScore}
                                                                            <c:if test="${orderConsumeStreamOutputBeanList.satisScore != null && orderConsumeStreamOutputBeanList.satisScore != ''}">
                                                                                &nbsp;分
                                                                            </c:if>
                                                                        </span>
                                                                        <c:if test="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList != null && orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList.size() > 0 }">
                                                                            <span style="margin-right: 5px;cursor: pointer" class="btnshow" vb="${orderConsumeStreamOutputBeanList.satisUserBaseCode}" title="详情">
                                                                                 <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe63c;</i>
                                                                             </span>
                                                                        </c:if>
                                                                        <br>
                                                                        <span>服务备注：${orderConsumeStreamOutputBeanList.remark}</span><br>
                                                                        <c:if test="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList != null && orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList.size() > 0 }">
                                                                            <div id="${orderConsumeStreamOutputBeanList.satisUserBaseCode}" style="display: none">
                                                                                <c:forEach items="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList}" var="satisUserDtlOutputBeanList">
                                                                                    <span>题目：${satisUserDtlOutputBeanList.satisQstSeq}.${satisUserDtlOutputBeanList.satisQstName}</span><br>
                                                                                    <span>得分：${satisUserDtlOutputBeanList.satisScore}&nbsp;分</span><br>
                                                                                    <span>意见：${satisUserDtlOutputBeanList.otherDesc}</span><br>
                                                                                </c:forEach>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="layui-colla-content ">
                                                        <span>没有更多的数据</span>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="itemchoose">
                                               <span style="margin-right: 5px;cursor: pointer" class="btndetail" vb="${recvyOrderList.orderCode}" title="详情">
                                                   <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe63c;</i>
                                               </span>
                                            </div>
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
    <jsp:include page="../../footer.jsp"/>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'laydate', 'jqueryui', 'form'], function () {
        var $= layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable,laydate = layui.laydate, form = layui.form;

        //日期
        laydate.render({
            elem: '#orderStartTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });
        laydate.render({
            elem: '#orderEndTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });

        $(function () {
            var errorMsg = $("#errorMsg").val();
            if(undefined != errorMsg && "" != errorMsg){
                layer.alert(errorMsg);
            }
        });

        $(".btnsearch").click(function () {
            var getSubsyCode = $("#subsyCode").val();
            var getOrderStartTime = $("#orderStartTime").val();
            var getOrderEndTime = $("#orderEndTime").val();
            var orderDate = getSubsyCode + "%7C" + getOrderStartTime +  "%7C" + getOrderEndTime;
            window.location.href = "${ctx}/recvy/" + orderDate + "/list";
        });

        $(".btndetail").click(function () {
            var getSubsyCode = $("#subsyCode").val();
            var getOrderStartTime = $("#orderStartTime").val();
            var getOrderEndTime = $("#orderEndTime").val();
            var params = getSubsyCode + "%7C" + getOrderStartTime +  "%7C" + getOrderEndTime + "%7C" + $(this).attr("vb");
            window.location.href = "${ctx}/recvy/" + params + "/detail";
        });

        $(".btnshow").click(function () {
            var code = $(this).attr("vb");
            $("#" + code).toggle();
        });
    });

</script>


</body>
</html>
