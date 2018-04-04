<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>
    <title>房间管理</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <!--external css-->

    <!-- Custom styles for this template -->
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css"/>
    <style>
        ul.ztree {
            margin-top: 10px;
            border: 1px solid #617775;
            background: #f0f6e4;
            width: 220px;
            height: 200px;
            overflow-y: scroll;
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="row mt wrapper">
    <div class="layui-row row-style">
        <div class="col_main lightshadow form-panel">
            <h2 class="page_headline"><span class="c_blue store_title">编辑房间</span></h2>
            <div class="pb50">
                <!-- 表格开始 -->
                <form class="layui-form">

                    <div class="add_store">
                        <ol class="add_store_ol" style="list-style: none;">
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2 control-label label-span">会所</label>
                                <div class="col-sm-8">
                                    <select id="subsyCode" name="subsyCode" class="form-control"

                                        <option>请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}"
                                                    <c:if test="${subsy.subsyCode==entity.subsyCode}">selected="selected"</c:if>>${subsy.subsyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">房间号</label>
                                <div class="col-sm-8">
                                    <input id="roomNo" type="text" required name="roomNo"
                                           value="${entity.roomNo}"
                                           placeholder="输入房间号" class="add_store_inp form-control"
                                           autocomplete="false"/>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">房间类型</label>
                                <div class="col-sm-8">
                                    <select id="roomTypeCode" name="roomTypeCode" class="form-control">
                                        <option>请选择</option>
                                        <c:forEach items="${roomTypeList}" var="roomType">
                                            <option value="${roomType.roomTypeCode}"
                                                    <c:if test="${roomType.roomTypeCode==entity.roomTypeCode}">selected="selected"</c:if>>${roomType.roomTypeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">楼层名</label>
                                <div class="col-sm-8">
                                    <select id="floorCode" name="floorCode" class="form-control">
                                        <option>请选择</option>
                                        <c:forEach items="${floorList}" var="floor">
                                            <option value="${floor.floorCode}"
                                                    <c:if test="${floor.floorCode==entity.floorCode}">selected="selected"</c:if>>${floor.floorDispName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">房间描述</label>
                                <div class="col-sm-8">
                                    <input id="roomDesc" type="text" required name="roomDesc"
                                           value="${entity.roomDesc}"
                                           placeholder="输入房间描述" class="add_store_inp form-control"
                                           autocomplete="false"/>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span">房间图片</label>
                                <input type="hidden" id="bannerCode" name="bannerCode" value="${bannerCode}">
                                <div class="col-sm-8">
                                   <span style="float: left;display: inline-block">
                                        <div <c:if test="${bannerCode == null}">class="upload_box"</c:if>>
                                            <img id="bannerImg" class="upload_img"
                                                 src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${bannerCode}"/>
                                        </div>
                                    </span>
                                    <span class="upload_btn">
                                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary"
                                                id="uploadBanner">
                                            <i class="layui-icon">&#xe67c;</i>上传
                                        </button>
                                    </span>
                                </div>
                            </li>
                            <li class="add_store_li form-group-box">
                                <label class="add_store_span col-sm-2  control-label label-span"></label>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <div class="col-sm-8">
                                            <button class="layui-btn" lay-submit lay-filter="roomCode">${op}</button>
                                            <div style="clear: both;"></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </form>
                <!-- 表格结束-->
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    layui.use(['layer', 'globalAjax', 'ztree', 'form','upload'], function () {
        var $ = layui.jquery, layer = layui.layer,upload = layui.upload;
        var form = layui.form;

        <c:if test="${bannerCode  == null}">
        $("img").css('background', 'none');
        </c:if>
        <c:if test="${bannerCode  != null}">
        var image = document.getElementById("bannerImg");
        var downloadingImage = new Image();
        downloadingImage.onload = function () {
            image.src = this.src;
        };
        downloadingImage.src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=${bannerCode}";
        </c:if>

        //监听提交
        form.on('submit(roomCode)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}房间成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/room/roomList";
                        })
                    } else {
                        //layer.alert(data.errorMsg)
                        if(data.status === 500){
                            layer.alert("服务器繁忙，请联系管理员，谢谢。");
                        }else {
                            layer.alert(data.msg)
                        }
                    }
                }
            });
            return false;
        });

        //执行实例
        upload.render({
            elem: '#uploadBanner' //绑定元素
            , url: '${ctx}/room/uploadRoomBanner' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
            }
            , done: function (res) {
                layer.closeAll('loading');
                $("#bannerCode").val(res.imageCode);
                $(".upload_box").css("display", "block");
                $(".upload_img").attr("src", "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode)
            }
        });
    });
</script>
</body>
</html>