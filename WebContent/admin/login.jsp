<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/login/css/default.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/login/css/styles.css"/>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/user/login.do" method="post">
		<article class="htmleaf-container">
            <header class="htmleaf-header">
                <h1>在线图书销售系统</h1>
                <div class="htmleaf-links">

                </div>
            </header>
            <div class="panel-lite">
                <div class="thumbur">
                    <div class="icon-lock"></div>
                </div>
                <h4>管理员登录</h4>
                <div class="form-group">
                    <input required="required" class="form-control" name="userName" value="${user.userName }"/>
                    <label class="form-label">用户名    </label>
                </div>
                <div class="form-group">
                    <input type="password" required="required" class="form-control" name="password" value="${user.password }"/>
                    <label class="form-label">密　码</label>
                </div>
                <font color="red">${errorMsg }</font><br>
                
                <button class="floating-btn"><i class="icon-arrow"></i></button>
            </div>
        </article>
		<div style="text-align:center;">
		</div>
	</form>
</body>
</html>