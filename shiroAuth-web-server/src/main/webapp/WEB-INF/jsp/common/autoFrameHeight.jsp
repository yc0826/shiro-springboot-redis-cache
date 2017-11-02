<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/resource.jsp" %>
    <%@ include file="../common/tags.jsp" %>
    <title>系统管理</title>
    <script type="text/javascript">
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r !== null) return unescape(r[2]);
            return null;
        }

        function pseth() {
            var iObj = parent.parent.document.getElementById('iframe');//A和main同域，所以可以访问节点
            iObj.style.height = getQueryString("height") + "px";
        }

        pseth();
    </script>
</head>
<body>
hello
</body>
</html>