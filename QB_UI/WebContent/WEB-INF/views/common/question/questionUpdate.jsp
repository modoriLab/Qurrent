<%-- 
	@JSP:questionUpdate.jsp
	@DATE:2018-10-19
	@Author:조재훈
	@Desc:내 문제 수정(스토리보드 33 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- 
	2018.10.12 회준 새 문제 만들기 UI 추가 
	questionManagement.jsp와 css파일 공유
--%>
<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12 ">
							<form class="formNewQuestion" action="insertQuestion.do" enctype="multipart/form-data"
								method="post" id="updateForm">
								
							<!-- select 메뉴와 radio button에서 값 비교후 기존 정보 선택을 위한 hidden input들 시작 -->
							 <c:forEach items="${qdto}" var="qdto">
							 <c:forEach items="${qcat}" var="qcat">
							 <input type="hidden" id="qdto_question_num" name="qdto_question_num" value="${qdto.question_num}">
							 <input type="hidden" name="qdto_question_answer" value="${qdto.question_answer}">
							 <c:forEach items="${cdto}" var="cdto">
							 <input type="hidden" name="cdto_question_num" value="${cdto.question_num}">  
							 <input type="hidden" name="cdto_question_choice_num" value="${cdto.question_choice_num}">  
							 <input type="hidden" name="cdto_question_choice_content" value="${cdto.question_choice_content}">
							 </c:forEach>
							 <input type="hidden" name="qcat_smCatCode" value="${qcat.sm_category_code}">  
							 <input type="hidden" name="qcat_mdCatCode" value="${qcat.md_category_code}">  
							 <input type="hidden" name="qcat_lgCatCode" value="${qcat.lg_category_code}"> 
							
							 <!-- select 메뉴와 radio button에서 값 비교후 기존 정보 선택을 위한 hidden input들 끝 -->
							 	
							<input type="hidden" name="member_id" value="${qdto.member_id}">
								<h3 id="h3id">문제 수정</h3>
								<hr>
								<h4>
							
								<i class="fa fa-angle-right"></i> 출제자 id:
								 ( ${qdto.member_id} )<br>
								 
							</h4>
							<hr>
							<div>
								<h4 class="mb quesCategory">
									<i class="fa fa-angle-right"></i> 문제 분류
								</h4>
								<select id="question_lg_category2" class="form-control updateQuestionSelectCategory"
									name="lg_category_name">
									<option value="" selected disabled>대분류 선택</option>
									<c:forEach items="${lgCatList}" var="lgCatList">
										<option value="${lgCatList.lg_category_code}"
										<c:if test="${lgCatList.lg_category_code eq qcat.lg_category_code}"> selected </c:if>
										>${lgCatList.lg_category_name}</option>
									</c:forEach>
									
								</select> <select id="question_md_category2" class="form-control updateQuestionSelectCategory"
									name="md_category_name">
									<option value="">중분류 선택</option>
									<c:forEach items="${mdCatList}" var="mdCatList">
										<c:if test="${mdCatList.lg_category_code eq qcat.lg_category_code}">
										<option value="${mdCatList.md_category_code}"
											<c:if test="${mdCatList.md_category_code eq qcat.md_category_code}"> selected </c:if>
										>${mdCatList.md_category_name}</option>
										</c:if>
									</c:forEach>
									
								</select> <select id="question_sm_category2" class="form-control updateQuestionSelectCategory"
									name="sm_category_code">
									<option value="">소분류 선택</option>
									<c:forEach items="${smCatList}" var="smCatList">
										<c:if test="${smCatList.md_category_code eq qcat.md_category_code}">
										<option value="${smCatList.sm_category_code}"
											<c:if test="${smCatList.sm_category_code eq qcat.sm_category_code}"> selected </c:if>
										>${smCatList.sm_category_name}</option>
										</c:if>
									</c:forEach>
									
								</select> <select id="level_type2" class="form-control updateQuestionSelectCategory"
									name="level_code">
									<option value="">난이도</option>
									<c:forEach items="${quesLevelList}" var="quesLevelList">
										<option value="${quesLevelList.level_code}"
										<c:if test="${quesLevelList.level_code eq qdto.level_code}"> selected </c:if>
										>${quesLevelList.level_name}</option>
									</c:forEach>
								</select>
							</div>
							<h4 class="quesCategory">
								<i class="fa fa-angle-right"></i> 문제 유형
							</h4>
							<span class="radio quesCategorybig"> 
							<label class="questionChoiceRadioButton">
								 <input type="radio" name="question_type" id="question_type_1"
								 value="객관식" 
								 	<c:if test="${qdto.question_type eq '객관식'}">checked</c:if>
								 >객관식
							</label> &nbsp;&nbsp;
							
							<label class="questionChoiceRadioButton"> 
								<input type="radio" name="question_type" id="question_type_2"
								value="단답형" 
							 		<c:if test="${qdto.question_type eq '단답형'}">checked</c:if>
								>단답형
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
											placeholder="문제 내용을 입력해주세요." rows="3" required> ${qdto.question_name} </textarea>
										<div id="QImg" class="fileupload fileupload-new" data-provides="fileupload">
											
											<div class="fileupload-preview fileupload-exists thumbnail"
												style="max-width: 400px; max-height: 250px; line-height: 20px;">	
											</div>
											<span> 
												<span class="btn btn-theme02 btn-file btn_question_image" id="imageUpdate">
													<span class="fileupload-new"> 
													 <i class="fa fa-paperclip"></i>image
												</span>
												<span class="fileupload-exists">
												 <i class="fa fa-undo"></i>Change
												</span>
												<input type="file" name="question_file" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/>
											</span>
											 <span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(0)" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</span>
											</span>
										</div>
									</div>
									<!--문제 종료-->

									<!--객관식 보기 시작-->
									<div id="questionChoice" style="display: '';" class="col-lg-6">
										<div id="questionChoiceSub1">
											<h4>
												<i class="fa fa-angle-right"></i> 객관식 정답 입력
											</h4>
											<div class="radio" id="answerChoiceText">

											</div>
											<br>
										<hr> 
										</div><!-- /questionChoiceSub1 -->
										<div id="questionChoiceSub2">
										<h4>
											<i class="fa fa-angle-right"></i>객관식 보기 입력
										</h4>
										
											<select id="howManyChoices" class="form-control" name="howManyChoices">
												<option id="howManyChoices1" value="1" disabled
												<c:if test="${fn:length(cdto) eq 0}"> selected </c:if>
												>보기 개수 선택</option>
												<option id="howManyChoices2" value="2"
												<c:if test="${fn:length(cdto) eq 2}"> selected </c:if>
												>보기 개수: 2개</option>
												<option id="howManyChoices3" value="3"
												<c:if test="${fn:length(cdto) eq 3}"> selected </c:if>
												>보기 개수: 3개</option>
												<option id="howManyChoices4" value="4"
												<c:if test="${fn:length(cdto) eq 4}"> selected </c:if>
												>보기 개수: 4개</option>
												<option id="howManyChoices5" value="5"
												<c:if test="${fn:length(cdto) eq 5}"> selected </c:if>
												>보기 개수: 5개</option>
											</select>
											
											<p class="warning_text"><i class="fa fa-exclamation-triangle"></i> 보기 개수 변경시 기존의 문제보기 입력값이 초기화됩니다.</p>
											
										</div><!-- /questionChoiceSub2 -->
										<!-- 1번 보기 -->
										<div id="choiceInput">
										
										</div>
										<!-- choicesInput 끝 -->
									</div>
									<!--객관식 보기 내용 입력 종료 -->

									<!--단답형 보기 시작-->
									<div id="questionShortAnswer" style="display: none;"
										class="col-lg-6">
										<h4>
											<i class="fa fa-angle-right"></i> 단답형 정답 입력
										</h4>
										<!-- 단답형 정답 입력란 -->
										<input type="text" class="form-control" name="question_answer"
											id="questionType2Answer" placeholder="정답을 입력해주세요."
											value="${qdto.question_answer}" required
											disabled>
									</div>
									<!--단답형 내용 입력 종료 -->
								</div>
								<!--문제 내용, 정답, 보기 입력 grid 종료 -->
							</div>
							<!--문제 내용, 정답, 보기 입력 종료 -->
							<hr>
							<button type="button" class="btn btn-secondary quesCategory"
								id="btnUpdateCancel">
								취소</button>
								
							<button type="button" id="deleteQuestionBtn" name="deleteQuestionBtn"
								class="btn btn-theme04 buttonGroup quesCategory deleteQuestionBtn" value="${qdto.question_num }">
								<i class="fa fa-trash-o"></i>문제 삭제</button>
								
							<button type="button"
								class="btn btn-theme quesCategory pull-right" id="btnSubmit">
								수정 완료</button>
						</c:forEach>
						</c:forEach>
						 
						</form>
						<!-- 문제만들기 패널 종료 -->
						<!-- /form-panel -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- /wrapper -->

</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script
	src="${pageContext.request.contextPath}/lib/onet-js/questionUpdate.js"
	type="text/javascript"></script>

<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-내가 만든 문제 스크립트 시작 -->

<script>

$(document).ready(function() {
		var _choiceInput1 ="<div id='QCNPlus_1'><b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' id='question_choice_content1' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_1' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[0]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif' /> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(1)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
		var _choiceInput2 ="<div id='QCNPlus_2'><b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' id='question_choice_content2' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_2' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[1]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif' /> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(2)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
		var _choiceInput3 ="<div id='QCNPlus_3'><b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' id='question_choice_content3' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_3' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[2]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif' /> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(3)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
		var _choiceInput4 ="<div id='QCNPlus_4'><b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' id='question_choice_content4' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_4' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[3]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif' /> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(4)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
		var _choiceInput5 ="<div id='QCNPlus_5'><b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' id='question_choice_content5' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_5' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[4]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif' /> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(5)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"

		var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio" name="question_answer" value="1"  > 1번 </label>&nbsp;&nbsp;'
		var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio2" name="question_answer" value="2"  >2번 </label>&nbsp;&nbsp;'
		var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio3" name="question_answer" value="3"  >3번 </label>&nbsp;&nbsp;'
		var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio4" name="question_answer" value="4"  >4번 </label>&nbsp;&nbsp;'
		var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio5" name="question_answer" value="5"  >5번 </label>&nbsp;&nbsp;'
		var _questionType = $("input[type=radio][name=question_type]:checked").val();
		var qdto_question_answer = $("input[type=hidden][name=qdto_question_answer]").val();

		if ($.trim(_questionType) == "단답형"){
			document.all["questionChoice"].style.display = 'none'; // 안보이게
			document.all["questionShortAnswer"].style.display = ''; // 보이게
    	   
			$("#questionAnswerRadio1").attr("disabled", true);
	        $("#questionAnswerRadio2").attr("disabled", true);
	        $("#questionAnswerRadio3").attr("disabled", true);
	        $("#questionAnswerRadio4").attr("disabled", true);
	        $("#questionAnswerRadio5").attr("disabled", true);
	        $("#howManyChoices").prop("disabled", true);
	        $("#howManyChoices1").prop("selected", "selected");
			$("#questionType2Answer").attr("disabled", false);
			$("#choiceInput").attr("disabled", true);
			
		} else if($.trim(_questionType) == "객관식"){
			document.all["questionChoice"].style.display = ''; // 보이게
			document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
	        $("#questionAnswerRadio1").attr("disabled", false);
	        $("#questionAnswerRadio2").attr("disabled", false);
	        $("#questionAnswerRadio3").attr("disabled", false);
	        $("#questionAnswerRadio4").attr("disabled", false);
	        $("#questionAnswerRadio5").attr("disabled", false);
	        $("#questionType2Answer").attr("disabled", true);
	        $("#howManyChoices").attr("disabled",false);
	        $("#choiceInput").attr("disabled", false);
	        
			if (document.getElementById("howManyChoices").value == "2") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
		

					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					
				}
			if (document.getElementById("howManyChoices").value == "3") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
				
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
				}
			if (document.getElementById("howManyChoices").value == "4") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
				var cdto_qcc4 = document.getElementsByName("cdto_question_choice_content")[3].value;
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#choiceInput').append(_choiceInput4);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#answerChoiceText').append(_answerBtn4);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					$('#question_choice_content4').val(cdto_qcc4);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "4"){
						$('#questionAnswerRadio4').prop("checked",true);
					}
				}	
			if (document.getElementById("howManyChoices").value == "5") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
				var cdto_qcc4 = document.getElementsByName("cdto_question_choice_content")[3].value;
				var cdto_qcc5 = document.getElementsByName("cdto_question_choice_content")[4].value;
				
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#choiceInput').append(_choiceInput4);
					$('#choiceInput').append(_choiceInput5);
				
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#answerChoiceText').append(_answerBtn4);
					$('#answerChoiceText').append(_answerBtn5);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					$('#question_choice_content4').val(cdto_qcc4);
					$('#question_choice_content5').val(cdto_qcc5);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "4"){
						$('#questionAnswerRadio4').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "5"){
						$('#questionAnswerRadio5').prop("checked",true);
					}
				}
		}
	

		$('#question_lg_category2').change(
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

		$('#question_md_category2').change(
						function() {
							$('#question_sm_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category2").value == "${smlist.md_category_code}"){
								$('#question_sm_category2').append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})
		
})
</script>			
