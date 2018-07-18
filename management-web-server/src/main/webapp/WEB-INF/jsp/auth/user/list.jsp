<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../jsp/common/tags.jsp" %>

    <title>用户管理</title>

    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">


</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <jsp:include page="../../header.jsp"/>
    <jsp:include page="../../aside.jsp"/>
    <div class="layui-body">


        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i> 用户管理</h5>
            </div>

            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <div class="layui-inline">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input id="name" name="name" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline">
                                    <input id="mobile" name="mobile" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                                <button type="reset" class="layui-btn layui-btn-normal" >清 空</button>
                                <shiro:hasPermission name="user:create">
                                    <button id="add" type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="add">新 增</button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-xs-12 mt">

                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 15%;">会所</th>
                                    <th style="width: 10%;">姓名</th>
                                    <th style="width: 10%;">手机号码</th>
                                    <th style="width: 10%;">性别</th>
                                    <th style="width: 10%;">状态</th>
                                    <th style="width: 10%;">最终更新时间</th>
                                    <th style="width: 10%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div><!-- /col-xs-12 END SECTION MIDDLE -->


    <!--main content end-->
    <jsp:include page="../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>

    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer, form = layui.form, datatable = layui.datatable;
        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable(data.field.subsyCode, data.field.gderFlg, data.field.appAcesFlg);
            return false;
        });

        form.on('submit(add)', function () {
            window.location.href = "${ctx}/user/create";
            return false;
        });

        //初始化表格
        function initTable(subsyCode, gderFlg, appAcesFlg) {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/user/getInterUserData';
            json.param = [{
                name: "name",
                value: $("#name").val()
            }, {
                name: "mobile",
                value: $("#mobile").val()
            }, {
                name: "appAcesFlg",
                value: appAcesFlg
            }, {
                name: "subsyCode",
                value: subsyCode
            }, {
                name: "gderFlg",
                value: gderFlg
            }];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                }, {
                    "mData": "subsyNames",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "sWidth": "180px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        if (row.name) {
                            return row.name
                        }
                        return row.userName;
                    }
                }, {
                    "mData": "mobile",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "sex",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "sWidth": "150px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        return row.appAcesFlg ? '有效' : '无效';
                    }
                }, {
                    "mData": "timeStr",
                    "sWidth": "200px",
                    "sClass": "text-center"

                }, {
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + row.interUserCode + "\">");
                        array.push("<i title=\"查看\" class=\"layui-icon\">&#xe63c;</i>");
                        array.push("</button>");
                        <shiro:hasPermission name="user:update">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.interUserCode + "\">");
                        array.push("<i title=\"编辑\" class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        <shiro:hasPermission name="user:validate">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm validate\" vb=\"" + row.interUserCode + "\">");
                        if (row.appAcesFlg) {
                            array.push("<i title=\"无效\" class=\"layui-icon\">&#x1007;</i>");
                        } else {
                            array.push("<i title=\"有效\" class=\"layui-icon\">&#xe616;</i>");
                        }
                        array.push("</button>");
                        </shiro:hasPermission>
                        <shiro:hasPermission name="user:update">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm changepwd\" vb=\"" + row.interUserCode + "\">");
                        array.push("<i title=\"改密\" class=\"layui-icon\">&#xe64c;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $(document).on('click', ".toDetail", function () {
            var interUserCode = $(this).attr("vb");
            $.get("${ctx}/user/checkSessionAlive", function(data){
                if(data && data !== '') {
                    layer.open({
                        type : 2
                        ,resize: false
                        , area: [(window.screen.width - 300) + 'px', '600px']
                        , move: false
                        ,content: "${ctx}/user/" + interUserCode + "/detail"
                    });
                } else {
                    layer.alert("会话过期请重新登录",{
                        skin: 'layui-layer-molv'
                        , closeBtn: 0
                        , shift: 4 //动画类型
                    },function(){
                        location.href = ctx;
                    })
                }
            },'html');
        });
        $(document).on('click', ".toEdit", function () {
            var interUserCode = $(this).attr("vb");
            window.location.href = "${ctx}/user/" + interUserCode + "/update"
        });
        $(document).on('click', ".changepwd", function () {
            var interUserCode = $(this).attr("vb");
            window.location.href = "${ctx}/user/" + interUserCode + "/changePassword"
        });
        $(document).on('click', ".validate", function () {
            var interUserCode = $(this).attr("vb");
            $.post("${ctx}/user/" + interUserCode + "/validate", function (data) {
                if (data.status === 200) {
                    layer.alert("操作成功");
                    $("#table_data").dataTable().fnDraw(false);
                } else {
                    //layer.alert(data.errorMsg);
                    if(data.status === 500){
                        layer.alert("服务器繁忙，请联系管理员，谢谢。");
                    }else {
                        layer.alert(data.msg)
                    }
                }
            }, 'json');
        });

    });


</script>


</body>
</html>
