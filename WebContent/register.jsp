<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ebook网络书城-用户注册</title>
 <script type="text/JavaScript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript">
function exist(userName){
	if (userName==""||userName==null) {
		$("#userErrorInfo").html("");
		//$("#userErrorInfo").html("请填写登录帐号！");
		return;
	}
	$.post("${pageContext.request.contextPath}/user/exist.do",{userName:userName},function(result){
		//var result=eval('('+result+')');
		if(result.exist){
			$("#userErrorInfo").html("该账户名已存在，请重新输入！");
			$("#userName").focus();
		}else{
			$("#userErrorInfo").html("");
		}
	},"json");
}

function checkForm(){
	var regPhoneNum = /^[0-9]{11}$/;
	var regidentityCode = /^[0-9]{18}$/;
	
	var phone=$('#mobile').val();
	var trueName=$('#trueName').val();
	var userName=$('#userName').val();
	var password1=$('#password1').val();
	var password2=$('#password2').val();
	var phone=$('#mobile').val();
	var address=$('#address').val();
	var birthday=$('#birthday').val();
	//alert(typeof(birthday));
	var identityCode=$('#identityCode').val();
	if (trueName==""||trueName==null){
    	alert("真实姓名不能为空");
    	return false;
    } else if (userName==""||userName==null){
    	alert("登录账号不能为空");
    	return false;
    } else if (password1==""||password1==null){
    	alert("密码不能为空");
    	return false;
    } else if (password2==""||password2==null){
    	alert("确认密码不能为空");
    	return false;
    } else if (password2!=password1){
    	alert("确认密码不正确");
    	return false;
    } else if (address==""||address==null){
    	alert("地址不能为空");
    	return false;
    } else if (!regidentityCode.test(identityCode)) {
    	alert("身份证号只能为18位数字");
        return false;
    } else if (birthday==""||birthday==null){
    	alert("出生日期不能为空");
    	return false;
    } else if (phone==""||phone==null){
    	alert("手机号码不能为空");
    	return false;
    } else if (!regPhoneNum.test(phone)) {
    	alert("手机号码只能为11位数字");
        return false;
    } else {
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
	<form action="${pageContext.request.contextPath}/user/register.do" method="post">
	  <div class="form-group">
	    <label for="exampleInputEmail1">真实姓名</label>
	    <input type="text" class="form-control" id="trueName" name="trueName" placeholder="真实姓名">
	  </div>
	  <div class="form-group">
	    <label for="userName">登陆账户名</label>
	    <input type="text" class="form-control" id="userName" name="userName" placeholder="登陆账户名" onblur="exist(this.value)">
	    <font id="userErrorInfo" color="red"></font>
	  </div>
	  <div class="form-group">
	    <label for="password1">密码</label>
	    <input type="password" class="form-control" id="password1" name="password" placeholder="密码">
	  </div>
	  <div class="form-group">
	    <label for="password2">确认密码</label>
	    <input type="password" class="form-control" id="password2" placeholder="再次输入密码">
	  </div>
	  <div class="form-group">
	  	  <label for="">性别</label>&nbsp;&nbsp;&nbsp;&nbsp;
		  <label class="radio-inline">
		  	<input type="radio" name="sex" id="male" value="男" checked> 男
		  </label>
		  <label class="radio-inline">
		  	<input type="radio" name="sex" id="female" value="女"> 女
		  </label>
	  </div>
	  <div class="form-group">
	    <label for="identityCode">身份证号</label>
	    <input type="text" class="form-control" id="identityCode" name="identityCode" placeholder="身份证号">
	  </div>
	  <div class="form-group">
           <label for="birthday" class="control-label">出生日期</label>
           <input id="birthday" name="birthday" class="Wdate form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style="width: 30%;height:32px;"/>  
      </div> 
	  <div class="form-group">
	    <label for="email">邮箱</label>
	    <input type="email" class="form-control" id="email" name="email" placeholder="邮箱">
	  </div>
	  <div class="form-group">
	    <label for="mobile">手机号码</label>
	    <input type="text" class="form-control"  maxlength="11" id="mobile" name="mobile" placeholder="手机号码">
	  </div>
	  <div class="form-group">
	    <label for="address">地址</label>
	    <input type="text" class="form-control" id="address" name="address" placeholder="地址">
	    <input type="hidden" name="status" value="1">
	    <input type="hidden" name="oldUrl" value="${oldUrl }">
	  </div>
	  <button type="submit" class="btn btn-default" onclick="return checkForm()">注册</button>
	</form>
  </div>
  <div class="col-md-2">
  </div>
</div>
</body>
</html>