<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/adminCategory.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<!-- 모달창 시작 -->
			<!-- 대분류 추가 모달창 시작-->
			<div class="modal fade" id="lgCatModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div id="lgCatModalPop" class="modal-content">
						<div class="modal-header insertHeader">
							대분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<div id="lgCatAddForm" class="form-group">
								<label for="lgCatAdd">대분류 이름</label> <input type="text"
									class="form-control insertsize" name="lgCatAdd" id="lgCatAdd"
									placeholder="대분류 이름을 입력해주세요  [ 길이 제한은 12글자입니다  ]" maxlength="12">
								<button type="button" data-dismiss="modal" class="btn btn-secondary modalButton">취소</button>
								<button type="button" class="btn btn-theme modalButton" id="lgCatAddBtn">등록</button>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 대분류 추가 모달창 끝 -->

			<!-- 중분류 추가 모달창 시작 -->
			<div class="modal fade" id="mdCatModal" role="dialog">
				<div class="modal-dialog">
					<!--  Modal content -->
					<div id="mdCatModalPop" class="modal-content">
						<div class="modal-header insertHeader">
							중분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<label><span class="hidden-xs">상위 대분류 선택</span> </label>
							<div class="form-inline">
								<select class="form-control" id="selectLgCategory">
									<option value="">대분류를 선택해주세요.</option>
								<c:forEach items="${list1}" var="lgCategoryList">
									<option>${lgCategoryList.lg_category_name}</option>
								</c:forEach>
								</select>
							</div>

							<div id="mdCatAddForm" class="form-group">

								<label for="mdCatAdd">중분류 이름</label> <input type="text"
									class="form-control insertsize" name="mdCatAdd"
									placeholder="중분류 이름을 입력해주세요  [ 길이 제한은 12글자입니다  ]" id="mdCatAdd" maxlength="12">
								<button type="button" data-dismiss="modal" class="btn btn-secondary modalButton">취소</button>
								<button type="button" class="btn btn-theme modalButton" id="mdCatAddBtn">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div> 
			<!-- 중분류 추가 모달창 끝 -->

			<!-- 소분류 추가 모달창 시작 -->
			<div class="modal fade" id="smCatModal" role="dialog">
				<div class="modal-dialog">
					<!--  Modal content -->
					<div id="smCatModalPop" class="modal-content">
						<div class="modal-header insertHeader">
							소분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<label><span class="hidden-xs">상위 중분류 선택</span></label>
							<div class="form-inline">
								<select class="form-control" id="selectMdCategory">
									<option value="">중분류를 선택해주세요.</option>
								<c:forEach items="${list2}" var="mdCategoryList">
									<option>${mdCategoryList.md_category_name}</option>
								</c:forEach>
								</select>
							</div>

							<div id="smCatAddForm" class="form-group">

								<label for="smCatAdd">소분류 이름</label> <input type="text"
									class="form-control insertsize" name="smCatAdd"
									placeholder="소분류 이름을 입력해주세요  [ 길이 제한은 12글자입니다  ]"  id="smCatAdd" maxlength="12">
								<button type="button" data-dismiss="modal" class="btn btn-secondary modalButton">취소</button>
								<button type="button" id="smCatAddBtn" class="btn btn-theme modalButton">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 소분류 추가 모달창 끝 -->
			
			<!-- 대분류 수정 모달창  -->
			<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<div class="modal-title updateHeader" id="myModalLabel">대분류 정보 수정</div>
						</div>
						<div class="modal-body">
							<div class="form-panel">
								<div class=" form">
									<form class="cmxform form-horizontal style-form"
										id="commentForm" method="get" action="">
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">대분류 코드</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_id" maxlength="12" value="" readonly  id="lgCode">
											</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">대분류 이름</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_name" maxlength="12" value="" id="lgName">
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" type="button" id="updateLgBtn" value="">수정</button>
													<button class="btn btn-theme04" type="button"
														data-dismiss="modal">취소</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 대분류 수정 모달창 끝 -->
			<!-- 중분류 수정 모달창  -->
			<div class="modal fade" id="UpdateMdModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<div class="modal-title updateHeader" id="myModalLabel">중분류 정보 수정</div>
						</div>
						<div class="modal-body">
							<div class="form-panel">
								<div class=" form">
									<form class="cmxform form-horizontal style-form"
										id="commentForm" method="get" action="">
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">대분류 이름</label>
										<div class="col-lg-9">
											<select class="form-control selectCategory" id="UpdateSelectLgCatSearch">
												<option value="">대분류 검색</option>
											<c:forEach items="${list1}" var="lgCategoryList">
												<option value="${lgCategoryList.lg_category_code}">${lgCategoryList.lg_category_name}</option>
											</c:forEach>
											</select>
										</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">증분류 코드</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_id" maxlength="12" value="" readonly  id="mdCode">
											</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">중분류 이름</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_name" maxlength="12" value="" id="mdName">
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" type="button" id="updateMdBtn" value="">수정</button>
													<button class="btn btn-theme04" type="button"
														data-dismiss="modal">취소</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 중분류 수정 모달창 끝 -->
			
			<!-- 소분류 수정 모달창 시작 -->
			<div class="modal fade" id="UpdateSmModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<div class="modal-title updateHeader" id="myModalLabel">소분류 정보 수정</div>
						</div>
						<div class="modal-body">
							<div class="form-panel">
								<div class=" form">
									<form class="cmxform form-horizontal style-form"
										id="commentForm" method="get" action="">
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">중분류 이름</label>
										<div class="col-lg-9">
											<select class="form-control selectCategory" id="UpdateSelectMdCatSearch">
												<option value="">중분류 검색</option>
											<c:forEach items="${list2}" var="mdCategoryList">
												<option value="${mdCategoryList.md_category_code}">${mdCategoryList.md_category_name}</option>
											</c:forEach>
											</select>
										</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">소분류 코드</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_id" maxlength="12" value="" readonly  id="smCode">
											</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-3">소분류 이름</label>
											<div class="col-lg-9">
											<input class="form-control" type="text"  name="member_name" maxlength="12" value="" id="smName">
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" type="button" id="updateSmBtn" value="updateSmBtn">수정</button>
													<button class="btn btn-theme04" type="button"
														data-dismiss="modal">취소</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		<!-- 소분류 수정 모달창 끝 -->	
		
		<!-- 대분류 삭제 모달창 시작 -->	
		
			<!-- 소분류 삭제 모달창 끝 -->
			
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-body">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;문제 분류 관리
							</h4>
						</header>
						<div class="col-lg-4 a"></div><div class="col-lg-4 a"></div>
						<div class="col-lg-4 a"><button type="button" class="btn btn-theme" id="resetBtn"><i class="fa fa-search-plus"></i>&nbsp;&nbsp;초기화 [전체조회]</button></div>
							<div class="col-lg-4">
								<h3 class="table_heading" align="center">대분류</h3>
								<select class="form-control selectCategory" id="selectLgCatSearch" onchange="selectLgCatSearch()">
									<option value="">대분류 검색</option>
								<c:forEach items="${list1}" var="lgCategoryList">
									<option value="${lgCategoryList.lg_category_code}">${lgCategoryList.lg_category_name}</option>
								</c:forEach>
								</select>
								<button type="button" class="btn btn-theme add"
									data-toggle="modal" data-target="#lgCatModal">대분류 추가</button>
								 <table id="table_lgCategory">
									<thead>
										<tr>
											<th class="thwidth1">대분류<br>코드</th>
											<th class="thwidth2">대분류<br>[언어]</th>
											<th class="thwidth3">관리</th>
										</tr>
									</thead>
									<tbody id="list1body">
									 <c:forEach items="${list1}" var="lgCategoryList">
											<tr class="trBottom">
												<td class="lg_category_code">${lgCategoryList.lg_category_code}</td>
												<td class="lg_category_name">${lgCategoryList.lg_category_name}</td>
												<td>
													<button type="button" class="btn btn-theme" name="updatebtnlg"
													data-toggle="modal" data-target="#UpdateModal" value="${lgCategoryList.lg_category_code}">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" class="btn btn-danger" id="deletebtnlg" name="deletebtnlg"
													value="">
														<i class="fa fa-trash-o"></i>
													</button>
												</td>
											</tr>
										</c:forEach> 
									</tbody>
								</table>
							</div>

							<div class="col-lg-4">
								<h3 class="table_heading" align="center">중분류</h3>
								<select class="form-control selectCategory" id="selectMdCatSearch" onchange="selectMdCatSearch()">
									<option value="">중분류 검색</option>
								</select>
								<button type="button" class="btn btn-theme add"
									data-toggle="modal" data-target="#mdCatModal">중분류 추가</button>
								<table id="table_mdCategory">
									<thead>
										<tr>
											<th class="thwidth1">중분류<br>코드</th>
											<th class="thwidth2">중분류<br>[과목]</th>
											<th class="thwidth3">관리</th>
										</tr>
									</thead>
									<tbody id="list2body">
										 <c:forEach items="${list2}" var="mdCategoryList">
											<tr>
												<td class="md_category_code">${mdCategoryList.md_category_code}</td>
												<td class="md_category_name">${mdCategoryList.md_category_name}</td>
												<td>
													<button type="button" class="btn btn-theme" id="updatebtnmd" name="updatebtnmd"
													data-toggle="modal" data-target="#UpdateMdModal">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" class="btn btn-danger" id="deletebtnmd" name="deletebtnmd"
													value="">
														<i class="fa fa-trash-o"></i>
													</button>
												</td>
											</tr>
										</c:forEach> 
									</tbody>
								</table>
								</div>
							

							<div class="col-lg-4">
								<h3 class="table_heading" align="center">소분류</h3>
								<select class="form-control selectCategory" id="selectSmCatSearch" onchange="selectSmCatSearch()">
									<option value="">소분류 검색</option>
								</select>
								<button type="button" class="btn btn-theme add"
									data-toggle="modal" data-target="#smCatModal">소분류 추가</button>
								<table id="table_smCategory">
									<thead>
										<tr>
											<th class="thwidth1">소분류<br>코드</th>
											<th class="thwidth2">소분류<br>[주제]</th>
											<th class="thwidth3">관리</th>
										</tr>
									</thead>
									<tbody id="list3body">
										 <c:forEach items="${list3}" var="smCategoryList">
											<tr>
												<td class="sm_category_code">${smCategoryList.sm_category_code}</td>
												<td class="sm_category_name">${smCategoryList.sm_category_name}</td>
												<td>
													<button type="button" class="btn btn-theme" id="updatebtnsm" name="updatebtnsm"
													data-toggle="modal" data-target="#UpdateSmModal">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" class="btn btn-danger" id="deletebtnsm" name="deletebtnsm"
													value="">
														<i class="fa fa-trash-o"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						
					</div>
					<!-- /panel-heading -->
				</div>
				<!-- /row content-panel -->
			</div>
			<!-- /col-lg-12 -->
		</div>
		<!-- /row-mt -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /main-content -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@문제 카테고리 추가 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
$('#lgCatAddBtn').click(function(){
	if($('#lgCatAdd').val().length > 12) {
		swal("대분류의 이름이 글자 제한수를 넘었습니다", "12글자 이내로 입력해주세요", "error");
	}else{
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/admin/lgCatAdd.do',
		global:false,
		data:{lgCatAdd:$('#lgCatAdd').val()},
		dataType:'json',
		success:function(data){
			if(data.result == "중복"){
				swal("중복된 이름이 있습니다", "다른 이름을 사용하여 추가해주세요", "error");
			}else if(data.result == "null"){
				swal("필수입력사항입니다","반드시 선택해주세요","error");
			}else{
				swal({
				       title: "대분류가 추가되었습니다",
					   text: "",
					   icon:"success"
					}).then(function() {
					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
					});
			}	
			},
		error:function(error){
			alert("에러");
		}
	});
	}
});

$('#mdCatAddBtn').click(function(){
	if($('#mdCatAdd').val().length > 12) {
		swal("중분류의 이름이 글자 제한수를 넘었습니다", "12글자 이내로 입력해주세요", "error");
	}else{
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/admin/mdCatAdd.do',
		global:false,
		data:{selectLgCat:$('#selectLgCategory option:selected').val(), mdCatAdd:$('#mdCatAdd').val() },
		dataType:'json',
		success:function(data){
			if(data.result == "중복"){
				swal("중복된 이름이 있습니다", "다른 이름을 사용하여 추가해주세요", "error");
			}else if(data.result == "null"){
				swal("필수 입력사항입니다","대분류를 선택해주세요","error");
			}else if(data.result == "textNull"){
				swal("필수입력사항입니다","중분류 이름을 입력해주세요","error"); 
			}else{
				swal({
				       title: "중분류 가 추가되었습니다",
					   text: "",
					   icon:"success"
					}).then(function() {
					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
					});
			}
			},
		error:function(error){
			alert("에러");
		}
	});
	}
});

$('#smCatAddBtn').click(function(){
	if($('#smCatAdd').val().length > 12) {
		swal("소분류의 이름이 글자 제한수를 넘었습니다", "12글자 이내로 입력해주세요", "error");
	}else{
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/admin/smCatAdd.do',
		global:false,
		data:{selectMdCat:$('#selectMdCategory option:selected').val(), smCatAdd:$('#smCatAdd').val() },
		success:function(data){
			if(data.result == "중복"){
				swal("중복된 이름이 있습니다", "다른 이름을 사용하여 추가해주세요", "error");
			}else if(data.result == "null"){
				swal("필수 입력사항입니다","중분류를 선택해주세요","error");
			}else if(data.result == "textNull"){
				swal("필수입력사항입니다","소분류 이름을 입력해주세요","error"); 
			}else{
				swal({
				       title: "소분류 가 추가되었습니다",
					   text: "",
					   icon:"success"
					}).then(function() {
					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
					});
			}
			},
		error:function(error){
			alert("에러");
		}
	});
	}
	});

/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@문제 카테고리 추가  끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/

/* @@@@@@@@@@@@@@@@@@@@@@카테고리(대분류,중분류,소분류 선택시 차례대로 해당 카테고리로 바뀌고 테이블도 같이 변경) 시작 @@@@@@@@@@@@@@@@@@@@*/
function selectLgCatSearch(){
	$('#list2body').children().remove();
	$('#list3body').children().remove();
		$('#selectMdCatSearch').children('option:not(:first)').remove();
		$('#selectSmCatSearch').children('option:not(:first)').remove();
			<c:forEach items="${list2}" var="mdCategoryList">
				if(document.getElementById("selectLgCatSearch").value == "${mdCategoryList.lg_category_code}"){
					$('#selectMdCatSearch').append("<option value=${mdCategoryList.md_category_code}>${mdCategoryList.md_category_name}</option>")
				}
			</c:forEach>
			$.ajax({
	   			  type : "post",
	   			  url : "${pageContext.request.contextPath}/admin/selectLgList.do",
	   			  global:false,
	   			  data:{lgCode:$('#selectLgCatSearch').val()},
	   			  dataType:"html",
	   			  success : function(data){
	   					$('#list1body').html(data); 
	   				 	$.ajax({
	   						type:"post",
	   						url:"${pageContext.request.contextPath}/admin/selectMdList.do",
	   						global:false,
	   				 		data:{lgCode:$('#selectLgCatSearch').val()},
	   				 		dataType:"html",
	   				 		success:function(data){
	   				 			$('#list2body').html(data);
			   				 		$.ajax({
				   						type:"post",
				   						url:"${pageContext.request.contextPath}/admin/selectSmList.do",
				   						global:false,
				   				 		data:{lgCode:$('#selectLgCatSearch').val()},
				   				 		dataType:"html",
				   				 		success:function(data){
				   				 			$('#list3body').html(data);
				   				 		}
				   				 	});
	   				 		}
	   				 	});
	   			  },
	   			  error: function(error){
	   				  alert("에러야!");
	   			 }
	   		});	
}

function selectMdCatSearch(){
	$('#list3body').children().remove();
	$('#selectSmCatSearch').children('option:not(:first)').remove();
		<c:forEach items="${list3}" var="smCategoryList">
			if(document.getElementById("selectMdCatSearch").value == "${smCategoryList.md_category_code}"){
				$('#selectSmCatSearch').append("<option value=${smCategoryList.sm_category_code}>${smCategoryList.sm_category_name}</option>")
			}
		</c:forEach>
			$('#list2body').children().remove();
			$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/admin/selectMdRealList.do",
					global:false,
			 		data:{mdCode:$('#selectMdCatSearch').val()},
			 		dataType:"html",
			 		success:function(data){
			 			$('#list2body').html(data);
				 			$.ajax({
								type:"post",
								url:"${pageContext.request.contextPath}/admin/selectSmRealList.do",
								global:false,
						 		data:{mdCode:$('#selectMdCatSearch').val()},
						 		dataType:"html",
						 		success:function(data){
						 			$('#list3body').html(data);
						 		}
				 		});
			 		}
			});
		}
		function selectSmCatSearch(){
				$('#list3body').children().remove();
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/admin/selectSmRealList2.do",
					global:false,
			 		data:{smCode:$('#selectSmCatSearch').val()},
			 		dataType:"html",
			 		success:function(data){
			 			$('#list3body').html(data);
			 		}
	 		});
}
/* @@@@@@@@@@@@@@@@@@@@@@카테고리(대분류,중분류,소분류 선택시 차례대로 해당 카테고리로 바뀌고 테이블도 같이 변경) 끝 @@@@@@@@@@@@@@@@@@@@*/
 

/* @@@@@@@@@@@@@@@@@@@@@@@@@@수정 버튼 클릭 시 모달창 띄우고 해당 값 가져와서 수정 (전체조회시에만) 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
	$("button[name='updatebtnlg']").click(function(){
		action='modify';
		type='PUT';
		var row =$(this).parent().parent();
		var tr = row.children();
		var lgCatCode_modal=tr.eq(0).text();
		var lgCatName_modal=tr.eq(1).text();
		$('#lgCode').val(lgCatCode_modal);
		$('#lgName').val(lgCatName_modal);
		$('#updateLgBtn').val(lgCatName_modal);
	});
	
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

/* @@@@@@@@@@@@@@@@@@@@@@@@@@수정 버튼 클릭 시 모달창 띄우고 해당 값 가져와서 수정 (전체조회시에만) 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */	
	
/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@카테고리 선택시 수정할 때 값 가져오기(상세조회시에) 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
	
	
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@해당 값들 가져와서 db에서 수정 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	$('#updateLgBtn').click(function() {
		var lgChkName = $('#lgName').val();
		var lgBeforeName = $('#updateLgBtn').val();
		if(lgChkName == ""){
			swal("필수 입력사항입니다", "대분류 이름을 입력해주세요", "error");
		}else{
		$.ajax({
   			  type : "post",
   			  url : "${pageContext.request.contextPath}/admin/lgUpdate.do",
   			  data:{lgCatCode:$('#lgCode').val(), lgCatName:$('#lgName').val(), lgBeforeName:$('#updateLgBtn').val()},  
   			  success : function(data){
   				 if(data.result =="Notnull"){
   					swal("중복된 이름이 있습니다", "다른 이름을 사용하여 수정해주세요", "error");
   				 }else{
   					swal({
   					    title: "대분류 정보가 수정되었습니다",
   					    text: "",
   					    icon:"success"
   					}).then(function() {
   					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
   					});
   				 }	   			 
   				 },
   			  error: function(error){
   				  alert("에러야!");
   			 }
   		});
		}	
	});	
	
	$('#updateMdBtn').click(function() {
		var mdChkName = $('#mdName').val();
		var lgSelectName = $('#UpdateSelectLgCatSearch').val();
		var mdBeforeName = $('#updateMdBtn').val();
		if(lgSelectName ==""){
			swal("필수 입력사항입니다", "대분류를 선택해세요", "error");
		}else if(mdChkName == ""){
			swal("필수 입력사항입니다", "중분류 이름을 입력해주세요", "error");
		}
		else{
		$.ajax({
   			  type : "post",
   			  url : "${pageContext.request.contextPath}/admin/mdUpdate.do",
   			  global:false,
   			  data:{mdCatCode:$('#mdCode').val(), mdCatName:$('#mdName').val(),lgSelectCode:$('#UpdateSelectLgCatSearch').val(),mdBeforeName:$('#updateMdBtn').val()},  
   			  success : function(data){
   				 if(data.result =="Notnull"){
   					swal("중복된 이름이 있습니다", "다른 이름을 사용하여 수정해주세요", "error");
   				 }else{
   					swal({
   					    title: "중분류 정보가 수정되었습니다",
   					    text: "",
   					    icon:"success"
   					}).then(function() {
   					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
   					});
   				 }	   			 
   				 },
   			  error: function(error){
   				  alert("에러야!");
   			 }
   		});
		}	
	});
	
	$('#updateSmBtn').click(function() {
		var smChkName = $('#smName').val();
		var mdSelectName = $('#UpdateSelectMdCatSearch').val();
		var smBeforeName = $('#updateSmBtn').val();
		if(mdSelectName ==""){
			swal("필수 입력사항입니다", "중분류를 선택해세요", "error");
		}else if(smChkName == ""){
			swal("필수 입력사항입니다", "소분류 이름을 입력해주세요", "error");
		}
		else{
		$.ajax({
   			  type : "post",
   			  url : "${pageContext.request.contextPath}/admin/smUpdate.do",
   			  global:false,
   			  data:{smCatCode:$('#smCode').val(), smCatName:$('#smName').val(),mdSelectCode:$('#UpdateSelectMdCatSearch').val(), smBeforeName:$('#updateSmBtn').val()},  
   			  success : function(data){
   				 if(data.result =="Notnull"){
   					swal("중복된 이름이 있습니다", "다른 이름을 사용하여 수정해주세요", "error");
   				 }else{
   					swal({
   					    title: "소분류 정보가 수정되었습니다",
   					    text: "",
   					    icon:"success"
   					}).then(function() {
   					    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
   					});
   				 }	   			 
   				 },
   			  error: function(error){
   				  alert("에러야!");
   			 }
   		});
		}
	});
	
	
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@해당 값들 가져와서 db에서 수정 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/

	$(document).on('click','#deletebtnlg',function(){
		var row =$(this).parent().parent();
		var tr = row.children();
	 	var lgDeleteCode=tr.eq(0).text();
	 	$('#deletebtnlg').val(lgDeleteCode);
	 	<c:forEach items="${list2}" var="mdCategoryList">
		if(document.getElementById("deletebtnlg").value == "${mdCategoryList.lg_category_code}"){
			result = "false"; 
		}else{
			result = "true";
		}
		</c:forEach>
		swal({
			  title:"이 문제를 삭제 하시겠습니까? ",
			  text: "해당 대분류를 참조하는 \n " +
				  "중분류가 있을 경우, " +
				  "해당 대분류를 삭제할 수 없습니다. \n \n"
				  ,
			  icon: "warning",
			  buttons: true,
			})	 	
			.then((willUpdate) => {
				  if (willUpdate) {
					  if(result == "false"){
							swal("해당 정보를 참조받는 중분류 정보가 존재합니다", "하위 정보를 삭제 후 다시 시도해주세요", "error");
						}else{
							$.ajax({
								  type : "post",
								  url : "${pageContext.request.contextPath}/admin/lgDelete.do",
								  data:{lgDeleteCode:$('#deletebtnlg').val()},
								  global:false,
								  success : function(data){
									  if((data.result)=="삭제가능"){
											swal({
										       title: "해당 대분류가 삭제되었습니다",
											   text: "",
											   icon:"success"
											}).then(function() {
											    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
											});
										  }else{
											  swal("해당 정보를 참조받는 문제 정보가 존재합니다", "하위 정보를 삭제 후 다시 시도해주세요", "error");
										  }
								  },
								  error: function(error){
									  alert("에러야!");
								 }
							});
						}
					  } else {
					    swal("문제 삭제가 취소되었습니다.");
					  }
					  
					  
					
					});
	});
	
	
	$(document).on('click','#deletebtnmd',function(){
		var row =$(this).parent().parent();
		var tr = row.children();
	 	var mdDeleteCode=tr.eq(0).text();
	 	$('#deletebtnmd').val(mdDeleteCode);
	 	swal({
			  title:"이 문제를 삭제 하시겠습니까? ",
			  text: "해당 중분류를 참조하는 \n " +
				  "소분류가 있을 경우, " +
				  "해당 중분류를 삭제할 수 없습니다. \n \n"
				  ,
			  icon: "warning",
			  buttons: true,
			})	 	
			.then((willUpdate) => {
				  if (willUpdate) {
					  $.ajax({
						  type : "post",
						  url : "${pageContext.request.contextPath}/admin/mdDelete.do",
						  global:false,
						  data:{mdDeleteCode:$('#deletebtnmd').val()},  
						  success : function(data){
							  if((data.result)=="삭제가능"){
								swal({
							       title: "해당 중분류가 삭제되었습니다",
								   text: "",
								   icon:"success"
								}).then(function() {
								    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
								});
							  }else{
								  swal("해당 정보를 참조받는 문제 정보가 존재합니다", "하위 정보를 삭제 후 다시 시도해주세요", "error");
							  }
						  },
						  error: function(error){
							  alert("에러야!");
						 }
					});
						}else {
					    swal("문제 삭제가 취소되었습니다.");
					  }
					  
					  
					
					});
	 	
	});

	$(document).on('click','#deletebtnsm',function(){
		var row =$(this).parent().parent();
		var tr = row.children();
	 	var smDeleteCode=tr.eq(0).text();
	 	$('#deletebtnsm').val(smDeleteCode);
	 	swal({
			  title:"이 문제를 삭제 하시겠습니까? ",
			  text: "해당 소분류를 참조하는 \n " +
				  "문제정보가 있을 경우, " +
				  "해당 소분류를 삭제할 수 없습니다. \n \n"
				  ,
			  icon: "warning",
			  buttons: true,
			})	 	
			.then((willUpdate) => {
				  if (willUpdate) {
					  $.ajax({
						  type : "post",
						  url : "${pageContext.request.contextPath}/admin/smDelete.do",
						  data:{smDeleteCode:$('#deletebtnsm').val()},
						  global:false,
						  success : function(data){
							  if((data.result)=="삭제가능"){
								  swal({
								       title: "해당 소분류가 삭제되었습니다",
									   text: "",
									   icon:"success"
									}).then(function() {
									    window.location = "${pageContext.request.contextPath}/admin/questionCategory.do";
									});
							 	 }else{
							 		swal("해당 정보를 참조받는 문제 정보가 존재합니다", "하위 정보를 삭제 후 다시 시도해주세요", "error");
							 	 }
						  },
						  error: function(error){
							  alert("에러야!");
						 }
					});
						}else {
					    swal("문제 삭제가 취소되었습니다.");
					  }
							});
	 	
	 	
	 	
	});
	
	 
	$(document).on('click','#resetBtn',function(){
		/* location.href="${pageContext.request.contextPath}/admin/questionCategory.do"; */
	    $('#selectLgCatSearch').children('option:first').prop('selected',true);
		$('#selectMdCatSearch').children('option:not(:first)').remove();
		$('#selectSmCatSearch').children('option:not(:first)').remove();
			
		$.ajax({
			  type : "post",
			  url : "${pageContext.request.contextPath}/admin/selectLgList.do",
			  global:false,
			  data:{lgCode:"전체조회"},  
			  success : function(data){
				  $('#list1body').html(data); 
			  },
			  error: function(error){
				  alert("에러야!");
			 }
		});
		
		$.ajax({
			  type : "post",
			  url : "${pageContext.request.contextPath}/admin/selectMdList.do",
			  global:false,
			  data:{lgCode:"전체조회"},  
			  success : function(data){
				  $('#list2body').html(data); 
			  },
			  error: function(error){
				  alert("에러야!");
			 }
		});
		
		$.ajax({
			  type : "post",
			  url : "${pageContext.request.contextPath}/admin/selectSmList.do",
			  global:false,
			  data:{lgCode:"전체조회"},  
			  success : function(data){
				  $('#list3body').html(data); 
			  },
			  error: function(error){
				  alert("에러야!");
			 }
		});
		
	});
	
	
	
		
		
		
		
</script>
			
			
