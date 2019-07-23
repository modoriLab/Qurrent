<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:forEach items="${list3}" var="smCategoryList">
		<tr>
			<td class="sm_category_code">${smCategoryList.sm_category_code}</td>
			<td class="sm_category_name">${smCategoryList.sm_category_name}</td>
			<td>
				<button type="button" class="btn btn-theme" id="updatebtnsm"
					name="updatebtnsm" data-toggle="modal" data-target="#UpdateSmModal">
					<i class="fa fa-pencil"></i>
				</button>
				<button type="button" class="btn btn-danger" id="deletebtnsm"
					name="deletebtnsm">
					<i class="fa fa-trash-o"></i>
				</button>
			</td>
		</tr>
	</c:forEach>
<script>
$("button[name='updatebtnsm']").click(function(){
	action='modify';
	type='PUT';
	var row =$(this).parent().parent();
	var tr = row.children();
 	var smCatCode_modal=tr.eq(0).text();
	var smCatName_modal=tr.eq(1).text();
	$('#smCode').val(smCatCode_modal);
	$('#smName').val(smCatName_modal);
	$('#updateSmBtn').val(smCatName_modal);
	<c:forEach items="${list3}" var="smCategoryList">
	if(smCatCode_modal == "${smCategoryList.sm_category_code}"){
		var mdSelectCode = "${smCategoryList.md_category_code}";
	}
	</c:forEach>
	$('#UpdateSelectMdCatSearch').val(mdSelectCode);
});
</script>