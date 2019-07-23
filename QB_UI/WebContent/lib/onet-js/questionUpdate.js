
$(function() {
		$("#question_type_1").click(function(){ 
			document.all["questionChoice"].style.display = ''; // 보이게
			document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
			
			var remove = document.getElementById("choiceInput");
			remove.innerHTML="";
			var remove1 = document.getElementById("answerChoiceText");
			remove1.innerHTML="";		
	
	        $("#questionAnswerRadio1").attr("disabled", false);
	        $("#questionAnswerRadio2").attr("disabled", false);
	        $("#questionAnswerRadio3").attr("disabled", false);
	        $("#questionAnswerRadio4").attr("disabled", false);
	        $("#questionAnswerRadio5").attr("disabled", false);
	        $("#howManyChoices").prop("disabled", false);
	        $("#howManyChoices").val("5").trigger("change");
	        $("#questionType2Answer").attr("disabled", true);
	        $("#choiceInput").attr("disabled", false);
	   		
	   });
       $("#question_type_2").click(function(){
    	   
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
			
	   });
});

/*객관식 문제 보기 개수 셀렉트박스 값 변경*/
$('#howManyChoices').change(
		function() {
			var remove = document.getElementById("choiceInput");
			var remove1 = document.getElementById("answerChoiceText");
			remove.innerHTML="";
			remove1.innerHTML="";
			var _choiceInput1 ="<div id='QCNPlus_1'><b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' id='question_choice_content1' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_1' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[0]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(1)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
			var _choiceInput2 ="<div id='QCNPlus_2'><b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' id='question_choice_content2' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_2' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[1]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(2)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
			var _choiceInput3 ="<div id='QCNPlus_3'><b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' id='question_choice_content3' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_3' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[2]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(3)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
			var _choiceInput4 ="<div id='QCNPlus_4'><b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' id='question_choice_content4' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_4' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[3]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(4)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
			var _choiceInput5 ="<div id='QCNPlus_5'><b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' id='question_choice_content5' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_5' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[4]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(5)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
			var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio" name="question_answer" value=""  > 1번 </label>&nbsp;&nbsp;'
			var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio2" name="question_answer" value="2"  >2번 </label>&nbsp;&nbsp;'
			var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio3" name="question_answer" value="3"  >3번 </label>&nbsp;&nbsp;'
			var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio4" name="question_answer" value="4"  >4번 </label>&nbsp;&nbsp;'
			var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio5" name="question_answer" value="5"  >5번 </label>&nbsp;&nbsp;'
			var qdto_question_answer = $("input[type=text][name=qdto_question_answer]").val();
			console.log($.trim(qdto_question_answer));
			
			if (document.getElementById("howManyChoices").value == "1") {
				remove.innerHTML="";
				remove1.innerHTML="";	
			}
			
			if (document.getElementById("howManyChoices").value == "2") {
				$('#choiceInput').append(_choiceInput1);
				$('#choiceInput').append(_choiceInput2);
				$('#answerChoiceText').append(_answerBtn1);
				$('#answerChoiceText').append(_answerBtn2);
									
				if($.trim(qdto_question_answer) == "1"){
					$('#questionAnswerRadio').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "2"){
					$('#questionAnswerRadio2').prop("checked",true);
				}
			}
			
			if (document.getElementById("howManyChoices").value == "3") {
				$('#choiceInput').append(_choiceInput1);
				$('#choiceInput').append(_choiceInput2);
				$('#choiceInput').append(_choiceInput3);
				$('#answerChoiceText').append(_answerBtn1);
				$('#answerChoiceText').append(_answerBtn2);
				$('#answerChoiceText').append(_answerBtn3);
									
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
				$('#choiceInput').append(_choiceInput1);
				$('#choiceInput').append(_choiceInput2);
				$('#choiceInput').append(_choiceInput3);
				$('#choiceInput').append(_choiceInput4);
				$('#answerChoiceText').append(_answerBtn1);
				$('#answerChoiceText').append(_answerBtn2);
				$('#answerChoiceText').append(_answerBtn3);
				$('#answerChoiceText').append(_answerBtn4);
			
				
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
	})	
	
	
/* 이미지 remove 버튼 */
function removeImg(number){
	console.log($(this).text());
	$(this).parent().siblings(".fileupload-preview").find("img").remove();
	return false
}

function deleteImg(number){
	if(number == 1){
		$('#choiceInput').find('.QCN_1').remove();
		$('#QCNPlus_1').append('<span class="fileupload fileupload-new QCN_1" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(1)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 2){
		$('#choiceInput').find('.QCN_2').remove();
		$('#QCNPlus_2').append('<span class="fileupload fileupload-new QCN_2" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(2)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 3){
		$('#choiceInput').find('.QCN_3').remove();
		$('#QCNPlus_3').append('<span class="fileupload fileupload-new QCN_3" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(3)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 4){
		$('#choiceInput').find('.QCN_4').remove();
		$('#QCNPlus_4').append('<span class="fileupload fileupload-new QCN_4" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(4)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 5){
		$('#choiceInput').find('.QCN_5').remove();
		$('#QCNPlus_5').append('<span class="fileupload fileupload-new QCN_5" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(5)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 0){
		$('#QImg').remove();
		$('.outQImg').append('<div id="QImg" class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 400px; max-height: 250px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_file" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(0)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></div>');
	}
}
	

/* 취소 버튼 */
$("#btnUpdateCancel").click(function(){
	location.href="questionManagement.do"
})

/* 문제 삭제 버튼*/
	$(document).on("click",".deleteQuestionBtn", function(question_num){
		var question_num = $(this).val();
		console.log("question_num: " + question_num);
		swal({
			  title:"정말 삭제하시겠습니까? ",
			  text: "문제 제출자 또는 다른 사용자가 해당 문제를 사용하여 " +
				  "시험지를 생성 또는 임시저장 한 경우 " +
				  "해당 문제는 수정/삭제가 불가능합니다. \n \n"
				  ,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willUpdate) => {
				  if (willUpdate) {			  
					  $.ajax({
							url : "singleQuestionDelete.do",
							type:'post',
							data : {
								  'question_num' : question_num
							},
							success:function(data){
								if((data.result)=="삭제가능"){
									swal({
										title: "문제가 삭제되었습니다.",
										text: "",
										icon: "success"
									}).then(function(){
										window.location = "questionManagement.do"
									});
								}else{
									swal("문제를 삭제 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
								}
							},
							error: function(error){
								swal('문제 삭제 도중 에러가 발생했습니다.')
							}
						})
					  } else {
					    swal("문제 삭제가 취소되었습니다.");
					  }
					});
			})

/* 문제 수정 완료 버튼 - 유효성 검사 */

$(document).on("click","#btnSubmit", function(){
	var _smCategory = $("#question_sm_category2 option:selected").val();
	var _questionLevel = $("#level_type2 option:selected").val();
	var _questionName = $("input[type=text][name=question_name]").val();
	var _questionChoiceAnswer = $("input[type=radio][name=question_answer]:checked").val();
	var _questionChoiceContent1 = $("input[type=text][id=question_choice_content1]").val();
	var _questionChoiceContent2 = $("input[type=text][id=question_choice_content2]").val();
	var _questionChoiceContent3 = $("input[type=text][id=question_choice_content3]").val();
	var _questionChoiceContent4 = $("input[type=text][id=question_choice_content4]").val();
	var _questionChoiceContent5 = $("input[type=text][id=question_choice_content5]").val();
	var _shortAnswerQuestion = $("input[type=radio][name=question_type]:checked").val();
	var _choiceQuantity = $("#howManyChoices option:selected").val();
	var question_num = $('#qdto_question_num').val();
	
	if ($.trim(_shortAnswerQuestion) == "객관식") {
		/*객관식 문제 유효성검사*/
		if ($.trim(_smCategory) == "") {
			swal("문제의 대,중,소 분류를 선택해주세요");
			document.getElementById("question_sm_category2").focus();
			return false;
		} else if ($.trim(_questionLevel) == "") {
			swal("문제의 난이도를 선택해주세요");
			document.getElementById("level_type2").focus();
			return false;

		} else if ($.trim(_questionChoiceAnswer) == "") {
			swal("문제의 정답을 선택해주세요");
			return false;
		/*객관식 문제 보기 5개인 경우*/
		} else if ($.trim(_choiceQuantity) == "5"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent4) == "") {
				swal("객관식 4번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent5) == "") {
				swal("객관식 5번 보기를 입력해주세요");
			} else {
				
				swal({
					  title:"문제 수정을 완료하시겠습니까? ",
					  icon:"warning",
					  buttons: true,
					})
					.then((willUpdate) => {
						if (willUpdate){
							$.ajax({
								url : "singleQuestionDelete.do",
								type:'post',
								data : {
										 'question_num' : question_num
										},
								success:function(data){
									if((data.result)=="삭제가능"){
										
									}else{
										swal("문제를 수정 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
									}
								},
								error: function(error){
									swal('문제 수정 도중 에러가 발생했습니다.')
								}
							})
							$('#updateForm').submit();
							return true;
						}else{
							swal("문제 수정이 취소되었습니다.")
							return false;
						}
					})
			} 
			
		/*객관식 문제 보기 4개인 경우*/
		} else if ($.trim(_choiceQuantity) == "4"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent4) == "") {
				swal("객관식 4번 보기를 입력해주세요");
				return false;
			} else {
				
				swal({
					  title:"문제 수정을 완료하시겠습니까? ",
					  icon:"warning",
					  buttons: true,
					})
					.then((willUpdate) => {
						if (willUpdate){
							$.ajax({
								url : "singleQuestionDelete.do",
								type:'post',
								data : {
										 'question_num' : question_num
										},
								success:function(data){
									if((data.result)=="삭제가능"){
										
									}else{
										swal("문제를 수정 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
									}
								},
								error: function(error){
									swal('문제 수정 도중 에러가 발생했습니다.')
								}
							})
							$('#updateForm').submit();
							return true;
						}else{
							swal("문제 수정이 취소되었습니다.")
							return false;
						}
					})
			}
		/*객관식 문제 보기 3개인 경우*/
		} else if ($.trim(_choiceQuantity) == "3"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			}else {
			
				swal({
					  title:"문제 수정을 완료하시겠습니까? ",
					  icon:"warning",
					  buttons: true,
					})
					.then((willUpdate) => {
						if (willUpdate){
							$.ajax({
								url : "singleQuestionDelete.do",
								type:'post',
								data : {
										 'question_num' : question_num
										},
								success:function(data){
									if((data.result)=="삭제가능"){
										
									}else{
										swal("문제를 수정 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
									}
								},
								error: function(error){
									swal('문제 수정 도중 에러가 발생했습니다.')
								}
							})
							$('#updateForm').submit();
							return true;
						}else{
							swal("문제 수정이 취소되었습니다.")
							return false;
						}
					})
			}
		/*객관식 문제 보기 2개인 경우*/	
		} else if ($.trim(_choiceQuantity) == "2"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			}else {
				
				swal({
					  title:"문제 수정을 완료하시겠습니까? ",
					  icon:"warning",
					  buttons: true,
					})
					.then((willUpdate) => {
						if (willUpdate){
							$.ajax({
								url : "singleQuestionDelete.do",
								type:'post',
								data : {
										 'question_num' : question_num
										},
								success:function(data){
									if((data.result)=="삭제가능"){
										
									}else{
										swal("문제를 수정 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
									}
								},
								error: function(error){
									swal('문제 수정 도중 에러가 발생했습니다.')
								}
							})
							$('#updateForm').submit();
							return true;
						}else{
							swal("문제 수정이 취소되었습니다.")
							return false;
						}
					})
			} 
			
		} 
	/*주관식 문제 생성 유효성검사*/
	}else {
		$('#choiceInput').remove();
		if ($.trim(_smCategory) == "") {
			swal("문제의 대,중,소 분류를 선택해주세요");
			document.getElementById("question_sm_category2").focus();
			return false;
		} else if ($.trim(_questionLevel) == "") {
			swal("문제의 난이도를 선택해주세요");
			document.getElementById("level_type2").focus();
			return false;
		}else{
			
			swal({
				  title:"문제 수정을 완료하시겠습니까? ",
				  icon:"warning",
				  buttons: true,
				})
				.then((willUpdate) => {
					if (willUpdate){
						$.ajax({
							url : "singleQuestionDelete.do",
							type:'post',
							data : {
									 'question_num' : question_num
									},
							success:function(data){
								if((data.result)=="삭제가능"){
									
								}else{
									swal("문제를 수정 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
								}
							},
							error: function(error){
								swal('문제 수정 도중 에러가 발생했습니다.')
							}
						})
						$('#updateForm').submit();
						return true;
					}else{
						swal("문제 수정이 취소되었습니다.")
						return false;
					}
				})
		}
	}
})
