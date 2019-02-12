<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	function logout(){
		$.post("${pageContext.request.contextPath}/user/logout.do",{},function(result){
			if (result.success) {
				alert("已退出登录");
				window.location.reload(true);
			} else {
				alert(result.errorInfo);
			}
		},"json");
	}
	
	function checkLogin(){
		if('${currentUser.userName}'==''){
			alert("请先登录！");
		}else{
			window.location.href="shopping_list.action";
		}
	}
	
	function checkSubmit(){
		var name=document.getElementById("s_name").value;
		if (name==""||name==null) {
			alert("请输入书名");
			return false;
		} 
		return true;
	}
</script>
</head>
<body>
<div class="row">
	<nav class="navbar navbar-default">
		<div class="container">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img alt="Brand" src="${pageContext.request.contextPath}/static/images/logo.jpg">
		  </a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<c:forEach items="${bigTypeList }" var="bigType">
	      		<li><a href="${pageContext.request.contextPath}/bigType/${bigType.id }.html">${bigType.name }</a></li>
	      	</c:forEach>
	      </ul>
	      <form class="navbar-form navbar-left" method="post" role="search" action="${pageContext.request.contextPath}/book/list.do">
			  <div class="form-group">
			    <input type="text" id="s_name" name="name" class="form-control" value="${s_book.name }" placeholder="">
			  </div>
			  <button type="submit" class="btn btn-default" onclick="return checkSubmit()">搜索</button>
		  </form>
	      <ul class="nav navbar-nav navbar-right">
	        
	        <c:choose>
	        	<c:when test="${not empty currentUser }">
	        		<li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎：${currentUser.userName } <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="${pageContext.request.contextPath}/shopping/buyPage.do"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车(${shoppingCart.shoppingCartItems==null?0:shoppingCart.shoppingCartItems.size() }件商品)</a></li>
			            <li><a href="javascript:logout()">退出登录</a></li>
			          </ul>
			        </li>
	        	</c:when>
	        	<c:otherwise>
			        <li><a href="${pageContext.request.contextPath}/user/loginPage.do">登录</a></li>
			        <li><a href="${pageContext.request.contextPath}/user/registerPage.do">注册</a></li>
	        	</c:otherwise>
	        </c:choose>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
		</div>
	</nav>
</div>
</body>
</html>