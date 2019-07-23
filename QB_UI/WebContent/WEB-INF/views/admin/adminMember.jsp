<%-- 
	@JSP:adminMember.jsp
	@DATE:2018-10-10
	@Author:유영준
	@Desc:회원 관리 페이지(스토리보드 10 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/adminMember.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/lib/onet-js/adminMember.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- main content start -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<!-- /col-lg-12 -->

				<!-- 모달창 -->
				<!-- UpdateModal -->
				<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">정보 수정</h4>
						</div>
						<div class="modal-body">
							<div class="form-panel">
								<div class=" form">
									<form class="cmxform form-horizontal style-form"
										id="commentForm" method="get" action="">
										<div class="form-group ">
											<label for="cid" class="control-label col-lg-2">ID</label>
											<div class="col-lg-10">
												<input class="form-control" type="text"  name="member_id" 
												maxlength="10" value="" readonly  id="cid">
												
											</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-2">이름</label>
											<div class="col-lg-10">
											
											<input class="form-control" type="text"  name="member_name" 
											maxlength="10" value="" readonly  id="cname">
												
											</div>
										</div>
										<div class="form-group ">
											<label for="cemail" class="control-label col-lg-2">E-Mail</label>
											<div class="col-lg-10">
												<input class="form-control" type="email" name="member_email" 
												maxlength="30" value="" id="cemail">
											</div>
										</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">핸드폰</label>
											<div class="col-lg-10">
												<input class="form-control" type="text"  name="member_phone" 
												maxlength="15" value=""id="curl" >
											</div>
										</div>
										<div class="form-group ">
											<label for="cclass" class="control-label col-lg-2">클래스</label>
												<div class="col-lg-10">
												
													<select class="form-control" id="class_name" name="class_name">
													 <c:forEach var="classList" items="${classList}">
														<option>${classList.class_name}</option>
													</c:forEach>
													</select>
												
												</div>
											</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">권한
												설정</label>
											<div class="col-lg-10">
												<input type="radio" id="agree_s" name="agree" 
													value="ROLE_STUDENT"/>학생
												&nbsp;&nbsp; 
												<input type="radio" id="agree_t" name="agree"
													value="ROLE_TEACHER"/>강사
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" type="button" id="updateMemberBtn">수정</button>
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
				<!-- <div class="showback"> -->
				<div class="row content-panel">
					<div class="panel-heading">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;회원 관리
							</h4>
						</header>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<!-- <div class="tab-content"> -->
							<div class="row searchRowDiv">
							<!-- selectBox -->
							<select id="searchRole" class="form-control searchControl"
									name="searchRole">
								<option value="">회원 권한 선택</option>
							<c:forEach items="${roleList}" var="roleList">
								<option value="${roleList.role_desc}">${roleList.role_desc}</option>
							</c:forEach>
							</select> 
							<select id="searchClassName" class="form-control searchControl"
									name="searchClassName">
								<option value="">클래스 선택</option>
							<c:forEach items="${classList}" var="classList">
								<option value="${classList.class_name}">${classList.class_name}</option>	
							</c:forEach>
							</select>
							
							<select id="searchMemberInfo" class="form-control searchControl"
									name="searchMemberInfo">
								<option value="">개인정보 선택</option>
								<option value="name">이름</option>
								<option value="id">아이디</option>
								<option value="email">이메일</option>
							</select>
							<input type="text" class="form-control searchControl" 
								   id="searchBox" name="searchBox" placeholder="검색어를 입력하세요">
							<button type="button" class="btn btn-theme" id="memberSearchBtn">초기화</button>
						</div>
								<div class="row">
									<div id="div_adminMember" class="col-md-12">
										<table id="adminMemberTable" class="display">
											<thead>
												<tr>
													<th>전체<input type="checkbox" id="checkall" name="checkall"></th>
													<th class="class_name">클래스</th>
													<th class="member_id">아이디</th>
													<th class="member_name">이름</th>
													<th class="member_email">이메일</th>
													<th class="member_phone">핸드폰</th>
													<th class="role_code">권한</th>
													<th class="member_enable">관리</th>
													<th class="member_enable">수정&삭제</th>
												</tr>
											</thead>
										</table>
										<div id="adminMemberBtnDiv">
											
											<button type="button" class="insert-member btn btn-theme"
													id="selectInsertbtn" name="selectInsertbtn">선택 회원 일괄 학생 등록</button>
													 <!-- data-toggle="modal" data-target="#InsertMemberModal" -->
											<button type="button" class="delete-member btn btn-theme04"
													id="selectDeletebtn" name="selectDeletebtn">선택 회원 일괄 삭제</button>
													 <!-- data-toggle="modal" data-target="#DeleteMemberModal" -->
										</div>
									</div>
									<!-- /col-md-6 -->
								</div>
								<!-- /OVERVIEW -->
							<!-- </div> -->
							<!-- /tab-pane -->
							

						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- </div> -->
			<!-- /row -->
		
		<!-- /container -->
		<!-- /wrapper -->
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->