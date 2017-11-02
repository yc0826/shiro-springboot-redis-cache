<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/resource.jsp"%>
<%@ include file="../../common/tags.jsp"%>
<title>组织机构管理</title>
	<link rel="stylesheet" href="${ctx}/static/css/layout-default-latest.css" />
	<script src="${ctx}/static/js/common/jquery.layout-latest.min.js"></script>
	<script src="${ctx}/static/js/organization/index.js"></script>
</head>
<body id="nostyle">
	<!-- <div class="col_main lightshadow">
        <h2 class="page_headline"><span class="c_blue store_title">授权管理</span></h2>
        <div class="pb50">  -->  
			<iframe name="content" class="ui-layout-center"
		        src="" frameborder="0" scrolling="auto"></iframe>
			<iframe name="tree" class="ui-layout-west"
		        src="${ctx}/organization/tree" frameborder="0" scrolling="auto"></iframe>
		<!-- </div>
	</div> -->
</body>
</html>