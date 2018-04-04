<%@ page contentType="text/html;charset=UTF-8" %>

<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    layui.use(['form', 'jquery', 'globalAjax', 'upload', 'verify', 'jqueryStep', 'element'], function () {
        var $ = layui.jquery, form = layui.form, element = layui.element,
            layer = layui.layer, upload = layui.upload, verify = layui.verify,
            jqueryStep = layui.jqueryStep;
        form.verify(verify);

        //删除图片
        $(document).on("click", ".del-icon", function () {
            delPic(this);
        });

        //删除图片公共方法
        function delPic(obj) {
            var vb = $(obj).parent().attr("vb");
            var value = $(obj).parent().parent().find("input").val();
            value = ("," + value + ",").replace("," + vb + ",", "");
            $(obj).parent().parent().find("input").val(value.replace(/(^,*)|(,*$)/g, ""));
            $(obj).parent().remove();
        }


        //上传
        upload.render({
            elem: '.uploadImg' //绑定元素
            , url: '${ctx}/subsyAudit/uploadImg' //上传接口
            , accept: 'images'
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
                var item = this.item;
                this.data = {"prodTypeCode": item.prev().val()};
            }
            , done: function (res) {
                layer.closeAll('loading');
                var item = this.item;
                var prodTypeCode = item.prev().val();
                var height, weight;
                if (prodTypeCode === "00480006") {
                    height = 200;
                    weight = 375;
                }
                if (prodTypeCode === "00480004") {
                    height = 85;
                    weight = 85;
                }
                if (prodTypeCode === "00480001") {
                    height = 200;
                    weight = 375;
                }
                if (prodTypeCode === "00480026") {
                    height = 85;
                    weight = 85;
                }

                item.prev().prev().find("input").val(res.imageCode);
                item.prev().prev().find(".img-box").remove();
                var array = [];
                array.push("<div class=\"img-box\" vb=\"" + res.imageCode + "\">");
                var src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode;
                array.push("<img src= \"" + src + "\" width='" + weight + "' height='" + height + "'/>");
                array.push("<div class=\"del-icon\"> <i class=\"layui-icon\">&#x1006;</i></div>");
                array.push("</div>");
                item.prev().prev().append(array.join(""));
            }
        });


        //多图上传
        upload.render({
            elem: '.uploadMultiImg' //绑定元素
            , url: '${ctx}/subsyAudit/uploadImg' //上传接口
            , accept: 'images'
            , multiple: true
            , exts: 'jpg|png|gif|bmp|jpeg'
            , field: 'upload'
            , before: function () {
                layer.load();
                var item = this.item;
                this.data = {"prodTypeCode": item.prev().val()};
            }, done: function (res) {
                layer.closeAll('loading');
                var item = this.item;
                var prodTypeCode = item.prev().val();
                var height, weight;
                if (prodTypeCode === "00480007") {
                    weight = 375;
                    height = 200;
                }
                if (prodTypeCode === "00480002") {
                    weight = 375;
                    height = 200;
                }

                var detailCodes = item.prev().prev().find("input").val();
                if (detailCodes) {
                    detailCodes = detailCodes + "," + res.imageCode;
                } else {
                    detailCodes = res.imageCode;
                }
                item.prev().prev().find("input").val(detailCodes);
                var array = [];
                array.push("<div class=\"img-box\" vb=\"" + res.imageCode + "\">");
                var src = "${ctx}/reso/downLoadPicFile?tranResoFileMngId=" + res.imageCode;
                array.push("<img src= \"" + src + "\" width='" + weight + "' height='" + height + "'/>");
                array.push("<div class=\"del-icon\"> <i class=\"layui-icon\">&#x1006;</i></div>");
                array.push("</div>");
                item.prev().prev().append(array.join(""));
            }
        });

    });






</script>
