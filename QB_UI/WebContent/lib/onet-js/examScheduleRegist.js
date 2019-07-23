/* 체크박스 체크시 전체선택 체크 여부 */


$(document).ready(function(){



	/*datepicker*/
	 $( "#exam_info_date" ).datepicker({ minDate: 0, maxDate: "+1M +10D",dateFormat: 'yy-mm-dd' });
	
	 
	 
	 function allCheckFunc( obj ) {
			$("[name=chk]").prop("checked", $(obj).prop("checked") );
	}
		
		
	function oneCheckFunc( obj )
	{
		var allObj = $("#checkall");
		var objName = $(obj).attr("name");

		if( $(obj).prop("checked") )
		{
			checkBoxLength = $("[name="+ objName +"]").length;
			checkedLength = $("[name="+ objName +"]:checked")
			.length;

			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}
		else
		{
			allObj.prop("checked", false);
		}
	}

	/* 각각의 체크박스를 클릭시 전체선택 체크박스도 선택 및 해제되도록 구현 */

		$("#checkall").click(function(){
			allCheckFunc( this );
		});
		
		$("[name=chk]").each(function(){
			$(this).click(function(){
				oneCheckFunc( $(this) );
			});
		});

});
 
 
 
	
	


	






function checktime(){
		
	var start = $('#exam_info_start').val();
	var end = $('#exam_info_end').val();
	
	console.log("onblur");
	var start_hour = start.substring(0,2);
	var end_hour=end.substring(0,2);
	
	var start_m=start.substring(3);
	var end_m = end.substring(3);
	
	
	var start_hour_ms=start_hour*3600;
	var end_hour_ms=end_hour*3600;
	
	var start_m_ms=start_m*60;
	var end_m_ms=end_m*60;
	
	var total_starttime=start_hour_ms + start_m_ms;
	var total_endtime=end_hour_ms + end_m_ms;
	
	var difftime=total_endtime-total_starttime;
	
	var time=document.getElementById("exam_info_time");
	console.log(difftime);
	
	var hour = parseInt(difftime/3600);
	var min = parseInt((difftime%3600)/60);
	var sec = difftime%60;

	if(hour <0 || min < 0){
		
		time.value="00:00:00";
		
	}
	else if(hour<10 &&min<10){
		hour="0"+hour;
		min = "0"+min;
		time.value=hour+":"+min+":0"+sec;
	}
	
	
	else if(hour>=10 && min <10){
		min = "0"+min;
		time.value=hour+":"+min+":0"+sec;
	}
	else if(hour < 10 && min>=10){
		hour="0"+hour;
		time.value=hour+":"+min+":0"+sec;
	}else{
	time.value=hour+":"+min+":0"+sec;}
	}





