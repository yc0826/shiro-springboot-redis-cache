<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/resource.jsp"%>
<%@ include file="../../common/tags.jsp"%>
<jsp:include page="../../common/autoHeight.jsp" />
<title>会所</title>
	<shiro:hasPermission name="subsy:update">
	 <c:set value="1" var="allow_update" />
	 </shiro:hasPermission>	
	 <shiro:hasPermission name="subsy:delete">
	 <c:set value="1" var="allow_delete" />
	</shiro:hasPermission>
</head>
<body>
	<div class="col_main lightshadow" id="forAutoHeight">
        <h2 class="page_headline"><span class="c_blue store_title">会所列表</span></h2>
        <div class="pb50">
          <!-- 表格开始 -->
			    <div class="table_grid">
			        <ul class="table_title">
			            <li class="w200">会所名称</li>
			            <li class="w200">会所地址</li>
			            <li class="w200">操作</li>			           
			        </ul>
			         <c:forEach items="${subsyList}" var="subsy">
				        <ul class="table_content">
				            <li class="w200">${subsy.subsyName}</li>
				            <li class="w200">${subsy.subsyAddr}</li>
				            <li class="w200">
				            	<c:if test="${allow_update==1}">
			                        <a href="${ctx}/subsy/${subsy.subsyCode}/update">修改</a>
			                    </c:if>
			                    <c:if test="${allow_delete==1}">
			                        <a href="${ctx}/subsy/${subsy.subsyCode}/delete">删除</a>
			                    </c:if>
				            </li>
				        </ul>
			        </c:forEach>
			    </div>
			    <br/><br/>
            <span class="page_center">
				<jsp:include page="../../pageTag.jsp" />
            </span>
             <!-- 表格结束-->
        </div> 
        <c:if test="${not empty msg}">
		    <div class="message">${msg}</div>
		</c:if>
		 <shiro:hasPermission name="subsy:create">
		    <a href="${ctx}/user/create" class="btn btn_primary" style="float: right;">会所新增</a>
		 </shiro:hasPermission>
      </div>

</body>
</html>