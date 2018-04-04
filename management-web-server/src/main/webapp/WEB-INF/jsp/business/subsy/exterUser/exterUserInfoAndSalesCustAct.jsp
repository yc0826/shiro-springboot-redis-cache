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
                <legend>客户详细</legend>
            </fieldset>

            <form class="layui-form" action="">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">会所:</label>
                        <label class="layui-form-label label-style">${entity.subsyName}</label></div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">客户年龄:</label>
                        <label class="layui-form-label label-style">${entity.custAge}</label>

                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class=" layui-col-md6">
                        <label class="layui-form-label label-style">入住用户</label>
                        <div class="layui-input-inline"  style="padding: 9px 15px">
                            <span  >${entity.exterUserName}
                                <a href="javascript:showTrackInfo('${entity.exterUserCode}')" class="layui-btn layui-btn-sm layui-btn-radius">详情</a>
                            </span>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">地址</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.loctAddr}
                            </label>
                        </div>

                    </div>

                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">所在妇产医院名称</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.loctMatnyHsptlName}
                             </label>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">所在医院房间号码</label>
                        <div class="layui-input-inline layui-form" >
                            <label class="layui-form-label label-style" >${entity.loctHsptlRoomNum}</label>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">客户意向</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.custIntentName}</label>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">预产期</label>
                        <div class="layui-input-inline layui-form" >
                            <label class="layui-form-label label-style" >${entity.edd}</label>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户描述</label>
                    <div class="layui-input-block">
                            <textarea  class="layui-textarea" >${entity.userDesc}</textarea>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">客户来源</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label label-style" >${entity.custSource}</label>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label label-style">手机号码</label>
                        <div class="layui-input-inline layui-form" >
                            <label class="layui-form-label label-style" >${entity.mobNum}</label>
                        </div>
                    </div>
                </div>


                <div class="layui-form-item layui-row exterUser">
                    <label class="layui-form-label label-style">销售行动录音</label>
                    <div class="layui-input-inline" >
                        <table class="table table-bordered table-striped text-center">
                            <thead>
                            <tr>
                                <th class="list-title">销售行动类型</th>
                                <th class="list-title">行动描述</th>
                                <th class="list-title">附件</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${entity.exterUserSalesCustActDto}" var="salesCustAct" varStatus="vs">
                            <tr>
                                <td>${salesCustAct.actName}</td>
                                <td>${salesCustAct.actDesc}</td>
                                <td>
                                    <a href="javascript:void(0)" class="layui-btn layui-btn-sm layui-btn-radius toPlay" vb='/management${salesCustAct.url}'>查看</a>
                                    <span id="voice"></span>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--<div class="layui-row">--%>
                            <%--<c:forEach items="${entity.exterUserSalesCustActDto}" var="salesCustAct" varStatus="vs">--%>
                                <%--<div class=" layui-col-md6" style="margin-top: 7px;">--%>
                                    <%--<div >--%>
                                        <%--<span>${salesCustAct.actName}</span>--%>
                                        <%--<span>${salesCustAct.actDesc}</span>--%>
                                        <%--<a href="javascript:void(0)" class="layui-btn layui-btn-sm layui-btn-radius toPlay" vb='/management${salesCustAct.url}'>播放</a>--%>
                                        <%--<div id="voice">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>

                                <%--</div>--%>
                            <%--</c:forEach>--%>
                        <%--</div>--%>
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
            , layer = layui.layer,  upload = layui.upload;


        $(document).on('click', ".toPlay", function () {
            var file = $(this).attr("vb");
            $('#voice').html('<audio controls="controls" id="audio_player"  autoplay > <source src="'+file+'"> </audio>');
        });




    });

    function back() {
        location.href = "${ctx}/exterUserInfo/exterUserInfoInList";
        //setReturnValueFalse(event);
    }
</script>

</body>
</html>
