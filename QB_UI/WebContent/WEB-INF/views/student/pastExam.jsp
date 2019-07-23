<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.examComment{
		display: none;
	}

</style>
<link
	href="${pageContext.request.contextPath}/css/studentPastExam.css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/lib/onet-js/pastExam.js"></script> --%> <!-- 일단은 주석처리, 나중에 script 파일로 빼기 -->
<script>
	$(document).ready(function(){
		$('#search_btn').click(function(){
			$.ajax({
				url : 'searchPastExamKeyword.do',
				type : 'get',
				data : { 'keyword': $('#search_input').val()}, 
				success : function(data) {	
					if(data.length == 0) {
						$('#last_exam_table').empty();
						var html = "";
						html += '<h3>검색 결과가 없습니다. </h3>';
						$('#last_exam_table').append(html);
						return false;
					} else {
						$('#last_exam_table').empty();
						$.each(data, function(index, entry){	
							var html = "";
							html += '<tr class="exam_line"><td class="pastExamTd">';
							html += '<h3>' + data[index].exam_info_name + '</h3>';
							html += '<span>'+ data[index].exam_info_desc +'</span><div class="examComment"><strong>강사님 : '+data[index].score_chart_comment+'</strong></div>';
							html += '</td><td class="pastExamTd"><div>시험 날짜 : ';
							html += data[index].exam_info_date;
							html += '</div><div>시험 시간 : ';
							html += data[index].exam_info_start +' ~ '+ data[index].exam_info_end;
							html += '</div><div>[' + data[index].exam_info_time + ']</div></td>';
							html += '<td class="btn_td">';
							html += '<button class="btn btn-theme pastExamBtn" id="" value="'+data[index].exam_info_num+'">다시 보기</button> ';
							html += '<button class="btn btn-theme ExamCommentBtn" id="" value="'+data[index].score_chart_comment+'">평가 보기</button>';
							html += '<input type="hidden" value="'+data[index].exam_info_date+'_'+data[index].exam_info_end+'"/>';
							html += '</td></tr>';
							
							$('#last_exam_table').append(html);
						});  // foreach 반복문 끝	
					}
				} 
			});
		});  // keyword 검색 끝 
		
		$(document).on('click', '.pastExamBtn', function(){	//	ajax로 가져온 버튼이 안 먹을 때 click 이벤트
			
			var now = new Date().getTime();  //  현재 시간을 timestamp으로 계산
			var examEndTime = $(this).siblings("input").val();		//	시험 종료 시간을 timestamp 으로 계산
			
			var year = examEndTime.substr(0, 4);
			var month = examEndTime.substr(5, 2);
			var day = examEndTime.substr(8, 2);
			var hour = examEndTime.substr(11, 2);
			var minute = examEndTime.substr(14, 2);
			
			var examEndTimeTs = new Date(year, month-1, day, hour, minute).getTime();
			
			 if( examEndTimeTs < now ){   // 지난 시험 열람 가능
				var popUrl = "pastExamPaper.do?exam_info_num=" + $(this).val();
				var popOption = "width="+ screen.availWidth +", height=" + screen.availHeight + ", left=0, top=0"; 
				window.open(popUrl, "지난 시험보기", popOption); 
			   } else if ( examEndTimeTs > now ){	//	시험 응시 시간이 지나지 않았다면 열람 불가능
				swal("\n시험 시간이 종료되고 열람이 가능합니다.");
			 }   
		});

		$(document).on('click','.ExamCommentBtn',function(){
			var comment=$(this).val();
			swal({
				title:"시험평가", 
				text:comment,
				button:"확인"
				});			
		});
		
	});	//	document.ready 끝 
</script> 

<!-- 학생 - 지난 시험 보기-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
		<div class="col-lg-12">
			<div class="row content-panel">
				<!-- /panel-heading -->
				<div class="panel-body">
					<div id="overview" class="all_class_div">
						<table class="title_table">
							<tr>
								<td class="title_table_fst_td">
									<p id="student_name">${member_comment[0].member_name}</p>  
								</td>
							</tr>
							<tr>
								<td>
								<div class="search_box">
										<input type="text" class="form-control" id="search_input" placeholder="키워드를 입력하세요.">
										<button class="btn btn-theme" id="search_btn">검색</button>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="last_exam_div">
							<table id="last_exam_table">
								<!-- 하나의 시험정보 시작 -->
								<c:forEach var="examInfo" items="${examInfoList}" varStatus="status">
									<tr class="exam_line">
										<td class="pastExamTd">
											<h3>${examInfo.exam_info_name}</h3> 
											<div>${examInfo.exam_info_desc}</div>
											<div class="examComment"><strong>강사님 : ${member_comment[status.index].score_chart_comment}</strong></div>
										</td>
										<td class="pastExamTd">
											<div>시험 날짜 : ${examInfo.exam_info_date}</div>
											<div>시험 시간 : ${examInfo.exam_info_start} ~ ${examInfo.exam_info_end}</div>
											<div>[${examInfo.exam_info_time}]</div>
										</td>
										<td class="btn_td">
											<button class="btn btn-theme pastExamBtn" id="" value="${examInfo.exam_info_num}">시험지</button>
											<button class="btn btn-theme ExamCommentBtn" id="" value="${member_comment[status.index].score_chart_comment}">평가 보기</button>
											<input type="hidden" value="${examInfo.exam_info_date}_${examInfo.exam_info_end}"/>
										</td>
									</tr>
								</c:forEach>
								<!-- 하나의 시험정보 끝 -->
							</table>
						</div>
					</div>
					<!-- /tab-content -->
				</div>
				<!-- /panel-body -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- /col-lg-12 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>