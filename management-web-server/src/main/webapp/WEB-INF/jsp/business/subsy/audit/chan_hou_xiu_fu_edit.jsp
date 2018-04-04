<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>会所申请</title>

    <!-- Bootstrap core CSS -->
    <!--external css-->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">

    <style>
        .img-box {
            position: relative;
            display: inline-block;
            margin-right: 10px;
        }

        .del-icon {
            background-color: grey;
            position: absolute;
            right: -8px;
            top: -8px;
            color: #fff;
            border: 1px solid;
            border-radius: 15px;
            width: 27px;
            height: 27px;
            font-size: 18px;
            text-align: center;
            cursor: pointer;
        }

        /*.indexTab {*/
        /*pointer-events: none;*/
        /*cursor: default;*/
        /*opacity: 0.6;*/
        /*cursor: not-allowed;*/
        /*}*/
    </style>



</head>

<body>
    <div class="col_main lightshadow form-panel layui-col-md12">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        	<legend>产后修复产品</legend>
        </fieldset>
        <form class="layui-form" action="" id="chanhouxiufuForm" lay-filter="chanhouxiufuForm">
            <input type="hidden" name="orderProdCode" class="orderProdCode" value="${mstOrderProdEntity.orderProdCode}">
            <input type="hidden" name="subsyCode" class="subsyCode" value="${mstOrderProdEntity.subsyCode}">
            <input type="hidden" name="prodTypeCode" value="00110007"/>
            <div class='layerbox' id='lottery' style=" width: 450px;">
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">服务名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="prodName" placeholder="请输入服务名称" lay-verify="notnull" autocomplete="off" value="${mstOrderProdEntity.prodName}" class="layui-input" <c:if test="${pageMode!=null && pageMode=='readonly'}">readonly</c:if> >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="prodAmt" autocomplete="off"
                                   class="layui-input" placeholder="请输入价格" lay-verify="notnull"
                                   maxlength="32" value="${mstOrderProdEntity.prodAmt}" <c:if test="${pageMode!=null && pageMode=='readonly'}">readonly</c:if> >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md12">
                        <label class="layui-form-label label-style">折扣后价格最小折扣率</label>
                        <div class="layui-input-inline">
                            <input type="text" name="minDiscountRate" autocomplete="off"
                                   class="layui-input" placeholder="请输入折扣后价格最小折扣率" lay-verify="notnull"
                                   maxlength="32" value="${mstOrderProdEntity.minDiscountRate}" <c:if test="${pageMode!=null && pageMode=='readonly'}">readonly</c:if> ><span style="margin-left: 10px;color:blue;">例如：7.5 表示最多打7.5折，0表示允许任意折扣，10表示不允许打折</span>
                        </div>
                    </div>
                </div>
                <%--<div class="layui-form-item layui-row">--%>
                    <%--<div class=" layui-col-md12">--%>
                        <%--<label class="layui-form-label label-style">可选数量</label>--%>
                        <%--<div class="layui-input-inline">--%>
                            <%--<input type="checkbox" name="switch" lay-skin="switch" lay-filter="switchTest"--%>
                                   <%--lay-text="开|关">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">banner图(1张)</label>
                        <c:if test="${pageMode!=null && pageMode=='readonly'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <c:if test="${mstOrderProdEntity.bannerCode != null}">
                                        <div class="img-box" vb="${mstOrderProdEntity.bannerCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${mstOrderProdEntity.bannerCode}" width="375" height="200"></div>
                                    </c:if>
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${pageMode!=null && pageMode=='edit'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <input type="hidden" id="bannerCode" name="bannerCode" value="${mstOrderProdEntity.bannerCode}">
                                    <c:if test="${mstOrderProdEntity.bannerCode != null}">
                                        <div class="img-box" vb="${mstOrderProdEntity.bannerCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${mstOrderProdEntity.bannerCode}" width="375" height="200"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                                    </c:if>
                                </span>
                                <input type="hidden" value="00480006">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                                <span style="margin-left: 10px;color:blue;">查看示例</span>
                            </div>
                        </c:if>

                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">缩略图(1张)</label>
                        <c:if test="${pageMode!=null && pageMode=='readonly'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <c:if test="${mstOrderProdEntity.thumbnailCode != null}">
                                        <div class="img-box" vb="${mstOrderProdEntity.thumbnailCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${mstOrderProdEntity.thumbnailCode}" width="85" height="85"></div>
                                    </c:if>
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${pageMode!=null && pageMode=='edit'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <input type="hidden" id="thumbnailCode" name="thumbnailCode" value="${mstOrderProdEntity.thumbnailCode}">
                                    <c:if test="${mstOrderProdEntity.thumbnailCode != null}">
                                        <div class="img-box" vb="${mstOrderProdEntity.thumbnailCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${mstOrderProdEntity.thumbnailCode}" width="85" height="85"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                                    </c:if>
                                </span>
                                <input type="hidden" value="00480004">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                                <span style="margin-left: 10px;color:blue;">查看示例</span>
                            </div>
                        </c:if>

                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">详情图(多张)</label>
                        <c:if test="${pageMode!=null && pageMode=='readonly'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <c:if test="${mstOrderProdEntity.detailCodes != null}">
                                        <c:forEach items="${detailCodeList}" var="detailCode">
                                            <div class="img-box" vb="${detailCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${detailCode}" width="375" height="200"></div>
                                        </c:forEach>
                                    </c:if>
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${pageMode!=null && pageMode=='edit'}">
                            <div class="layui-input-inline">
                                <span style="float: left;">
                                    <input type="hidden" id="detailCodes" name="detailCodes" value="${mstOrderProdEntity.detailCodes}">
                                    <c:if test="${mstOrderProdEntity.detailCodes != null}">
                                        <c:forEach items="${detailCodeList}" var="detailCode">
                                            <div class="img-box" vb="${detailCode}"><img src="/babyskymng/reso/downLoadPicFile?tranResoFileMngId=${detailCode}" width="375" height="200"><div class="del-icon"> <i class="layui-icon">ဆ</i></div></div>
                                        </c:forEach>
                                    </c:if>
                                </span>
                                <input type="hidden" value="00480007">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary uploadMultiImg">
                                    <i class="layui-icon">&#xe67c;</i>上传
                                </button>
                                <span style="margin-left: 10px;color:blue;">查看示例</span>
                            </div>
                        </c:if>

                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md12">
                        <label class="layui-form-label label-style">服务描述</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" name="prodDesc" class="layui-textarea" <c:if test="${pageMode!=null && pageMode=='readonly'}">readonly</c:if> >${mstOrderProdEntity.prodDesc}</textarea>
                        </div>
                    </div>
                </div>
                <c:if test="${pageMode!=null && pageMode=='edit'}">
                    <div class="layui-form-item layui-row">
                        <div class=" layui-col-md10" style="margin-top:10px;text-align: right">
                            <button type="button" class="layui-btn" lay-submit lay-filter="addProduct">
                                <i class="layui-icon"></i>提 交
                            </button>
                        </div>
                    </div>
                </c:if>
            </div>
        </form>
    </div>


    <%@include file="prod_js.jsp" %>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify', 'jqueryStep', 'element'], function () {
        var $ = layui.jquery, form = layui.form, element = layui.element,
            layer = layui.layer, upload = layui.upload, verify = layui.verify,
            jqueryStep = layui.jqueryStep;
        form.verify(verify);

        //添加产品
        form.on('submit(addProduct)', function (data_Form) {
            var prodTypeCode = data_Form.field.prodTypeCode;
            $.ajax({
                url: "${ctx}/subsyAudit/saveProd",
                type: 'post',
                data: data_Form.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        //var prodCodeType = $("input[name='prodTypeCode']").val();
                        //parent.rebuildProdListHtml(data, prodTypeCode);

                        parent.layer.closeAll(); //疯狂模式，关闭所有层
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500) {
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else if(data.status === 555){
                            layer.alert(data.errorMsg);
                        }else {
                            layer.alert(data.msg);
                        }
                    }


                }
            });
            return false;
        });


    });



</script>
<!-- js placed at the end of the document so the pages load faster -->

</body>
</html>
