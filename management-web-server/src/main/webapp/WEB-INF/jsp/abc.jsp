<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../jsp/common/resource.jsp" %>
    <%@ include file="../jsp/common/tags.jsp" %>

    <title>菜单管理</title>

    <!-- Bootstrap core CSS -->
    <%--<link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">--%>
    <!--external css-->
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/zabuto_calendar.css">--%>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <script src="${ctx}/static/js/common/jquery-1.11.1.min.js?v=${webVersion}"></script>
    <script src="${ctx}/static/js/common/jquery.step.min.js?v=${webVersion}"></script>
    <%--<!-- Custom styles for this template -->--%>
    <%--<link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">--%>
    <%--<link href="${ctx}/static/css/style-responsive.css" rel="stylesheet">--%>
    <style>
        .indextab{
            pointer-events: none;
            cursor: default;
            opacity: 0.6;
            cursor: not-allowed;
        }
        .indextab :hover{
            cursor: not-allowed;
        }
        table {
            font-size: 12px;
            border: none;
            border-spacing: 0px;
            width: 100%;
            text-align: center;
        }
        th {
            max-width: 50px;
            height: 50px;
            word-break: break-all;
            word-wrap: break-word;
        }
        tr {
            height: 44px;
        }
        td {
            border: 1px solid #eae5e5

        }
        tbody tr:nth-child(odd) {
            background: #f9f9f9;
        }
        .pointer{
            color: #1E9FFF;
            cursor: pointer;
        }
    </style>

</head>

<body>
<div class="row mt wrapper  layui-container ">
  <div>
      <table class="table">
          <thead>
          <tr>
              <th>序号</th>
              <th>护理师名称</th>
              <th>所属单位</th>
              <th>护理师会所服务天数</th>
              <th>护理师会所服务工资</th>
              <th>护理师住家服务天数</th>
              <th>护理师住家服务工资</th>
          </tr>
          </thead>
          <tbody>
          <tr>
              <td>#1</td>
              <td>王涛</td>
              <td>贝瑞佳</td>
              <td class="pointer">23天</td>
              <td>7000</td>
              <td >23天</td>
              <td>7000</td>
          </tr>

          </tbody>
      </table>
  </div>
</div>
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('layer', function(){
        var layer = layui.layer;

        $(".pointer").on("click", function () {
            layer.open({
                title: '服务天数'
                ,resize: false
                ,area: ['500px', '300px']
                ,move: false
                ,content: '' +
                '\n' +
                '<table class="table" id="layer_Box" >\n' +
                '    <thead>\n' +
                '    <tr>\n' +
                '        <th >序号</th>\n' +
                '        <th >护理师名称</th>\n' +
                '        <th>所属单位</th>\n' +
                '        <th >护理师会所服务天数</th>\n' +
                '        <th >护理师会所服务工资</th>\n' +
                '        <th >护理师住家服务天数</th>\n' +
                '        <th >护理师住家服务工资</th>\n' +
                '    </tr>\n' +
                '    </thead>\n' +
                '    <tbody>\n' +
                '    <tr>\n' +
                '        <td>#1</td>\n' +
                '        <td>王涛</td>\n' +
                '        <td>贝瑞佳</td>\n' +
                '        <td>23天</td>\n' +
                '        <td>7000</td>\n' +
                '        <td >23天</td>\n' +
                '        <td>7000</td>\n' +
                '    </tr>\n' +
                '\n' +
                '    </tbody>\n' +
                '</table>'
            });
        })

    });


</script>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/js/bootstrap.min.js?v=${webVersion}"></script>
<%--<script src="${ctx}/static/js/jquery.dcjqaccordion.2.7.js?v=${webVersion}"></script>--%>
<%--<script src="${ctx}/static/js/jquery.scrollTo.min.js?v=${webVersion}"></script>--%>
<%--<script src="${ctx}/static/js/jquery.nicescroll.js" ></script>--%>
<%--<script src="${ctx}/static/js/common-scripts.js?v=${webVersion}"></script>--%>


</body>
</html>

