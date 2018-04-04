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
            <c:if test="${subsy.auditStatusCode == '00660003'}">
                <%@ include file="disagreeEdit.jsp" %>
            </c:if>
            <c:if test="${subsy.auditStatusCode == '00660002'}">
                <%@ include file="agreeEdit.jsp" %>
            </c:if>
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify'], function () {
        var $ = layui.jquery, form = layui.form
            , layer = layui.layer, upload = layui.upload, verify = layui.verify;


        <c:if test="${subsy.bannerCode  == null}">
        $("img").css('background','none');
        </c:if>
        <c:if test="${subsy.bannerCode  != null}">
        var image = document.getElementById("bannerImg");
        var downloadingImage = new Image();
        downloadingImage.onload = function(){
            image.src = this.src;
        };
        downloadingImage.src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=${subsy.bannerCode}";
        </c:if>

        $(function () {
            initProv("${subsy.loctProvCode}", "loctProvCode");
            initRegLoctProvCode("${subsyAdd.regLoctProvCode}", "regLoctProvCode")
        });


        function initRegLoctProvCode(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initRegLoctCity(provCode, '${subsyAdd.regLoctCityCode}', "regLoctCityCode");
                            flg = true;
                        }
                        provSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + " >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json');
        }

        function initRegLoctCity(provCode, cityCode, domId) {
            var regLoctCitySelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: provCode
                }, function (data) {
                    regLoctCitySelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === cityCode) {
                            flg = true;
                        }
                        regLoctCitySelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }

        form.on('select(reg_loct_prov_code)', function (data) {
            var regLoctCitySelect = $("#regLoctCityCode");
            //清空市
            regLoctCitySelect.empty();
            form.render('select', "regLoctCityCode");
            if (data && data.value) {
                //清空区
                $.post("${ctx}/common/region/getListByParentCode",
                    {
                        parentCode: data.value
                    }, function (data) {
                        regLoctCitySelect.append("<option value=''>请选择</option>");
                        $.each(data, function (index, item) {
                            regLoctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                        });
                        form.render('select', "regLoctCityCode");
                    },
                    'json')
            }
        });


        function initProv(provCode, domId) {
            var provSelect = $("#" + domId);
            $.post("${ctx}/common/region/getProvList",
                function (data) {
                    provSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === provCode) {
                            initCity(provCode, '${subsy.loctCityCode}', "loctCityCode");
                            flg = true;
                        }
                        provSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + " >" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json');
        }


        function initCity(provCode, cityCode, domId) {
            var citySelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: provCode
                }, function (data) {
                    citySelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === cityCode) {
                            initArea(cityCode, '${subsy.loctAreaCode}', "loctAreaCode");
                            flg = true;
                        }
                        citySelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }

        function initArea(cityCode, areaCode, domId) {
            var areaSelect = $("#" + domId);
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: cityCode
                }, function (data) {
                    areaSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        var flg = false;
                        if (item.regionId === areaCode) {
                            flg = true;
                        }
                        areaSelect.append("<option value=\"" + item.regionId + "\" " + (flg ? "selected" : "") + ">" + item.regionName + "</option>")
                    });
                    form.render('select', domId);
                },
                'json')
        }

        form.on('select(loct_prov_code)', function (data) {
            var loctCitySelect = $("#loctCityCode");
            var loctAreaSelect = $("#loctAreaCode");
            //清空市
            loctCitySelect.empty();
            form.render('select', "loctCityCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            if (data && data.value) {
                $.post("${ctx}/common/region/getListByParentCode",
                    {
                        parentCode: data.value
                    }, function (data) {
                        loctCitySelect.append("<option value=''>请选择</option>");
                        $.each(data, function (index, item) {
                            loctCitySelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                        });
                        form.render('select', "loctCityCode");
                    },
                    'json')
            }
        });

        form.on('select(loct_city_code)', function (data) {
            var loctAreaSelect = $("#loctAreaCode");
            //清空区
            loctAreaSelect.empty();
            form.render('select', "loctAreaCode");
            $.post("${ctx}/common/region/getListByParentCode",
                {
                    parentCode: data.value
                }, function (data) {
                    loctAreaSelect.append("<option value=''>请选择</option>");
                    $.each(data, function (index, item) {
                        loctAreaSelect.append("<option value=\"" + item.regionId + "\">" + item.regionName + "</option>")
                    });
                    form.render('select', "loctAreaCode");
                },
                'json')
        });


        //监听提交
        form.on('submit(*)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}会所成功",{closeBtn: 0},  function () {
                            window.location.href = "${ctx}/subsy";
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
            , url: '${ctx}/subsy/uploadSusbyBanner' //上传接口
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

        form.verify(verify);
        $("#back").on("click", function(event){
            location.href = "${ctx}/subsy/";
            //setReturnValueFalse(event);
        })
    });

</script>

</body>
</html>
