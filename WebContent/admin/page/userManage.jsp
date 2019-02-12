<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	
	function searchUser(){
		$("#dg").datagrid('load',{
			"userName":$("#s_userName").val()
		});
	}
	
	function deleteUser(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/user/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
		
	}
	
	
	function openUserAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url="${pageContext.request.contextPath}/admin/user/save.do";
	}
	
	
	function saveUser(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#sex").combobox("getValue")==""){
					$.messager.alert("系统提示","请选择性别");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
			}
		});
	}
	
	function openUserModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		$("#trueName").val(row.trueName);
		$("#userName").val(row.userName);
		$("#password").val(row.password);
		$("#sex").combobox("setValue",row.sex);
		$("#birthday").datebox("setValue",row.birthday);
		$("#identityCode").val(row.identityCode);
		$("#email").val(row.email);
		$("#mobile").val(row.mobile);
		$("#address").val(row.address);
		url="${pageContext.request.contextPath}/admin/user/save.do?id="+row.id;
	}
	
	function resetValue(){
		$("#trueName").val("");
		$("#userName").val("");
		$("#password").val("");
		$("#sex").combobox("setValue","");
		$("#birthday").datebox("setValue","");
		$("#identityCode").val("");
		$("#email").val("");
		$("#mobile").val("");
		$("#address").val("");
	}
	
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="用户管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/admin/user/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="trueName" width="100" align="center">真实姓名</th>
	 		<th field="userName" width="100" align="center">用户名</th>
	 		<th field="password" width="100" align="center">密码</th>
	 		<th field="sex" width="50" align="center">性别</th>
	 		<th field="birthday" width="100" align="center">出生日期</th>
	 		<th field="identityCode" width="150" align="center">身份证</th>
	 		<th field="email" width="100" align="center">邮件</th>
	 		<th field="mobile" width="100" align="center">联系电话</th>
	 		<th field="address" width="100" align="center">收货地址</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
			<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 570px;height:300px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>真实姓名：</td>
	 				<td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>用户名：</td>
	 				<td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>密码：</td>
	 				<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>性别：</td>
	 				<td>
	 					<select class="easyui-combobox" id="sex" name="sex" style="width: 154px;" editable="false" panelHeight="auto">
	 						<option value="">请选择性别</option>
	 						<option value="男">男</option>
	 						<option value="女">女</option>
	 					</select>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>出生日期：</td>
	 				<td><input type="text" id="birthday" name="birthday" class="easyui-datebox" editable="false" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>身份证：</td>
	 				<td><input type="text" id="identityCode" name="identityCode" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>邮件：</td>
	 				<td><input type="text" id="email" name="email" class="easyui-validatebox" validType="email" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>联系电话：</td>
	 				<td><input type="text" id="mobile" name="mobile" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>收货地址：</td>
	 				<td colspan="4">
	 					<input type="text" id="address" name="address" class="easyui-validatebox" required="true" style="width: 350px;"/>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>