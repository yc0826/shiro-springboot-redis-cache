<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shb" uri="http://www.babysky.com/platform/tags/shb-functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>产后修复订单详情</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <style>
        /*  */
        .babysky_course_div1{
            display:none !important;
        }
    </style>
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style layui-form ">
        <div class="col_main lightshadow form-panel layui-col-md12">

            <!-- 表格开始 -->
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>订单详情</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">订单名称：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.orderName}</span>
                        </div>
                    </div>
                </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md6">
                    <label class="layui-form-label label-style">产品次数：</label>
                    <div class="layui-input-inline inline-noborder">
                        <span>${recvyOrderInfo.sonsuCount}/${recvyOrderInfo.totalCount}&nbsp;次</span>
                    </div>
                </div>
                <div class=" layui-col-md6">
                    <label class="layui-form-label label-style">订单状态：</label>
                    <div class="layui-input-inline inline-noborder">
                        <span>${recvyOrderInfo.orderStatusName}</span>
                    </div>
                </div>
            </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">客户名称：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.exterUserName}</span>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">联系电话：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.mobNum}</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">产品原价：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.orderAmt}&nbsp;元</span>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">折扣金额：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.discAmt}&nbsp;元</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">折后金额：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.payAmt}&nbsp;元</span>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">消费悦币：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.payYuebPoints}&nbsp;枚</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">下单人员：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span><c:if test="${null != recvyOrderInfo.interUserLastName}">${recvyOrderInfo.interUserLastName}</c:if><c:if test="${null != recvyOrderInfo.interUserFirstName}">${recvyOrderInfo.interUserFirstName}</c:if></span>
                        </div>
                    </div>
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">下单时间：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.orderCrtTime}</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">备注：</label>
                        <div class="layui-input-inline inline-noborder">
                            <span>${recvyOrderInfo.orderDesc}</span>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>消费记录</legend>
                </fieldset>
                <div class="layui-form-item layui-row">
                    <c:if test="${recvyOrderInfo.orderConsumeStreamOutputBeanList != null && recvyOrderInfo.orderConsumeStreamOutputBeanList.size() > 0}">
                        <c:forEach items="${recvyOrderInfo.orderConsumeStreamOutputBeanList}" var="orderConsumeStreamOutputBeanList">
                            <div class="layui-form-item layui-row">
                                <div class="layui-col-md6">
                                    <label class="layui-form-label label-style">服务项目：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span>${orderConsumeStreamOutputBeanList.prodName}</span>
                                    </div>
                                </div>
                                <div class=" layui-col-md6">
                                    <label class="layui-form-label label-style">服务人员：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span><c:if test="${null != orderConsumeStreamOutputBeanList.crtLastName}">${orderConsumeStreamOutputBeanList.crtLastName}</c:if><c:if test="${null != orderConsumeStreamOutputBeanList.crtFirstName}">${orderConsumeStreamOutputBeanList.crtFirstName}</c:if></span>
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                    <label class="layui-form-label label-style">服务时间：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span>${orderConsumeStreamOutputBeanList.crtConsumeTime}</span>
                                    </div>
                                </div>
                                <div class=" layui-col-md6">
                                    <label class="layui-form-label label-style">服务备注：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span>${orderConsumeStreamOutputBeanList.remark}</span>
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                    <label class="layui-form-label label-style">服务得分：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span>${orderConsumeStreamOutputBeanList.satisScore}
                                            <c:if test="${orderConsumeStreamOutputBeanList.satisScore != null && orderConsumeStreamOutputBeanList.satisScore != ''}">
                                            &nbsp;分
                                            </c:if>
                                        </span>
                                    </div>
                                    <c:if test="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList != null && orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList.size() > 0 }">
                                        <div>
                                                <span style="cursor: pointer" class="btnshow" vb="${orderConsumeStreamOutputBeanList.satisUserBaseCode}" title="详情">
                                                     <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe63c;</i>
                                                 </span>
                                        </div>
                                    </c:if>
                                </div>
                                <div class=" layui-col-md6">
                                    <label class="layui-form-label label-style">评价备注：</label>
                                    <div class="layui-input-inline inline-noborder">
                                        <span>${orderConsumeStreamOutputBeanList.satisDesc}</span>
                                    </div>
                                </div>
                                <c:if test="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList != null && orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList.size() > 0 }">
                                    <div id="${orderConsumeStreamOutputBeanList.satisUserBaseCode}" style="display: none">
                                        <c:forEach items="${orderConsumeStreamOutputBeanList.satisUserDtlOutputBeanList}" var="satisUserDtlOutputBeanList">
                                            <div class="layui-col-md6">
                                                <label class="layui-form-label label-style">题目：</label>
                                                <div class="layui-input-inline inline-noborder">
                                                    <span>${satisUserDtlOutputBeanList.satisQstSeq}.${satisUserDtlOutputBeanList.satisQstName}</span>
                                                </div>
                                            </div>
                                            <div class="layui-col-md6">
                                                <label class="layui-form-label label-style">得分：</label>
                                                <div class="layui-input-inline inline-noborder">
                                                    <span>${satisUserDtlOutputBeanList.satisScore}&nbsp;分</span>
                                                </div>
                                            </div>
                                            <div class="layui-col-md12">
                                                <label class="layui-form-label label-style">意见：</label>
                                                <div class="layui-input-inline inline-noborder">
                                                    <span>${satisUserDtlOutputBeanList.otherDesc}</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
                        <button id="back" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            <!-- 表格结束-->
            </div>
        </div>
    </div>

<!--main content end-->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    //JavaScript代码区域
    layui.use(['form', 'element', 'layer','globalAjax', 'multipleSelect', 'verify', 'upload', 'laydate'], function () {
        var $ = layui.jquery, layer = layui.layer,
            form = layui.form, verify = layui.verify,
            upload = layui.upload,
            laydate = layui.laydate;

        form.verify(verify);

        $(function () {
            var errorMsg = $("#errorMsg").val();
            if(undefined != errorMsg && "" != errorMsg){
                layer.alert(errorMsg);
            }
        });

        $("#back").on("click", function(event){
            location.href = "${ctx}/recvy/${backParams}/list";
            setReturnValueFalse(event);
        });

        $(".btnshow").click(function () {
            var code = $(this).attr("vb");
            $("#" + code).toggle();
        });
    });

</script>
</body>
</html>
