<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>用户管理</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/multiple-select.css" rel="stylesheet">
</head>

<body>
<div class="row mt wrapper  layui-container ">
    <div class=" layui-row row-style">
        <div class=" layui-row row-style">
            <div class="form-panel">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>编辑用户</legend>
                </fieldset>
                <form class="layui-form">
                    <div class="layui-form-item layui-row">
                        <div class="layui-col-md6">
                            <label class="layui-form-label label-style">姓氏</label>
                            <div class="layui-input-inline inline-noborder">
                                ${userDtl.userLastName}
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <label class="layui-form-label label-style">名字</label>
                            <div class="layui-input-inline inline-noborder">
                                ${userDtl.userFirstName}
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <div class="layui-col-md6">
                            <label class="layui-form-label label-style">登录名</label>
                            <div class="layui-input-inline inline-noborder">
                                ${user.userName}
                            </div>
                        </div>
                        <div class=" layui-col-md6">
                            <label class="layui-form-label label-style">手机号</label>
                            <div class="layui-input-inline inline-noborder">
                                ${user.mobNum}
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <div class="layui-col-md6">
                            <div class="layui-form-item layui-row">
                                <div class="layui-col-md12">
                                    <label class="layui-form-label label-style"><span
                                            style="color:red">※</span>会所</label>
                                    <div class="layui-input-inline inline-noborder">
                                        ${user.subsyNames}
                                    </div>
                                </div>
                            </div>
                            <div class=" layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">用户性别</label>
                                    <div class="layui-input-inline inline-noborder">
                                        ${userDtl.gderFlg ? '男' : '女'}
                                    </div>
                                </div>
                            </div>
                            <div class=" layui-form-item layui-row">
                                <div class=" layui-col-md12">
                                    <label class="layui-form-label label-style">用户生日</label>
                                    <div class="layui-input-inline inline-noborder">
                                        ${userDtl.birthday}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md6">
                            <label class="layui-form-label label-style">用户头像</label>
                            <c:if test="${user.avtrImgCode != null}">
                            <span style="float: left;display: inline-block">

                                <img id="avtrImg" class="upload_img"
                                <c:if test="${user.avtrImgCode != null}">
                                     src="${ctx}/reso/downLoadPicFile?tranResoFileMngId=${user.avtrImgCode}"
                                </c:if>
                                     width="120" height="140">
                            </span>
                            </c:if>
                            <c:if test="${user.avtrImgCode == null}">
                                <c:if test="${user.avtrUrl != null}">
                                    <img id="avtrImgDefult" class="upload_img"
                                         src="${ctx}${user.avtrUrl}"
                                         width="120" height="140">
                                </c:if>
                                <c:if test="${user.avtrUrl == null}">
                                    <div class="layui-input-inline inline-noborder">
                                        无
                                    </div>
                                </c:if>
                            </c:if>
                        </div>

                    </div>
                    <%--<div class="layui-form-item btn-position">--%>
                        <%--<div class=" layui-inline">--%>
                            <%--<button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </form>
            </div>

        </div>
    </div>
</div>


<!--main content end-->

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>


    //JavaScript代码区域
    layui.use(['layer', 'globalAjax', 'multipleSelect', 'form', 'verify', 'laydate', 'upload'], function () {
        var $ = layui.jquery, layer = layui.layer,
            form = layui.form, verify = layui.verify,
            upload = layui.upload,
            laydate = layui.laydate;
        <c:if test="${user.avtrImgCode  == null}">
        $("img").css('background', 'none');
        </c:if>
        <c:if test="${user.avtrImgCode  != null}">
        var image = document.getElementById("avtrImg");
        var downloadingImage = new Image();
        downloadingImage.onload = function () {
            image.src = this.src;
        };
        downloadingImage.src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=${user.avtrImgCode}";
        </c:if>

        var subsyCodes = '${user.subsyCodes}';
        var subsyArray = [];
        if (subsyCodes) {
            subsyArray = subsyCodes.split(",");
        }


        $(function () {
            $('#subsyMs').change(function () {
                $("#subsyCodes").val($(this).val())
            }).multipleSelect({
                placeholder: "多选",
                filter: true,
                selectAll: false,
                allSelected: false,
                countSelected: false,
                width: '100%',
                noMatchesFound: '没有符合条件'
            }, "setSelects", subsyArray);
            $(".ms-drop input[type='checkbox']").css("display", 'inline-block')
        });

        laydate.render({
            elem: "#birthday"
            , max: getToday()
        });
        form.verify(verify);

        //执行实例
        upload.render({
            elem: '#uploadAvtr' //绑定元素
            , url: '${ctx}/user/uploadAvtr' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
            }
            , done: function (res) {
                layer.closeAll('loading');
                $("#avtrImgCode").val(res.imageCode);
                $(".upload_box").css("display", "block");
                $(".upload_img").attr("src", "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode)
            }
        });

        form.on("submit(*)", function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}用户成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/user";
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
        })
        $("#back").on("click", function (event) {
            location.href = "${ctx}/user/";
            //setReturnValueFalse(event);
        })
    });

</script>
</body>
</html>