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
function openBigTypeAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加书籍大类");
	 url="${pageContext.request.contextPath}/admin/bigType/save.do";
}

function closeBigTypeDialog(){
	$("#dlg").dialog("close");
	 resetValue();
}

function saveBigType(){
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

function openBigTypeModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 editor.setData(row.remarks);
	 $("#dlg").dialog("open").dialog("setTitle","编辑大类信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/admin/bigType/save.do?id="+row.id;
}
function deleteBigType(){
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
			$.post("${pageContext.request.contextPath}/admin/bigType/delete.do",{ids:ids},function(result){
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
	 //var CKEditor = ClassicEditor.replace('remarks')
	 editor.setData("");
}
function searchBigType(){
	$("#dg").datagrid("load",{
		name:$("#s_bigTypeName").val()
	});
}
$(function(){
	
});

</script>
</head>
<body>
	<table id="dg" title="书籍大类管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/admin/bigType/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="name" width="150" align="center">名称</th>
	 		<th field="remarks" width="150" align="center">描述</th>
	 	</tr>
	 </thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openBigTypeAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openBigTypeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteBigType()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;书籍大类名称：&nbsp;<input type="text" id="s_bigTypeName" size="20" onkeydown="if(event.keyCode==13) searchBigType()"/>
			<a href="javascript:searchBigType()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:350px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>书籍大类名称：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td valign="top">简介：</td>
	 				<td colspan="2">
	 					<textarea name="remarks" id="remarks">
					        <p>请填写描述...</p>
					    </textarea>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveBigType()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeBigTypeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<script>
	ClassicEditor.create( document.querySelector('#remarks'))
	.then( 
		editor1 => {
			editor=editor1
        //console.log( 'Editor was initialized', editor1 )
    });
    </script>
</body>
</html>