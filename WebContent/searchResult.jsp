<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
  <div class="col-md-12">
	<c:forEach items="${bookList }" var="book">
   		<div class="media">
		  <div class="media-left">
		    <a href="#">
		      <img class="media-object" src="${pageContext.request.contextPath}/${book.pic}" alt="${book.name}">
		    </a>
		  </div>
		  <div class="media-body">
		    <h4 class="media-heading"><a href="${pageContext.request.contextPath}/book/${book.id}.html">${book.name }</a></h4>
		    <h5>作者：${book.author}</h5>
		    <h5>出版社：${book.press}</h5>
		    <h5>出版时间：<fmt:formatDate pattern="yyyy-MM" value="${book.publishTime }" /></h5>
		    <%-- ${fn:substring(book.description, 0, 200) } --%>
		  </div>
		</div>
   	</c:forEach>
  </div>
</div>
</body>
</html>