<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:if test="${fn:length(myTempExamList) eq 0 and begin eq 0}">
	<div class="emptydata">
		<img src="${pageContext.request.contextPath}/img/exam-empty4.png" class="img-empty">
		<h1>임시저장된 시험지가 없습니다.</h1>
	</div>
</c:if>
<c:forEach items="${myTempExamList}" var="myTempExamList">
	<!-- 시험지 한 개 시작 -->
	<div class="col-lg-12 deleteline">
		<div class="div-left miri" id="${myTempExamList.exam_paper_num}" data-target="#exam_preview" data-toggle="modal">
			<img src="" class="testIcon">
			<div class="middle">
				<img src="${pageContext.request.contextPath}/img/qsearch.png" class="miriIcon">
			</div>
		</div>
		<div class="exam-paper-name">
			<h4>
				<strong>${myTempExamList.exam_paper_name}</strong>
			</h4>
		</div>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil"></i> ${myTempExamList.exam_paper_desc}
		
		<div class="pdf_download div-right">
			<button type="button" class="btn btn-theme buttonGroupp"
				onclick="location.href='tempUpdateExamView.do?exam_paper_num=${myTempExamList.exam_paper_num}&exam_paper_name=${myTempExamList.exam_paper_name}'">시험지
				수정</button>
			<button type="button" id="${myTempExamList.exam_paper_num}"
				class="btn btn-theme04 buttonGroupp" onclick="deleteTempExamCheck()">삭제</button>
			<input type="hidden" id="hidden_class_num" value='${param.class_num}'>
		</div>
	</div>
</c:forEach>
<script>
$(document).ready(function(){
	$('.miri').click(function(){
		var exam_paper_num = $(this).attr('id');
		
			 $.ajax({
				  url : "../teacher/examMiri.do",
				  type:'GET',
				  data : {
					  'exam_paper_num' : exam_paper_num
				  },
				  dataType:"html",
				  success:function(data){
					  $('.book').html(data);
				  }
			   });
	   });
	$(document).ready(function(){
		$(".testIcon").each(function(){
			var testIcon = $(this);	
			var code= testIcon.parents().children('.exam-paper-name').children('h4').children('strong').eq(0).text().charCodeAt(1)%6;	
			for(var i=0;i<6;i++){
				switch(code){
					case i: testIcon.attr("src","${pageContext.request.contextPath}/img/testIcon/exam"+i+".png"); break;
				}
			}
		});
	});

});

</script>