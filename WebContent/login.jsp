<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkForm(){
	var userName=$('#userName').val();
	var password=$('#password').val();
	if (userName==""||userName==null) {
		alert("请输入用户名！");
		return false;
	}else if(password==""||password==null){
		alert("请输入密码！")
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<div class="row">
  <div class="col-md-2">
  </div>
  <div class="col-md-8">
  	<form action="${pageContext.request.contextPath}/user/login.do" method="post">
	  <div class="form-group">
	    <label for="userName">登陆账号</label>
	    <input type="text" class="form-control" id="userName" name="userName" placeholder="登陆账号" onblur="exist(this.value)">
	    <font id="userErrorInfo" color="red"></font>
	  </div>
	  <div class="form-group">
	    <label for="password1">密码</label>
	    <input type="password" class="form-control" id="password" name="password" placeholder="密码">
	    <input type="hidden" name="oldUrl" value="${oldUrl }">
	  </div>
	  <div class="form-group">
	    ${errorInfo }
	  </div>
	  <button type="submit" class="btn btn-default" onclick="return checkForm()">登录</button>
	</form>
  </div>
  <div class="col-md-2">
  </div>
</div>
</body>
</html>