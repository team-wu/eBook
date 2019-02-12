<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 轮播、热门书籍 -->
<div class="row">
  <div class="col-md-8 my-col-left">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
		  <c:forEach items="${slideBookList }" var="book" varStatus="status">
		  	<c:choose>
	  			<c:when test="${status.index==0}">
	  				<li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="active"></li>
	  			</c:when>
	  			<c:otherwise>
	  				<li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
	  			</c:otherwise>
	  		</c:choose>
		  </c:forEach>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	  	<c:forEach items="${slideBookList }" var="book" varStatus="status">
	  		<c:choose>
	  			<c:when test="${status.index==0}">
	  				<div class="item active">
	  				  <a href="${pageContext.request.contextPath}/book/${book.id}.html">
	  				  	<img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }">
	  				  </a>
				      <div class="carousel-caption">
				        	<a href="${pageContext.request.contextPath}/book/${book.id}.html">${book.name }</a>
				      </div>
				    </div>
	  			</c:when>
	  			<c:otherwise>
	  				<div class="item">
				      <a href="${pageContext.request.contextPath}/book/${book.id}.html">
	  				  	<img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }">
	  				  </a>
				      <div class="carousel-caption">
				        	<a href="${pageContext.request.contextPath}/book/${book.id}.html">${book.name }</a>
				      </div>
				    </div>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
  </div>
  <div class="col-md-4 my-col-right">
  	<div class="panel panel-default">
	  <div class="panel-heading">
	    <h3 class="panel-title">热门书籍</h3>
	  </div>
	  <!-- <div class="panel-body"> -->
	    <ul class="list-group">
			<c:forEach items="${hotBookList }" var="book">
				<li class="list-group-item">
					<span class="badge">${book.click }</span>
					<a href="${pageContext.request.contextPath}/book/${book.id}.html">${book.name }</a>
				</li>
			</c:forEach>
		</ul>
	  <!-- </div> -->
	</div>
  </div>
</div>
<!-- 循环大类，显示最新书籍 -->
<div class="row">
	<div class="panel panel-default">
		<c:forEach items="${bigTypeList }" var="bigType">
			<div class="panel-heading">
			    <h3 class="panel-title"><a href="${pageContext.request.contextPath}/bigType/${bigType.id }.html">${bigType.name }</a>
			    <c:forEach items="${bigType.smallTypeList }" var="smallType">
			    	<a href="${pageContext.request.contextPath}/smallType/${smallType.id }.html"><span class="label label-default pull-right">${smallType.name }</span></a>
			    </c:forEach>
			    </h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${bigType.bookList }" var="book">
					<div class="col-md-2">
						<%-- <a href="#" class="thumbnail">
					      <img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }">
					    </a> --%>
					    <div class="thumbnail">
					      <a href="${pageContext.request.contextPath}/book/${book.id}.html"><img src="${pageContext.request.contextPath}/${book.pic }" alt="${book.name }"></a>
					      <div class="caption">
					        <h5>${book.name }</h5>
					        <p>作者：${book.author }</p>
					      </div>
					    </div>
					</div>
				</c:forEach>
		    </div>
		</c:forEach>
	  
	  
	</div>
	
</div>
</html>