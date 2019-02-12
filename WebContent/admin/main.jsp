<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;

function openTab(text, url, iconCls) {
	if ($("#tabs").tabs("exists", text)) {
		$("#tabs").tabs("select", text);
	} else {
		var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/page/"
				+ url + "'></iframe>";
		$("#tabs").tabs("add", {
			title : text,
			iconCls : iconCls,
			closable : true,
			content : content
		});
	}
}

function openPasswordModifyDialog() {
	$("#dlg").dialog("open").dialog("setTitle", "修改密码");
		url = "${pageContext.request.contextPath}/admin/user/modifyPassword.do?id=${currentUser.id}";
}

function modifyPassword() {
	$("#fm").form("submit", {
		url : url,
		onSubmit : function() {
			var oldPassword = $("#oldPassword").val();
			var newPassword = $("#newPassword").val();
			var newPassword2 = $("#newPassword2").val();
			if (!$(this).form("validate")) {
				return false;
			}
			if (oldPassword != '${currentUser.password}') {
				$.messager.alert("系统提示", "用户原密码输入错误！");
				return false;
			}
			if (newPassword != newPassword2) {
				$.messager.alert("系统提示", "确认密码输入错误！");
				return false;
			}
			return true;
		},
		success : function(result) {
			var result = eval('(' + result + ')');
			if (result.success) {
				$.messager.alert("系统提示", "密码修改成功，下一次登录生效！");
				resetValue();
				$("#dlg").dialog("close");
			} else {
				$.messager.alert("系统提示", "密码修改失败！");
				return;
			}
		}
	});
}

function closePasswordModifyDialog() {
	resetValue();
	$("#dlg").dialog("close");
}

function resetValue() {
	$("#oldPassword").val("");
	$("#newPassword").val("");
	$("#newPassword2").val("");
}

function logout() {
	$.messager
			.confirm(
					"系统提示",
					"您确定要退出系统吗？",
					function(r) {
						if (r) {
							window.location.href = "${pageContext.request.contextPath}/admin/user/logout.do";
						}
					});
}

function refreshSystem(){
	$.post("${pageContext.request.contextPath}/admin/system/refreshSystem.do",{},function(result){
		if(result.success){
			$.messager.alert("系统提示","已成功刷新系统缓存！");
		}else{
			$.messager.alert("系统提示","刷新系统缓存失败！");
		}
	},"json");
}
</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="33%">
				<img alt="logo" src="${pageContext.request.contextPath}/static/images/logo.png">
			</td>
			<td valign="bottom" align="right">
				<table>
					<tr>
						<c:if test="${currentUser.status==2 }">
							<td><strong>管理员：</strong></td>
						</c:if>
						<c:if test="${currentUser.status==1 }">
							<td><strong>普通用户：</strong></td>
						</c:if>
						<td><font color="red"><strong>『${currentUser.userName }』</strong></font></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="margin-top: 50px;">
				<!-- <font size="10" color="red">欢迎使用！</font> -->
				<img alt="" src="${pageContext.request.contextPath}/static/images/a.jpg" style="height: 100%;">
			</div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="书籍管理"  data-options="selected:true,iconCls:'icon-jcsjgl'" style="padding:10px">
			<a href="javascript:openTab('管理书籍','bookManage.jsp','icon-star')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-star'" style="width: 150px; text-align: left;">管理书籍</a>
			<a href="javascript:openTab('管理书籍大类','bigTypeManage.jsp','icon-starZx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-starZx'" style="width: 150px; text-align: left;">管理书籍大类</a>
			<a href="javascript:openTab('管理书籍小类','smallTypeManage.jsp','icon-starZx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-starZx'" style="width: 150px; text-align: left;">管理书籍小类</a>
		</div>
		<div title="用户管理" data-options="selected:true,iconCls:'icon-role'" style="padding: 10px;">
			<a href="javascript:openTab('管理用户','userManage.jsp','icon-man')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-man'" style="width: 150px; text-align: left;">管理用户</a>
		</div>
		<div title="订单管理" data-options="selected:true,iconCls:'icon-order'" style="padding: 10px;">
			<a href="javascript:openTab('管理订单','orderManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px; text-align: left;">管理订单</a>
		</div>
		<div title="系统管理" data-options="selected:true,iconCls:'icon-exam'" style="padding: 10px">
			<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" style="width: 150px; text-align: left;">刷新系统缓存</a>
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px; text-align: left;">修改密码</a>
			<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px; text-align: left;">安全退出</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px" align="center">
	版权所有： ******* 
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名：</td>
   			<td>
   				<input type="text" id="userName" name="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px"/>
   			</td>
   		</tr>
   		<tr>
   			<td>原密码：</td>
   			<td><input type="password" id="oldPassword" name="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>新密码：</td>
   			<td><input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>确认新密码：</td>
   			<td><input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>