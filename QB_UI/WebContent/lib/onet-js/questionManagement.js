
/*내가 만든 문제 탭 - 페이지 로드시 전체문제 보여주기*/
$(function() {
	var member_id = document.getElementById("member_id").value;
	
	$.ajax({
		url : "myQuestionView.do",
		type:'GET',
		data : {
			  'member_id' : member_id
		},
		dataType:"html",
		success:function(data){
			$('#myQuestions').html(data);
		}
	});
	
	
	/*내가 만든 문제 탭 - 전체조회 버튼*/
	$('#viewAll').click(function(){
		if($.trim(member_id) == "admin"){
			$.ajax({
			url : "myQuestionView.do",
			type:'GET',
			dataType:"html",
			success:function(data){
				$('#myQuestions').html(data);
			}
			});
			
		}else{
			$.ajax({
				url : "myQuestionView.do",
				type:'GET',
				data : {
					  'member_id' : member_id
				},
				dataType:"html",
				success:function(data){
					$('#myQuestions').html(data);
				}
			});
			
		}
	})
	
	/*내가 만든 문제 탭 - 검색 버튼*/
	$('#questionsearch').click(function(){
		   var lgsearchtype = document.getElementById("question_lg_category").value;
		   var mdsearchtype = document.getElementById("question_md_category").value;
		   var smsearchtype = document.getElementById("question_sm_category").value;
		   var leveltype = document.getElementById("level_type").value;
		   var questiontype = document.getElementById("questiontype").value;
		   var keyword = document.getElementById("keyword").value;
		   var member_id = document.getElementById("member_id").value;
		   
			$.ajax({
				  url : "myQuestionSearch.do",
				  type:'GET',
				  data : {
					  'lgsearchtype' : lgsearchtype,
					  'mdsearchtype' : mdsearchtype,
					  'smsearchtype' : smsearchtype,
					  'leveltype' : leveltype,
					  'questiontype' : questiontype,
					  'keyword': keyword,
					  'member_id': member_id
				  },
				  dataType:"html",
				  success:function(data){
					  $('#myQuestions').html(data);
				  }
			 });
	   });
	
	$('#searchHelp').click(function(){
		swal({
			title: "문제 검색 도움말",
			text: "분류별, 난이도별, 문제타입별, 키워드별 검색을 지원합니다. \n \n" +
				 "1.분류" + "\n 검색을 원하는 대, 중, 소 분류를 선택해주세요. \n" +
				"중, 소 분류의 선택을 위해서는 해당 중, 소 분류를 포함하는 상위 " +
				"\n분류가 먼저 선택되어야 합니다.\n \n" +
				"2.난이도, 문제 타입 \n 검색을 원하는 난이도와 문제 타입을 선택해주세요. \n \n" +
				"3.키워드 \n 입력하신 키워드를 포함하고 있는 문제가 검색됩니다. \n" +
				"이 때, 선택하신 분류, 난이도, 문제타입이 있다면 그 선택값 내의 \n 문제에서 키워드를 포함한 문제가 검색됩니다.\n\n" +
				"키워드를 입력하지 않고 분류, 난이도, 문제타입 선택 후 검색을 \n 누를 시에는 선택값에 해당하는 모든 문제가 검색됩니다."
				,
			icon: "info"
		});
	});
	
})


$(function() {
	/* 문제 수정 버튼*/
	$(document).on("click",".updateMyQuestionBtn", function(question_num){
		var question_num = $(this).val();
		console.log("question_num: " + question_num);
		swal({
			  title:"이 문제를 수정 하시겠습니까? ",
			  text: "문제 제출자 또는 다른 사용자가 해당 문제를 사용하여 \n " +
				  "시험지를 생성 또는 임시저장 한 경우, " +
				  "해당 문제는 수정/삭제가 \n 불가능합니다. \n \n"
				  ,
			  icon: "warning",
			  buttons: true,
			})
			.then((willUpdate) => {
				  if (willUpdate) {			  
					  $.ajax({
							type : "get",
							url : "singleUpdateCheck.do",
							data : { "question_num" : question_num},			
							success:function(data){
								if((data.result)=="삭제가능"){
									window.location.href = "questionUpdate.do?question_num=" + question_num
								}else{
									swal({
										title: "문제를 수정할 수 없습니다.",
										text: "해당 문제를 사용하는 시험지가 존재합니다.",
										icon: "error"
									});
								}
							},
							error: function(error){
								swal('문제 수정 도중 에러가 발생했습니다.')
							}
						});
					  } else {
					    swal("문제 수정이 취소되었습니다.");
					  }
					});
			})
	
	/*문제 삭제 버튼*/
	$(document).on("click",".deleteMyQuestionBtn", function(question_num){
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
})	
	




/*새 문제 만들기 탭 - 문제 타입 (객관식, 단답형) 변경 시 정답 입력 div 변경 */

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
	        $("#howManyChoices").val("4").trigger("change");
	        $("#questionType2Answer").attr("disabled", true);
	        $("#choiceInput").attr("disabled", false);
	   });
		
       $("#question_type_2").click(function(){
    	   
    	    document.all["questionChoice"].style.display = 'none'; // 안보이게
   			document.all["questionShortAnswer"].style.display = ''; // 보이게
   			
   			var remove = document.getElementById("choiceInput");
			remove.innerHTML="";
			var remove1 = document.getElementById("answerChoiceText");
			remove1.innerHTML="";
   			
			$("#questionAnswerRadio1").attr("disabled", true);
	        $("#questionAnswerRadio2").attr("disabled", true);
	        $("#questionAnswerRadio3").attr("disabled", true);
	        $("#questionAnswerRadio4").attr("disabled", true);
	        $("#questionAnswerRadio5").attr("disabled", true);
	        $("#howManyChoices").prop("disabled", true);
	        $("#howManyChoices1").prop("selected", "selected");
	        
			$("#questionType2Answer").attr("disabled", false);
	
			$("#choiceInput").attr("disabled", true);
			 var QCF = document.getElementsByName("question_choice_files");
			
	   });
});
		
/* 새 문제 만들기 탭 - 입력 취소 버튼 */
$(function() {
	$('#btn_Reset').click(function(){
		$("#question_lg_category2 option").prop("selected", false);
		$("#question_md_category2 option").prop("selected", false);
		$("#question_sm_category2 option").prop("selected", false);
		$("#level_type2 option").prop("selected", false);
		$("#howManyChoices").val("4").trigger("change");
		deleteImg(0);
		deleteImg(1);
		deleteImg(2);
		deleteImg(3);
		deleteImg(4);
		deleteImg(5);
	})

	
/*새 문제 만들기 탭 - 객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 */ 
	
	$('#howManyChoices')
		.change(
			function() {
				var remove = document.getElementById("choiceInput");
				remove.innerHTML="";
				var remove1 = document.getElementById("answerChoiceText");
				remove1.innerHTML="";

				var _choiceInput1 ="<div id='QCNPlus_1'><b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' id='question_choice_content1' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_1' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[0]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(1)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
				var _choiceInput2 ="<div id='QCNPlus_2'><b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' id='question_choice_content2' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_2' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[1]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(2)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
				var _choiceInput3 ="<div id='QCNPlus_3'><b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' id='question_choice_content3' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_3' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[2]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(3)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
				var _choiceInput4 ="<div id='QCNPlus_4'><b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' id='question_choice_content4' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_4' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[3]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(4)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
				var _choiceInput5 ="<div id='QCNPlus_5'><b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' id='question_choice_content5' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new QCN_5' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[4]' class='default' accept='image/jpg, image/jpeg, image/png, image/gif'/> </span> <span class='btn btn-theme04 fileupload-exists' onclick='deleteImg(5)' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</span> </span> </span></div>"
				var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="1" >1번 </label>&nbsp;&nbsp;'
				var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="2" >2번 </label>&nbsp;&nbsp;'
				var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="3" >3번 </label>&nbsp;&nbsp;'
				var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="4" >4번 </label>&nbsp;&nbsp;'
				var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="5" >5번 </label>&nbsp;&nbsp;'
				if (document.getElementById("howManyChoices").value == "1") {
					remove.innerHTML="";
					remove1.innerHTML="";
				}
				if (document.getElementById("howManyChoices").value == "2") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
				}
				if (document.getElementById("howManyChoices").value == "3") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
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
				}	
		})
});

/* 문제 등록 버튼 - 유효성 검사 */
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
	
	if ($.trim(_shortAnswerQuestion) == "객관식") {
			var filechk=$("input[type=file]").val();
			console.log(filechk);
		
		/*객관식 문제 생성 유효성검사*/
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
					  title:"문제를 등록하겠습니까? ",
					  buttons: true,
					})
					.then((willInsert) => {
						if (willInsert){
							alert("if문 진입");
							$('#insertQuestionForm').submit();
							return true;
						}else{
							swal({
								title:"문제 등록이 취소되었습니다."
							})
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
					  title:"문제를 등록하겠습니까? ",
					  buttons: true,
					})
					.then((willInsert) => {
						if (willInsert){
							$('#insertQuestionForm').submit();
							return true;
						}else{
							swal("문제 등록이 취소되었습니다.")
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
					  title:"문제를 등록하겠습니까? ",
					  buttons: true,
					})
					.then((willInsert) => {
						if (willInsert){
							$('#insertQuestionForm').submit();
							return true;
						}else{
							swal("문제 등록이 취소되었습니다.")
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
					  title:"문제를 등록하겠습니까? ",
					  buttons: true,
					})
					.then((willInsert) => {
						if (willInsert){
							$('#insertQuestionForm').submit();
							return true;
						}else{
							swal("문제 등록이 취소되었습니다.")
							return false;
						}
					})
			} 
			
		}
	/*주관식 문제 생성 유효성검사*/
	}else{
		
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
				  title:"문제를 등록하겠습니까? ",
				  buttons: true,
				})
				.then((willInsert) => {
					if (willInsert){
						$('#insertQuestionForm').submit();
						return true;
					}else{
						swal("문제 등록이 취소되었습니다.")
						return false;
					}
				})
		}
	}
})

function removeImg(number){
	$(this).parent().siblings(".fileupload-preview").find("img").remove();
	return false
}

function deleteImg(number){
	if(number == 1){
		$('#choiceInput').find('.QCN_1').remove();
		$('#QCNPlus_1').append('<span class="fileupload fileupload-new QCN_1" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif" /></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(1)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 2){
		$('#choiceInput').find('.QCN_2').remove();
		$('#QCNPlus_2').append('<span class="fileupload fileupload-new QCN_2" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[1]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif" /></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(2)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 3){
		$('#choiceInput').find('.QCN_3').remove();
		$('#QCNPlus_3').append('<span class="fileupload fileupload-new QCN_3" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[2]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif" /></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(3)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 4){
		$('#choiceInput').find('.QCN_4').remove();
		$('#QCNPlus_4').append('<span class="fileupload fileupload-new QCN_4" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[3]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif" /></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(4)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 5){
		$('#choiceInput').find('.QCN_5').remove();
		$('#QCNPlus_5').append('<span class="fileupload fileupload-new QCN_5" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[4]" class="default" accept="image/jpg, image/jpeg, image/png, image/gif" /></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(5)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></span>');
	}else if(number == 0){
		$('#QImg').remove();
		$('.outQImg').append('<div id="QImg" class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 400px; max-height: 250px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_file" class="default" accept="image/jpg, image/jpeg, image/png, image/gif"/></span><span class="btn btn-theme04 fileupload-exists" onclick="deleteImg(0)" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</span></span></div>');
	}
}
