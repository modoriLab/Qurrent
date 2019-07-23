<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel div_table">
					<div class="panel-heading">
					
						<ul class="nav nav-tabs nav-justified">
							<li class="active">
								<!-- 관리자일 경우  "문제 관리" / 강사일 경우 버튼이 "내 문제함"-->
								<se:authorize access="hasRole('ROLE_ADMIN')">
									<a data-toggle="tab" href="#overview"> 문제 관리 </a>
								</se:authorize>
								<se:authorize access="hasRole('ROLE_TEACHER')">
									<a data-toggle="tab" href="#overview"> 내 문제함 </a>
								</se:authorize>
							</li>
							<li>
								<a data-toggle="tab" href="#newQuestion" class="contact-map">새 문제 만들기</a>
							</li>
						</ul><!--  /nav nav-tabs nav-justified -->
					
					</div><!-- panel-heading -->
					
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
						
									<div class="col-lg-12">
									
									<h3 id="h3id">
									<!--  관리자일 경우 "문제 관리"/ 강사일 경우 "내 문제함" -->
									<se:authorize access="hasRole('ROLE_ADMIN')">
									 문제 관리
									</se:authorize>
									<se:authorize access="hasRole('ROLE_TEACHER')">
									내 문제함
									</se:authorize>
										<input type="text" name="member_id" id="member_id"
										value="${memberDto.member_id}" style="display: none">
										<input type="text" name="question_num" id="question_num"
										value="" style="display: none">
									</h3>
									<hr>
									<select id="question_lg_category" class="form-control myQuestionSelectCategory"
										name="lg_category_name" data-toggle="tooltip" data-placement="top"
										title="대분류 선택 시 해당 대분류에 속하는 중분류를 선택할 수 있습니다.">
										<option value="" selected disabled>대분류 선택</option>
										<c:forEach items="${lgCatList}" var="lgCatList">
											<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
										</c:forEach>
									</select>
									
									<select id="question_md_category" class="form-control myQuestionSelectCategory"
										name="md_category_name" data-toggle="tooltip" data-placement="top"
										title="대분류를 먼저 선택해 주세요. ">
										<option value="">중분류 선택</option>
									</select>
									
									<select id="question_sm_category" class="form-control myQuestionSelectCategory"
										name="sm_category_name" data-toggle="tooltip" data-placement="top"
										title="중분류를 먼저 선택해 주세요. ">
										<option value="">소분류 선택</option>
									</select>
									
									<select class="form-control myQuestionSelectCategory" name="level_code" id="level_type"
									data-toggle="tooltip" data-placement="top"
										title="난이도를 선택해주세요. ">
										<option value="">난이도</option>
										<c:forEach items="${quesLevelList}" var="quesLevelList">
											<option value="${quesLevelList.level_code}">${quesLevelList.level_name}</option>
										</c:forEach>
									</select> 
									
									<select class="form-control myQuestionSelectCategory" 
									id="questiontype" name="questionType"
									data-toggle="tooltip" data-placement="top"
										title="문제타입을 선택해주세요. ">
										<option value="">문제타입</option>
										<option value="">전체</option>
										<option value="객관식">객관식</option>
										<option value="단답형">단답형</option>
									</select> 
									
									<input type="button" id="viewAll"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										value="전체조회"> 
										<input type="button"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										id="questionsearch"
										value="검색"> 
										<input type="text"
										class="form-control myQuestionTextField pull-right"
										id="keyword" placeholder="키워드를 입력하세요.">
									
									<a id="searchHelp" style="cursor:pointer"><i class="fa fa-info-circle"></i> 문제 검색 도움말 </a>
																		
									</div><!-- col-lg-12 -->
									
								</div> <!-- row -->
								<hr>
								
								<div class="" id="myQuestionPanel">
										<div id="myQuestions"> 
												<!-- 문제 하나의 div	-->
					                    </div>
								</div> <!-- myQuestionPanel -->
								
							</div> <!-- overview -->
							
							<div id="newQuestion" class="tab-pane">
							<div class="row">
								<div class="col-lg-12">
									<form class="formNewQuestion" id="insertQuestionForm" action="insertQuestion.do" enctype="multipart/form-data"
										method="post">
										
										<input type="text" name="member_id"
										value="${memberDto.member_id}" style="display: none">
										
										<h3 id="h3id">새 문제 만들기</h3>
										<hr>
										<h4>
											<i class="fa fa-angle-right"></i> 출제자: ${memberDto.member_name} ( ${memberDto.member_id} )
										</h4>
										<hr>
										<div>
											<h4 class="mb quesCategory">
												<i class="fa fa-angle-right"></i> 문제 분류
											</h4>
											<select id="question_lg_category2"
												class="form-control makeQuestionCate" name="lg_category_name">
												<option value="" selected disabled>대분류 선택</option>
												<c:forEach items="${lgCatList}" var="lgCatList">
													<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
												</c:forEach>
											</select> <select id="question_md_category2"
												class="form-control makeQuestionCate" name="md_category_name">
												<option value="">중분류 선택</option>
											</select> <select id="question_sm_category2"
												class="form-control makeQuestionCate" name="sm_category_code">
												<option value="">소분류 선택</option>
											</select> <select id="level_type2" class="form-control makeQuestionCate"
												name="level_code">
												<option value="">난이도</option>
												<c:forEach items="${quesLevelList}" var="quesLevelList">
													<option value="${quesLevelList.level_code}">${quesLevelList.level_name}</option>
												</c:forEach>
											</select>
										</div>
										<h4 class="quesCategory">
											<i class="fa fa-angle-right"></i> 문제 유형
										</h4>
										<span class="radio quesCategorybig"> 
											<label class="questionChoiceRadioButton"> 
												<input type="radio" name="question_type" id="question_type_1"
												value="객관식" checked >객관식
											</label> &nbsp;&nbsp; 
											<label class="questionChoiceRadioButton">
												<input type="radio" name="question_type" id="question_type_2"
												value="단답형">단답형
										</label>
										</span>
										<hr>
										<div class="form-group" id="questionMoonje">
											<div class="row">
												<div class="col-lg-6 outQImg">
													<h4>
														<i class="fa fa-angle-right"></i> 문제 내용 입력
													</h4>
													<textarea name="question_name" class="form-control"
														placeholder="문제 내용을 입력해주세요." rows="3" required></textarea>
													<div id="QImg" class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 400px; max-height: 250px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_file" class="default"/>
															</span>
															<span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(0)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
														</span>
													</div>
												</div>
												<!--문제 종료-->

												<!--객관식 보기 시작-->
												<div id="questionChoice" style="display: '';" class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 객관식 정답 입력
													</h4>
													<div class="radio" id="answerChoiceText">
														
														<label class="questionChoiceRadioButton"> 
															<input type="radio" name="question_answer" value="1" id="questionAnswerRadio1">
															1번
														</label>&nbsp;&nbsp; 
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="2" id="questionAnswerRadio2">
															2번
														</label>&nbsp;&nbsp;
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="3" id="questionAnswerRadio3">
															3번
														</label>&nbsp;&nbsp;
														 
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="4" id="questionAnswerRadio4">
															4번
														</label>&nbsp;&nbsp; 
												
														
													</div>
													<br>
													
													<hr>
													
													
													<h4>

														<i class="fa fa-angle-right"></i>객관식 보기 입력

													</h4>
													<select id="howManyChoices" class="form-control" name="howManyChoices">
														<option id="howManyChoices1" value="1">보기개수 선택</option>
														<option id="howManyChoices2" value="2">보기 개수: 2개</option>
														<option id="howManyChoices3" value="3">보기 개수: 3개</option>
														<option id="howManyChoices4" value="4" selected>보기 개수: 4개</option>
														<option id="howManyChoices5" value="5">보기 개수: 5개</option>
														
													</select>
													<p class="warning_text"><i class="fa fa-exclamation-triangle"></i> 보기 개수 변경시 기존의 문제보기 입력값이 초기화됩니다.</p>
													
													<!-- 1번 보기 -->
													<div id="choiceInput">
													<div id="QCNPlus_1">
													<b><input type="text" name="question_choice_num"
														value="1" style="display: none">1.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content1"
														class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요.">
														
													  <span class="fileupload fileupload-new QCN_1" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
															
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_choice_files[0]" class="default"/>
															</span>
															<span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(1)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
															<!-- <a href="#" class="btn btn-theme04 fileupload-exists"  data-dismiss="fileupload">
															<i class="fa fa-trash-o" onclick="deleteImg(1)">Remove</i></a> -->
														</span>
													</span>
													</div>
													<!-- 2번 보기 -->
													<div id="QCNPlus_2">
													<b><input type="text" name="question_choice_num"
														value="2" style="display: none">2.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content2"
														class="form-control-inline" placeholder="2번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new QCN_2" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_choice_files[1]" class="default"/>
															</span>
															<span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(2)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
														</span>
													</span></div>
													<!-- 3번 보기 -->
													<div id="QCNPlus_3">
													<b><input type="text" name="question_choice_num"
														value="3" style="display: none">3.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content3"
														class="form-control-inline" placeholder="3번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new QCN_3" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_choice_files[2]" class="default"/>
															</span>
															<span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(3)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
														</span>
													</span></div>
													<!-- 4번 보기 -->
													<div id="QCNPlus_4">
													<b><input type="text" name="question_choice_num"
														value="4" style="display: none">4.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content4"
														class="form-control-inline" placeholder="4번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new QCN_4" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_choice_files[3]" class="default"/>
															</span>
															<span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(4)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
														</span>
													</span></div>
													
													</div> <!-- choicesInput 끝 -->
												</div><!--객관식 보기 내용 입력 종료 -->

												<!--단답형 보기 시작-->
												<div id="questionShortAnswer" style="display:none;" class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 단답형 정답 입력
													</h4>
													<!-- 단답형 정답 입력란 -->
													<input type="text" class="form-control" name="question_answer"
														id="questionType2Answer" placeholder="정답을 입력해주세요." required disabled>
												</div>
												<!--단답형 내용 입력 종료 -->
											</div>
											<!--문제 내용, 정답, 보기 입력 grid 종료 -->
										</div>
										<!--문제 내용, 정답, 보기 입력 종료 -->
										<hr>
										<button type="reset" class="btn btn-secondary quesCategory">
										입력 취소</button>
										<button type="button" class="btn btn-theme quesCategory pull-right" id="btnSubmit">
										문제 등록</button>
										
									</form>
								</div>
								<!-- 문제만들기 패널 종료 -->
								</div>
								<!-- /form-panel -->
							</div>
						</div> <!-- tab-content -->
					</div> <!-- panel-body -->
				</div><!-- row content-panel div_table -->
			</div><!-- col-lg-12 -->
		</div><!-- row mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->


<script
	src="${pageContext.request.contextPath}/lib/onet-js/questionManagement.js"
	type="text/javascript"></script>

<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-내가 만든 문제 스크립트 시작  -->
<script>
	$(document).ready(function() {
		
		$('#question_lg_category')
				.change(
						function() {
							$('#question_md_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document.getElementById("question_lg_category").value == "${mdlist.lg_category_code}") {
								$('#question_md_category')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category')
				.change(
						function() {
							$('#question_sm_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category").value == "${smlist.md_category_code}") {
								$('#question_sm_category')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})

		$('#question_lg_category2')
				.change(
						function() {
							$('#question_md_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document
									.getElementById("question_lg_category2").value == "${mdlist.lg_category_code}") {
								$('#question_md_category2')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category2').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category2')
				.change(
						function() {
							$('#question_sm_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document
									.getElementById("question_md_category2").value == "${smlist.md_category_code}") {
								$('#question_sm_category2')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})
						
})
</script>
<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-전체문제 스크립트 끝 -->

