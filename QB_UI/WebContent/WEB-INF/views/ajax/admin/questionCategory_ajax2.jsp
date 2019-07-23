<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<c:forEach items="${list2}" var="mdCategoryList">
		<tr>
			<td class="md_category_code">${mdCategoryList.md_category_code}</td>
			<td class="md_category_name">${mdCategoryList.md_category_name}</td>
			<td>
				<button type="button" class="btn btn-theme md" id="updatebtnmd"
					name="updatebtnmd" data-toggle="modal" data-target="#UpdateMdModal" 
					value="${mdCategoryList.md_category_code}" >
					<i class="fa fa-pencil"></i>
				</button>
				<button type="button" class="btn btn-danger" id="deletebtnmd"
					name="deletebtnmd">
					<i class="fa fa-trash-o"></i>
				</button>
			</td>
		</tr>
	</c:forEach>
<script>
$("button[name='updatebtnmd']").click(function(){ 
	ction='modify';
	type='PUT';
	var row =$(this).parent().parent();
	var tr = row.children();
 	var mdCatCode_modal=tr.eq(0).text();
	var mdCatName_modal=tr.eq(1).text();
	$('#mdCode').val(mdCatCode_modal);
	$('#mdName').val(mdCatName_modal);
	$('#updateMdBtn').val(mdCatName_modal);
	<c:forEach items="${list2}" var="mdCategoryList">
	if(mdCatCode_modal == "${mdCategoryList.md_category_code}"){
		var lgSelectCode = "${mdCategoryList.lg_category_code}";
	}
	</c:forEach>
	$('#UpdateSelectLgCatSearch').val(lgSelectCode);
});
</script>