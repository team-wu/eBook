<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function addShoppingCart(bookId){
	if('${currentUser.userName}'==''){
		alert("请先登录，然后购物！");
	}else{
		$.post("${pageContext.request.contextPath}/shopping/bookToCart.do",{bookId:bookId},
			function(result){
				var result=eval('('+result+')');
				if(result.success){
					alert("已成功加入购物车！");
					location.reload();
				}else{
					alert(result.errorInfo);
				}
			}
		);
	}
}

function goBuy(bookId){
	if('${currentUser.userName}'==''){
		alert("请先登录，然后购物！");
	}else{
		window.location.href="${pageContext.request.contextPath}/shopping/bookToCartAndGoBuy.do?bookId="+bookId;
	}
}
</script>
</head>
<body>
<div class="row">
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath}/${book.pic}" alt="${book.pic}" class="img-thumbnail img-detail">
	</div>
	<div class="col-md-6">
		<div class="row">
			<h2>${book.name }</h2>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6 message">作者：${book.author }</div>
			<div class="col-md-6 message">ISBN：${book.isbn }</div>
			<div class="col-md-6 message">出版社：${book.press }</div>
			<div class="col-md-6 message">出版时间：<fmt:formatDate pattern="yyyy-MM" value="${book.publishTime }" /></div>
			<div class="col-md-6 message">开本：${book.kaiben }</div>
			<div class="col-md-6 message">页数：${book.yeshu }</div>
			<div class="col-md-6 message">字数：${book.zishu }</div>
			<div class="col-md-6 message">库存：${book.stock }</div>
			<div class="col-md-6 message">价格：<span class="price">￥${book.price }</span></div>
		</div>
		<hr>
		<div class="row">
			  <button type="button" class="btn btn-danger btn-lg glyphicon glyphicon-yen" onclick="goBuy(${book.id })">购买</button>
			  <button type="button" class="btn btn-warning btn-lg glyphicon glyphicon-shopping-cart" onclick="addShoppingCart(${book.id })">放入购物车</button>
		</div>
	</div>
	<div class="col-md-2">
	
	</div>
</div>
<div class="row">
	<div class="page-header">
	  <h2>简介</h2>
	</div>
	<div style="padding: 0 20px 0 20px;">
		${book.description }
	</div>
	<div class="page-header">
	  <h2>目录</h2>
	</div>
	<div style="padding: 0 20px 0 20px;">
		${book.mulu }
	</div>
</div>
</body>
</html>