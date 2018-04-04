<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../common/resource.jsp" %>
    <%@ include file="../../common/tags.jsp" %>
    <title>编辑角色管理</title>
    <!-- Bootstrap core CSS -->
    <!--external css-->

    <!-- Custom styles for this template -->
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/zTreeStyle.css" rel="stylesheet"/>
    <style>
        ul.ztree {
            margin-top: 10px;
            border: 1px solid #dddddd;
            /*background: #fff;*/
            width: 400px;
            height: 200px;
            overflow-y: scroll;
            overflow-x: auto;
        }

    </style>
</head>
<body>
<div class="row mt wrapper layui-container ">
    <div class=" layui-row row-style">
        <div class="form-panel">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>编辑用户</legend>
            </fieldset>
            <!-- 表格开始 -->
            <form class="layui-form">
                <input id="resoCodes" name="resoCodes" type="hidden" value="${role.resoCodes}">
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label">角色名</label>
                        <div class="layui-input-inline layui-form">
                            <input id="rollName" type="text" name="rollName" value="${role.rollName}"
                                   placeholder="输入角色名称" autocomplete="off" class="layui-input" lay-verify="notnull"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label">角色描述：</label>
                        <div class="layui-input-inline">
                            <input id="description" type="text" name="rollDesc" value="${role.rollDesc}"
                                   placeholder="输入角色描述" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label">资源列表：</label>
                        <div class="layui-input-inline">
                                <div id="menuContent" class="menuContent" style="display:block; ">
                                    <ul id="tree" class="ztree" style="margin-top:0; width: 278px;height: 230px;"></ul>
                                </div>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item btn-position">
                    <div class=" layui-inline">
                        <button class="layui-btn" lay-submit lay-filter="role">${op}</button>
                    </div>
                    <div class=" layui-inline">
                        <button id="back" type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>
            </form>
            <%--<div id="menuContent" class="menuContent" style="display:none; position: absolute;">--%>
                <%--<ul id="tree" class="ztree" style="margin-top:0; width:160px;"></ul>--%>
            <%--</div>--%>
            <!-- 表格结束-->
        </div>
    </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>

<script type="text/javascript">
    layui.use(['layer', 'globalAjax', 'ztree', 'form', 'verify'], function () {
        var $ = layui.jquery, layer = layui.layer, verify = layui.verify, form = layui.form;
        $(function () {
            var setting = {
                check: {
                    enable: true,
                    chkboxType: {"Y": "p", "N": "s"}
                },
                view: {
                    dblClickExpand: false
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onCheck: onCheck
                }
            };

            var zNodes = [
                <c:forEach items="${resourceList}" var="r">
                <c:if test="${not r.rootNode}">
                {
                    id:${r.resoCode},
                    pId:${r.parentResoCode},
                    name: "${r.resoName}",
                    checked:${shb:in(role.resoCodeList, r.resoCode)}
                },
                </c:if>
                </c:forEach>
            ];

            function onCheck(e, treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree"),
                    nodes = zTree.getCheckedNodes(true),
                    id = "",
                    name = "";
                nodes.sort(function compare(a, b) {
                    return a.id - b.id;
                });
                for (var i = 0, l = nodes.length; i < l; i++) {
                    id += nodes[i].id + ",";
                    name += nodes[i].name + ",";
                }
                if (id.length > 0) id = id.substring(0, id.length - 1);
                if (name.length > 0) name = name.substring(0, name.length - 1);
                $("#resoCodes").val(id);
                $("#resourceName").val(name);
            }



            $.fn.zTree.init($("#tree"), setting, zNodes);
        });
        form.verify(verify);
        //监听提交
        form.on('submit(role)', function (data) {
            $.ajax({
                url: window.location.pathname,
                type: 'post',
                data: data.field,
                dataType: 'json',
                timeout: 10000,
                success: function (data) {
                    if (data.status === 200) {
                        layer.alert("${op}角色成功", {closeBtn: 0}, function () {
                            window.location.href = "${ctx}/role";
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
        $("#back").on("click", function (event) {
            location.href = "${ctx}/role/";
            //setReturnValueFalse(event);
        })

    });
</script>
</body>
</html>