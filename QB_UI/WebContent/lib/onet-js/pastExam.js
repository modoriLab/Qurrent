/**
 *  10.23 현이 수정
 */

	$(document).ready(function(){
		/*지난 시험지 보기*/
		$('#pastExamBtn').click(function() {
			
			var popUrl = "pastExamPaper.do?exam_info_num=" + $('#pastExamBtn').val();
			var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";
	
			window.open(popUrl, "지난 시험보기",popOption);
		});
		
		$('#search_btn').click(function(){
			alert($('#search_input').val()+" || 검색을 시작합니다.");
		});
		
	}); // document.ready 

