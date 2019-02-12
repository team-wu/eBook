<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var countdown=4; 
 

window.onload = function(){

	setInterval(function() {
		settime(countdown)
	},1000);

}
function settime(val){
	if (countdown!=0) {
		document.getElementById("aa").innerHTML=val;
		countdown--;
	} else {
		window.location.href="${oldUrl}";
	}
	
}
</script>
</head>
<body>
注册成功，<span id="aa">5</span>秒后返回原来页面
</body>
</html>