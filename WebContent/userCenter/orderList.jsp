<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmReceive(orderNo){
		if(confirm("确认收货？")){
			$.post("${pageContext.request.contextPath}/order/confirmReceive.do",{status:4,orderNo:orderNo},function(result){
				var result=eval('('+result+')');
				if(result.success){
					alert("确认收货成功！");
					location.reload();
				}else{
					alert("确认收获失败！");
				}
			});
		}
	}
</script>
</head>
<body>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">订单管理</div>
  <div class="panel-body">
    <form class="form-inline pull-right" action="${pageContext.request.contextPath}/order/findOrder.do">
	  <div class="form-group">
	    <label for="s_orderNo">订单号：</label>
	    <input type="text" class="form-control" id="s_orderNo" name="orderNo" value="${s_order.orderNo }" placeholder="请输入订单号" style="width: 300px;">
	  </div>
	  <button type="submit" class="btn btn-default">查询</button>
	</form>
  </div>

  <!-- Table -->
  <table class="list table-bordered">
	<c:forEach var="order" items="${orderList }">
		<tr style="background-color: #f7f4eb">
			<td colspan="4">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			单号：${order.orderNo }
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			下单时间：<fmt:formatDate value="${order.createTime }" type="date" pattern="yyyy-MM-dd"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			状态：
			<c:choose>
				<c:when test="${order.status==1 }">待审核</c:when>
				<c:when test="${order.status==2 }">待发货</c:when>
				<c:when test="${order.status==3 }"><input type="button" style="border: 1px solid red" value="确认收货" onclick="confirmReceive(${order.orderNo})"/></c:when>
				<c:when test="${order.status==4 }">交易已完成</c:when>
			</c:choose>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			总金额：${order.cost }&nbsp;(元)
			</td>
		</tr>
		<c:forEach var="orderBook" items="${order.orderBookList }">
			<tr>
				<td width="50%">
					<a href="${pageContext.request.contextPath}/book/${orderBook.book.id}.html" target="_blank"><img width="72" height="72" src="${pageContext.request.contextPath}/${orderBook.book.pic }"></a>
					&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/book/${orderBook.book.id}.html" target="_blank">${orderBook.book.name}</a>
				</td>
				<td width="17%">
					&nbsp;&nbsp;
					${orderBook.book.price}
				</td>
				<td width="17%">
					&nbsp;&nbsp;
					${orderBook.num}
				</td>
				<td>
					&nbsp;&nbsp;小计：
					${orderBook.num*orderBook.book.price}&nbsp;(元)
				</td>
			</tr>
		</c:forEach>
	</c:forEach>
  </table>
</div>
</body>
</html>