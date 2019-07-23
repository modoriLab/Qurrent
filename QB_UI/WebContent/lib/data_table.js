/**
 * 18.10.09 김현이 파일 생성
 * 데이터 테이블 관련 script 기술
 */

$(document).ready(function() {
	$('#myTable').DataTable({
		"columnDefs" : [ {
			"width" : "15%",
			"targets" : 3
		} ]
	});

	$('#AdminTable').DataTable({
		"columnDefs" : [ {
			"width" : "15%",
			"targets" : 3
		} ]
	});

	// 재훈 - 관리자 문제분류관리 페이지 데이터테이블
	$('table.display').DataTable({
		"columnDefs" : [ {
			"width" : "20%",
			"targets" : 0,
			"width" : "50%",
			"targets" : 1,
			"width" : "30%",
			"targets" : 2
		} ]
	});

	// 영준 - 관리자 회원관리 페이지 데이터테이블
	$('#adminMemberTable').DataTable();

	$('table.display').DataTable({

	});

});
