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
			<div>
				<c:forEach items="${bigType.smallTypeList }" var="smallType">
			    	<a href="${pageContext.request.contextPath}/smallType/${smallType.id }.html"><span class="label label-default pull-right">${smallType.name }</span></a>
			    </c:forEach>
				<ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/">首页</a></li>
				  <li><a href="${pageContext.request.contextPath}/bigType/${bigType.id }.html">${bigType.name }</a></li>
				</ol>
			</div>
			<div class="panel-body">
				<c:forEach items="${bookList }" var="book">
					<div class="col-md-2">
						<%-- <a href="#" class="thumbnail">
					      <img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }">
					    </a> --%>
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
		<%-- <c:forEach items="${bigTypeList }" var="bigType">
		</c:forEach> --%>
	  
	  
	</div>
	
</div>
</body>
</html>