/*
 * 한결
 * 10.13 examScheduleDetail.js 추가

 */
$(document).ready(function(){
	
	/*시험 응시*/
	$('#examBtn').click(function() {
		var popUrl = "examPaperDo.do?exam_info_num=${dto.exam_info_num}";
		var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";

		window.open(popUrl, "지난 시험보기",popOption);
	});
	
});
