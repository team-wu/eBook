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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/ckeditor5-build-classic/ckeditor.js"></script>
<script type="text/javascript">
var url;
var editor;
function openTagAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加标签");
	 url="${pageContext.request.contextPath}/admin/tag/save.do";
}

function closeTagDialog(){
	$("#dlg").dialog("close");
	 resetValue();
}

function saveTag(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	 });
	
}

function openTagModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#orderNo").numberbox("setValue",row.orderNo);
	 $("#dlg").dialog("open").dialog("setTitle","编辑标签信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/admin/tag/save.do?id="+row.id;
}
function deleteTag(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/admin/tag/delete.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功删除！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","删除失败");
					$("#dg").datagrid("reload");
				}
			},"json");
		} 
	 });
}
function resetValue(){
	 $("#name").val("");
	 $("#url").val("");
	 $("#orderNo").numberbox("setValue","");
}
function searchTag(){
	$("#dg").datagrid("load",{
		name:$("#s_tagName").val()
	});
}
$(function(){
	
});

</script>
</head>
<body>
	<table id="dg" title="标签管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/admin/tag/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="name" width="150" align="center">名称</th>
	 		<th field="url" width="150" align="center">URL</th>
	 		<th field="orderNo" width="150" align="center">排序号</th>
	 	</tr>
	 </thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openTagAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openTagModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteTag()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;标签名称：&nbsp;<input type="text" id="s_tagName" size="20" onkeydown="if(event.keyCode==13) searchTag()"/>
			<a href="javascript:searchTag()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 800px;height:250px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>标签名称：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>标签URL：</td>
	 				<td><input type="text" id="url" name="url" class="easyui-validatebox" required="true" style="width: 600px"/></td>
	 			</tr>
	 			<tr>
	 				<td>排序号：</td>
	 				<td><input type="text" id="orderNo" name="orderNo" class="easyui-numberbox" data-options="min:0,precision:0" style="width: 300px"></input></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveTag()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeTagDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>