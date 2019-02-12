<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
 <!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/myStyle.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>



<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
  <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container-fluid block" style="margin-top: 65px;">
  <jsp:include page="common/top.jsp"/>
  <div class="row">
  	<div class="col-md-3 my-col-left">
  		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">用户管理</h3>
		  </div>
		  <div class="panel-body">
		  		<div class="list-group">
				  <a href="${pageContext.request.contextPath}/user/getUserInfo.do" class="list-group-item active">个人信息管理</a>
				</div>
		  </div>
		  <div class="panel-heading">
		    <h3 class="panel-title">订单管理</h3>
		  </div>
		  <div class="panel-body">
		  		<div class="list-group">
				  <a href="${pageContext.request.contextPath}/order/findOrder.do" class="list-group-item active">个人订单管理</a>
				</div>
		  </div>
		</div>
  	</div>
  	<div class="col-md-8 my-col-right">
	  <jsp:include page="${mainPage }"/>
  	</div>
  </div>
  <jsp:include page="common/footer.jsp"/>
</div>

<script type="text/javascript">
$(function(){
	
});
</script>
</body>
</html>