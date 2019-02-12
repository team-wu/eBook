<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="panel panel-default">
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath}/">首页</a></li>
			  <li><a href="${pageContext.request.contextPath}/bigType/${smallType.bigType.id }.html">${smallType.bigType.name }</a></li>
			  <li><a href="${pageContext.request.contextPath}/smallType/${smallType.id }.html">${smallType.name }</a></li>
			</ol>
			<div class="panel-body">
				<c:forEach items="${bookList }" var="book">
					<div class="col-md-2">
					    <div class="thumbnail">
					      <a href="${pageContext.request.contextPath}/book/${book.id}.html">
					      	<img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }">
					      </a>
					      <div class="caption">
					        <h5>${book.name }</h5>
					        <p>作者：${book.author }</p>
					      </div>
					    </div>
					</div>
				</c:forEach>
		    </div>
	  
	</div>
	
</div>
</body>
</html>