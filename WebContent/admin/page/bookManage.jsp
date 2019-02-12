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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/uploadPreview.min.js"></script>
<script type="text/javascript">
var url;
var editor_mulu;
var editor_description;
function formatSmallTypeName(val,row){
	return row.smallType.name;
}

function formatBigTypeId(val,row){
	
}

function formatSlide(val,row){
	if (val==0) {
		return "否";
	} else if (val==1){
		return "是";
	}
}

function formatPrice(val,row){
	//return changeTwoDecimal_f(val);
	return val.toFixed(2);
}

function changeTwoDecimal_f(x) {
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(x * 100) / 100;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0) {
        pos_decimal = s_x.length;
        s_x += '.';
    }
    while (s_x.length <= pos_decimal + 2) {
        s_x += '0';
    }
    return s_x;
}

function picFormat(val,row){
	return "<img width=100 height=100 src='${pageContext.request.contextPath}/"+val+"'></img>";
}

function openBookAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加书籍");
	 url="${pageContext.request.contextPath}/admin/book/save.do";
}

function openBookModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑书籍信息");
	 $("#publishTime").datebox("setValue",row.publishTime);
	 
	 $("#bigTypeId").combobox("setValue",row.smallType.bigType.id);
	 
	 $('#smallTypeId').combobox('reload', '${pageContext.request.contextPath}/admin/smallType/comboList.do?bigTypeId='+row.smallType.bigType.id);
	 $("#smallTypeId").combobox("setValue",row.smallType.id);
	 
	 editor_mulu.setData(row.mulu);
	 editor_description.setData(row.description);
	 
	 $("#ImgPr").attr("src","${pageContext.request.contextPath}/"+row.pic);
	 $("#fm").form("load",row);
	 
	 url="${pageContext.request.contextPath}/admin/book/save.do?id="+row.id;
}

function saveBook(){
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

function deleteBook(){
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
			$.post("${pageContext.request.contextPath}/admin/book/delete.do",{ids:ids},function(result){
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

function closeBookDialog(){
	$("#dlg").dialog("close");
	 resetValue();
}

function resetValue(){
	$("#name").val("");
	$("#author").val("");
	$("#press").val("");
	$("#isbn").val("");
	$("#kaiben").val("");
	$("#bigTypeId").combobox("setValue","");
	$("#smallTypeId").combobox("setValue","");
	$("#publishTime").datebox("setValue","");
	$("#price").numberbox("setValue","");
	$("#yeshu").numberbox("setValue","");
	$("#zishu").numberbox("setValue","");
	$("#stock").numberbox("setValue","");
	$("#slide").combobox("setValue","0");
	editor_description.setData("");
	editor_mulu.setData("");
	
	$("#pP").val("");
	$("#ImgPr").attr("src","");
}

function searchBook(){
	$("#dg").datagrid("load",{
		"name":$("#s_bookName").val(),
		"author":$("#s_author").val(),
		"isbn":$("#s_isbn").val(),
		"press":$("#s_press").val(),
		"slide":$("#s_slide").combobox("getValue")
	})
}

$(function(){
	$("#pP").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
});

</script>
</head>
<body>
	<table id="dg" title="书籍管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/admin/book/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="pic" width="120" align="center" formatter="picFormat">封皮</th>
	 		<th field="name" width="100" align="center">书名</th>
	 		<th field="author" width="100" align="center">作者</th>
	 		<th field="isbn" width="100" align="center">ISBN</th>
	 		<th field="price" width="50" align="center" formatter="formatPrice">价格</th>
	 		<th field="press" width="100" align="center">出版社</th>
	 		<th field="publishTime" width="100" align="center">出版时间</th>
	 		<th field="kaiben" width="100" align="center">开本</th>
	 		<th field="yeshu" width="100" align="center">页数</th>
	 		<th field="zishu" width="100" align="center">字数</th>
	 		<th field="stock" width="100" align="center">库存</th>
	 		<th field="smallType.name" width="100" align="center" formatter="formatSmallTypeName">所属书籍小类名称</th>
	 		<th field="mulu" width="100" align="center" formatter="formatBigTypeId" hidden="true">书籍目录</th>
	 		<th field="description" width="100" align="center" hidden="true">书籍描述</th>
	 		<th field="smallType.id" width="100" align="center" hidden="true">所属书籍小类ID</th>
	 		<th field="slide" width="100" align="center" formatter="formatSlide">是否轮播</th>
	 	</tr>
	 </thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openBookAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openBookModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteBook()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;书名：&nbsp;<input type="text" id="s_bookName" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>
			&nbsp;作者：&nbsp;<input type="text" id="s_author" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>
			&nbsp;isbn：&nbsp;<input type="text" id="s_isbn" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>
			&nbsp;出版社：&nbsp;<input type="text" id="s_press" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>
			&nbsp;轮播：&nbsp;<select id="s_slide" class="easyui-combobox" style="width:100px;">   
							    <option value="">请选择...</option>   
							    <option value="0">否</option>   
							    <option value="1">是</option>   
							</select>
			<a href="javascript:searchBook()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 900px;height:500px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post" enctype="multipart/form-data">
	 		<table cellspacing="8px">
	 			<tr style="height: 40px;">
		  			<td>封皮图片 ：</td>
		  			<td colspan="2"><input type="file" id="pP" name="file"></input></td>
					<td>图片预览：</td>
					<td><div style=" width:100px; height:120px;"><img id="ImgPr" width="120" height="120"/></div></td>
		  		</tr>
	 			<tr>
	 				<td style="width: 80px;">书名：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td style="width: 80px;">作者：</td>
	 				<td><input type="text" id="author" name="author" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>ISBN：</td>
	 				<td><input type="text" id="isbn" name="isbn" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>价格：</td>
	 				<td><input type="text" id="price" name="price" class="easyui-numberbox" data-options="min:0,precision:2" style="width: 305px"></input>  </td>
	 			</tr>
	 			<tr>
	 				<td>出版社：</td>
	 				<td><input type="text" id="press" name="press" class="easyui-validatebox" required="true" style="width: 305px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>出版时间：</td>
	 				<td><input id="publishTime" name="publishTime" type= "text" class= "easyui-datebox" required ="required" style="width: 300px"> </input></td>
	 			</tr>
	 			<tr>
	 				<td>开本：</td>
	 				<td><input type="text" id="kaiben" name="kaiben" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>所属大类：</td>
	 				<td>
	 					<input id="bigTypeId" class="easyui-combobox" style="width: 305px" 
    						data-options="valueField:'id',
			    						textField:'name',
			    						editable:false,
			    						url:'${pageContext.request.contextPath}/admin/bigType/comboList.do',
			    						onSelect:function(rec){
						  					var url='${pageContext.request.contextPath}/admin/smallType/comboList.do?bigTypeId='+rec.id;
						  					$('#smallTypeId').combobox('reload', url);
						  					$('#smallTypeId').combobox('setValue','');
						  				}" /> 
			    	</td>
	 			</tr>
	 			<tr>
	 				<td>所属小类：</td>
	 				<td><input id="smallTypeId" class="easyui-combobox" name="smallType.id" style="width: 305px" 
    						data-options="valueField:'id',
			    						textField:'name',
			    						editable:false,
			    						" />
			    	</td>
			    	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>是否轮播：</td>
	 				<td>
	 					<select id="slide" class="easyui-combobox" name="slide" style="width:305px;">   
						    <option value="0">否</option>   
						    <option value="1">是</option>   
						</select>  
					</td>
	 			</tr>
	 			<tr>
	 				<td>页数：</td>
	 				<td><input type="text" id="yeshu" name="yeshu" class="easyui-numberbox" data-options="min:0,precision:0" required="true" style="width: 300px"></input></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>字数：</td>
	 				<td><input type="text" id="zishu" name="zishu" class="easyui-numberbox" data-options="min:0,precision:0" required="true" style="width: 305px"></input></td>
	 			</tr>
	 			<tr>
	 				<td>库存：</td>
	 				<td><input type="text" id="stock" name="stock" class="easyui-numberbox" data-options="min:0,precision:0" required="true" style="width: 300px"></input></td>
	 			</tr>
	 			<tr>
	 				<td valign="top">目录：</td>
	 				<td colspan="4">
	 					<textarea name="mulu" id="editor_mulu">
					        <p>请编辑目录...</p>
					    </textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">简介：</td>
	 				<td colspan="4">
	 					<textarea name="description" id="editor_description" >
					        <p>请填写简介...</p>
					    </textarea>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveBook()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeBookDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<script>
	ClassicEditor
	.create( document.querySelector( '#editor_description' ),{height : 200, width : 500 } )
	.then( 
		editor1 => {
			editor_description=editor1
        //console.log( 'Editor was initialized', editor1 )
    });
	ClassicEditor
	.create( document.querySelector( '#editor_mulu' ) )
	.then( 
		editor2 => {
			editor_mulu=editor2
        //console.log( 'Editor was initialized', editor1 )
    });
    </script>
</body>
</html>