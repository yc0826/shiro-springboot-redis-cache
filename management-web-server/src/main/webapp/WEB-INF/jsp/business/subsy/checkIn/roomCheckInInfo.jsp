<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>${op}会所</title>

    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class="col_main lightshadow form-panel layui-col-md12">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>入住详细</legend>
            </fieldset>

            <form class="layui-form" action="">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">会所:</label>
                        <label class="layui-form-label label-style">${entity.subsyName}</label></div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">在住状态:</label>
                        <div class="layui-input-inline" style="padding: 9px 15px">
                         <span  >${entity.checkStatus}</span>
                        </div>

                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">入住用户</label>
                        <div class="layui-input-inline">
                            <div style="padding: 5px" >
                                <span>${entity.exterUserName}</span>
                                <a href="javascript:showTrackInfo('${entity.exterUserCode}')" class="layui-btn layui-btn-sm layui-btn-radius">详情</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">宝宝</label>
                        <div class="layui-input-inline" >
                            <div class="layui-row">
                            <c:forEach items="${entity.babyInfoBean}" var="babyInfo" varStatus="vs">
                                <div class=" layui-col-md6" style="margin-top: 7px;">
                                    <div >
                                        <span>${babyInfo.babyRealLastName}</span>
                                       <span>${babyInfo.babyRealFirstName}</span>
                                        <a href="javascript:showTrackInfo('${babyInfo.babyCode}')" class="layui-btn layui-btn-sm layui-btn-radius">详情</a>
                                    </div>

                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住订单</label>
                        <div class="layui-input-inline">
                            <div  style="padding: 5px"  >
                                <span>${entity.orderNo}</span>
                                <a href="javascript:showTrackInfo('${entity.orderCode}')" class="layui-btn layui-btn-sm layui-btn-radius">详情</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住房间</label>
                        <div class="layui-input-inline layui-form" style="padding: 9px 15px">
                            <span >${entity.roomNo}</span>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住开始日期</label>
                        <div class="layui-input-inline" style="padding: 9px 15px">
                            <span >${entity.cinStartTime}</span>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住结束日期</label>
                        <div class="layui-input-inline layui-form" style="padding: 9px 15px">
                            <span >${entity.cinEndTime}</span>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">入住备注</label>
                    <div class="layui-input-block">
                            <textarea  class="layui-textarea" >${entity.cinDesc}</textarea>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住登记人</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.cinCrtUserName}</label>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">入住登记时间</label>
                        <div class="layui-input-inline layui-form" style="padding: 9px 15px">
                            <span  >${entity.cinCrtTime}</span>
                        </div>
                    </div>
                </div>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>离所详细</legend>
                </fieldset>

                <div class="layui-form-item">
                    <label class="layui-form-label">离所备注</label>
                    <div class="layui-input-block">
                        <textarea  class="layui-textarea" >${entity.coutDesc}</textarea>

                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">离所登记人</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.cinUpUserName}</label>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">离所登记时间</label>
                        <div class="layui-input-inline layui-form" style="padding: 9px 15px">
                            <span  >${entity.cinUpTime}</span>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item btn-position">

                    <div class=" layui-inline">
                        <button class="layui-btn layui-btn-primary" onclick="back()">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload'], function () {
        var $ = layui.jquery, form = layui.form
            , layer = layui.layer, upload = layui.upload;




    });

    function back() {
        location.href = "${ctx}/roomCheckIn/roomCheckInList";
        //setReturnValueFalse(event);
    }
</script>

</body>
</html>
