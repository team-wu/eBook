<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>用户管理</h2>
<div class="row">
  <div class="col-md-2">
  </div>
  <div class="col-md-8">
	<form action="${pageContext.request.contextPath}/user/update.do" method="post">
	  <div class="form-group">
	    <label for="exampleInputEmail1">真实姓名</label>
	    <input type="text" class="form-control" id="trueName" name="trueName" placeholder="真实姓名" value="${currentUser.trueName }">
	  </div>
	  <div class="form-group">
	    <label for="userName">登陆账户名</label>
	    <input type="text" class="form-control" id="userName" name="userName" placeholder="登陆账户名" value="${currentUser.userName }" readonly="readonly">
	    <font id="userErrorInfo" color="red"></font>
	  </div>
	  <div class="form-group">
	    <label for="password1">密码</label>
	    <input type="text" class="form-control" id="password1" name="password" placeholder="密码" value="${currentUser.password }">
	  </div>
	  <div class="form-group">
	  	  <label for="">性别</label>&nbsp;&nbsp;&nbsp;&nbsp;
	  	  <c:choose>
			<c:when test="${currentUser.sex=='男' }">
				<label class="radio-inline">
				  	<input type="radio" name="sex" id="male" value="男" checked> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="sex" id="female" value="女"> 女
				</label>
			</c:when>
			<c:otherwise>
				<label class="radio-inline">
				  	<input type="radio" name="sex" id="male" value="男"> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="sex" id="female" value="女" checked> 女
				</label>
			</c:otherwise>
		  </c:choose>
	  </div>
	  <div class="form-group">
	    <label for="identityCode">身份证号</label>
	    <input type="text" class="form-control" id="identityCode" name="identityCode" placeholder="身份证号" value="${currentUser.identityCode }">
	  </div>
	  <div class="form-group">
           <label for="birthday" class="control-label">出生日期</label>
           <input id="birthday" name="birthday" class="Wdate form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
           		value="<fmt:formatDate value="${currentUser.birthday }" pattern="yyyy-MM-dd"/>" style="width: 30%;height:32px;"/>  
      </div> 
	  <div class="form-group">
	    <label for="email">邮箱</label>
	    <input type="email" class="form-control" id="email" name="email" placeholder="邮箱" value="${currentUser.email }">
	  </div>
	  <div class="form-group">
	    <label for="mobile">手机号码</label>
	    <input type="text" class="form-control"  maxlength="11" id="mobile" name="mobile" placeholder="手机号码" value="${currentUser.mobile }">
	  </div>
	  <div class="form-group">
	    <label for="address">地址</label>
	    <input type="text" class="form-control" id="address" name="address" placeholder="地址" value="${currentUser.address }">
	    <input type="hidden" name="status" value="1">
	    <input type="hidden" name="id" value="${currentUser.id }">
	  </div>
	  <button type="submit" class="btn btn-default" onclick="return checkForm()">修改</button>
	  <font color="red">${info }</font>
	</form>
  </div>
  <div class="col-md-2">
  </div>
</div>
</body>
</html>