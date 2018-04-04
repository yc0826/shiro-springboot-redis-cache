<%@ page contentType="text/html;charset=UTF-8" %>
<span class="page_nav_area">
    <a class="btnp btnp_default page_prev" href="javascript:topage(1);">
        <i class="arrow"></i>
    </a>
    <span class="page_num">
    <label>${pageIndex}</label>
    <span class="num_gap">/</span>
        <label>${pageCount}</label>
    </span>
    <a class="btnp btnp_default page_next" href="javascript:topage(2);">
        <i class="arrow"></i>
    </a>
</span>
<span class="goto_area">
        <input id="textfield" type="text">
        <a class="btnp btnp_default page_go" href="javascript:gopage();">跳转</a>
    </span>
<script type="text/javascript">
    function getBasePath() {
        var obj = window.location;
        return obj.protocol + "//" + obj.host + "${uri}";
    }

    function gopage() {
        var num = document.getElementById("textfield").value;
        if (!num) {
            alert('页码不能为空');
        }
        document.getElementById("textfield").value = '';
        var form = document.getElementById("hiddenForm");
        form.action = getBasePath() + '?pageNo=' + num;
        form.submit();
    }

    function topage(flag) {
        var form = document.getElementById("hiddenForm");
        var num;

        if (2 === flag) {
            num = parseInt('${pageIndex}') + 1;
            if (num > '${pageCount}') {
                return;
            }
        }
        if (1 === flag) {
            num = parseInt('${pageIndex}') - 1;
            if (num < 0) {
                return;
            }
        }
        form.action = getBasePath() + '?pageNo=' + num;
        form.submit();
    }

</script>
<form method="post" id='hiddenForm'>
    <input type="hidden">
</form>


