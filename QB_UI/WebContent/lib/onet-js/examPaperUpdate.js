

function updateExamBtn(num){
	
	var exam_paper_num = num;
	var exam_name = $("#exam_name").val();
	var exam_desc = $("#exam_desc").val();
	
	swal({
		  title: "수정을 완료하시겠습니까?",
		  buttons: true,		  
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url : "../teacher/updateExamCheck.do",
					type : "get",
					dataType : "json",
					data : {
						'exam_paper_num' : exam_paper_num
					},
					global:false,
					success : function(data){
						if(data == 1){
							//그냥 수정하는 부분
							$.ajax({
								url : "../teacher/examquestionsdelete.do",
								type : "get",
								data : {
									"exam_paper_num" : exam_paper_num,
									"exam_name" : exam_name,
									"exam_desc" : exam_desc
								},
								global:false,
								success:function(data){
									
									$('.selectedBox').find('input[name="checkbox[]"]').each(function(index){
										var question_num = $(this).val();   //문제 번호
										var exam_question_seq = Number(index+1) //문제 배치 번호
										var exam_question_score = $(this).closest('li').find('#insertedQScore').val() //문제 배점
										
										$.ajax({
											url : "../teacher/examquestionsinsert.do",
											type : "get",
											dataType : "json",
											data : {
												"exam_paper_num" : exam_paper_num,
												"question_num" : question_num,
												"exam_question_seq" : exam_question_seq,
												"exam_question_score" : exam_question_score
											},
											global:false,
											success:function(data){
												
												swal({
												       title: "수정이 완료되었습니다.",
													   text: "",
													   icon:"success"
													}).then(function() {
													    window.location = "examManagement.do";
												});
											}
										})
									});
								}
							});
						}else{
							//시험지 enable 0으로 update후 시험지 새로 생성하는 부분
							$.ajax({
								url : "../teacher/examPaperUpdateInsert.do",
								type : "get",
								data : {
									"exam_paper_num" : exam_paper_num,
									"exam_paper_name" : exam_name,
									"exam_paper_desc" : exam_desc
								},
								global:false,
								success : function(exampapernum){				
										$('.selectedBox').find('input[name="checkbox[]"]').each(function(index){
										var question_num = $(this).val();   //문제 번호
										var exam_question_seq = Number(index+1) //문제 배치 번호
										var exam_question_score =$(this).closest('li').find('#insertedQScore').val() //문제 배점
									
									$.ajax({
											url : "../teacher/examquestionsinsert.do",
											type : "get",
											dataType : "json",
											data : {
												"exam_paper_num" : exampapernum,
												"question_num" : question_num,
												"exam_question_seq" : exam_question_seq,
												"exam_question_score" : exam_question_score
											},
											global:false,
											success:function(data){
												location.href="examManagement.do";
											}
										});
									});
									
								}
							})
							
						}
					}
				});
			  
		  } else {
		    
		  }
	});
}