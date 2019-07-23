function deleteExamInfo(){
	
	var deleteDateList = document.getElementsByName("deleteExamScheduleBtn")[0].value;
	
	var deleteDateListlength=document.getElementsByName("deleteExamScheduleBtn").length
	
	var thisvalue=window.event.target.value;
	
	var examdate=thisvalue;
	var removeData=examdate.replace(/-/gi, '');


	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
	var currentDate= year + "" + month + "" + day;
	var exam_info_num = window.event.target.id;
	
	swal({
		  title: "정말로 삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		}).then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
				  type : "post",
	   			  url : "teacherExamSchedultDelete.do",
	   			  dataType : "text",
	   			  data:{'exam_info_num':exam_info_num,'currentDate':currentDate,'removeData':removeData},
	   			  global:false,
	   			  success : function(data){
	   				  if(data=="n"){
	     					swal({
	     						title : "삭제 실패",
	     						text:'지난 시험일정은 삭제할 수 없습니다.',
	     						icon : "warning",
	     						dangerMode: true
	     					});
	     					}
	   				  else{
					  swal({
							title : "삭제완료",
							icon : "success",
						});
						$('#' + exam_info_num).closest('.deleteline').remove();
	     				}
	   			  },
					error: function(request, status, error){
					alert("request:"+request+"status"+status+"error"+error);
				}
			});
			  
			  
		  } else {
		    
		  }
		});

};
