<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>护理师管理</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <!--header start-->
    <jsp:include page="../../../header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page="../../../aside.jsp"/>
    <!--sidebar end-->
    <!--main content start-->
    <div class="layui-body">
        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>护理师管理</h5>
            </div>


            <div class="form-horizontal style-form ">
                <form class="layui-form">
                    <div class="layui-form-item layui-row">

                        <div class="layui-inline layui-col-md8">
                            <div class="layui-inline">
                                <label class="layui-form-label">会所</label>
                                <div class="layui-input-inline">
                                    <select name="subsyCode" lay-search>
                                        <option value="">请选择</option>
                                        <c:forEach items="${subsyList}" var="subsy">
                                            <option value="${subsy.subsyCode}">${subsy.subsyDispName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">护理师姓名</label>
                                <div class="layui-input-inline">
                                    <input id="name" name="name" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">护理师手机号</label>
                                <div class="layui-input-inline">
                                    <input id="mobile" name="mobile" class="layui-input" type="text"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">护理师等级</label>
                                <div class="layui-input-inline">
                                    <select id="grade" name="grade">
                                        <option value="">请选择</option>
                                        <c:forEach items="${shb:getListByType('0043')}" var="gen">
                                            <option value="${gen.genCode}">${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">状态</label>
                                <div class="layui-input-inline">
                                    <select id="statCode" name="statCode">
                                        <option value="">请选择</option>
                                        <c:forEach items="${shb:getListByType('0076')}" var="gen">
                                            <option value="${gen.genCode}">${gen.genSubName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="layui-inline layui-col-md3">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">查 询</button>
                            <button type="reset" class="layui-btn layui-btn-normal">清 空</button>
                            <shiro:hasPermission name="mmatron:create">
                                <button id="add" class="layui-btn layui-btn-normal" lay-submit lay-filter="add">新 增
                                </button>
                            </shiro:hasPermission>
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
                                    <th style="width: 8%;">护理师code</th>
                                    <th style="width: 10%;">护理师名称</th>
                                    <th style="width: 10%;">所属会所</th>
                                    <th style="width: 10%;">护理师手机号</th>
                                    <th style="width: 5%;">护理师等级</th>
                                    <th style="width: 5%;">护理师状态</th>
                                    <th style="width: 5%;">最终更新时间</th>
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
    </div>
    <!--main content end-->
    <jsp:include page="../../../footer.jsp"/>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'form'], function () {
        var $ = layui.jquery, datatable = layui.datatable, form = layui.form;

        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable(data.field.subsyCode, data.field.grade, data.field.statCode);
            return false;
        });


        form.on('submit(add)', function () {
            window.location.href = "${ctx}/mmatron/create";
            return false;
        });

        //初始化表格
        function initTable(subsyCode, grade, statCode) {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/mmatron/getMmatronListData';
            json.param = [{
                name: "subsyCode",
                value: subsyCode
            }, {
                name: "name",
                value: $("#name").val()
            }, {
                name: "mobile",
                value: $("#mobile").val()
            }, {
                name: "grade",
                value: grade
            }, {
                name: "statCode",
                value: statCode
            }];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                }, {
                    "mData": "mmatronBaseCode",
                    "sWidth": "180px",
                    "sClass": "text-center"
                }, {
                    "sWidth": "180px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        return row.mmatronLastName + row.mmatronFirstName
                    }
                }, {
                    "mData": "mmatronBelongCorpName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "mmatronMobNum",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "mmatronGradeName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "mmatronStatusName",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "updTime",
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        if (row.updTime) {
                            return longToDateTime(row.updTime);
                        } else {
                            return longToDateTime(row.crtTime);
                        }
                    }

                }, {
                    "sWidth": "200px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group tr-min-width\">");
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + row.mmatronBaseCode + "\">");
                        array.push("<i title=\"查看\" class=\"layui-icon\">&#xe63c;</i>");
                        array.push("</button>");
                        <shiro:hasPermission name="mmatron:update">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toEdit\" vb=\"" + row.mmatronBaseCode + "\">");
                        array.push("<i title=\"编辑\" class=\"layui-icon\">&#xe642;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        <shiro:hasPermission name="mmatron:audit">
                        array.push("<button  class=\"layui-btn layui-btn-primary layui-btn-sm toAudit\" vb=\"" + row.mmatronBaseCode + "\">");
                        array.push("<i title=\"审核\" class=\"layui-icon\">&#xe616;</i>");
                        array.push("</button>");
                        </shiro:hasPermission>
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }


        $(document).on('click', ".toAudit", function () {
            var mmatronBaseCode = $(this).attr("vb");
            window.location.href = "${ctx}/mmatron/" + mmatronBaseCode + "/toAudit"
        });
        $(document).on('click', ".toDetail", function () {
            var mmatronBaseCode = $(this).attr("vb");
            $.get("${ctx}/user/checkSessionAlive", function(data){
                if(data && data !== '') {

                    layer.open({
                        type : 2
                        ,resize: false
                        , area: [(window.screen.width - 300) + 'px', '800px']
                        , move: false
                        ,content: "${ctx}/mmatron/" + mmatronBaseCode + "/detail"
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
            var mmatronBaseCode = $(this).attr("vb");
            window.location.href = "${ctx}/mmatron/" + mmatronBaseCode + "/update"
        });


    });


</script>
</body>
</html>
