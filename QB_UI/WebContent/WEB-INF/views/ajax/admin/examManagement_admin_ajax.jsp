<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:if test="${fn:length(classList) eq 0 and begin eq 0}">
	<div class="emptydata">
		<img src="${pageContext.request.contextPath}/img/exam-empty4.png" class="img-empty">
		<h1>내 시험지가 없습니다.</h1>
	</div>
</c:if>
	<c:forEach items="${classList}" var="classlist">
		<div class="col-lg-12 deleteline">
			<div class="div-left miri" id="${classlist.exam_paper_num}" data-target="#exam_preview" data-toggle="modal">
				<img src="" class="testIcon">
				<div class="middle">
					<img src="${pageContext.request.contextPath}/img/qsearch.png" class="miriIcon">
				</div>
			</div>
			<div class="exam-paper-name">
				<h4>
					<strong>${classlist.exam_paper_name}</strong>
					<se:authorize access="hasRole('ROLE_ADMIN')">
					<span> ( 출제자 : ${classlist.member_id } / ${classlist.class_name } )</span>
					</se:authorize>
				</h4>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil"></i> ${classlist.exam_paper_desc}
				</p>
			</div>
			<div class="pdf_download div-right">
				<a href="#" class="miri" id="${classlist.exam_paper_num}" data-target="#exam_preview" data-toggle="modal"><i class="fa fa-print"></i>시험지 미리보기</a>&nbsp;
				<se:authorize access="hasRole('ROLE_TEACHER')">
				<button type="button" class="btn btn-theme buttonGroupp"
					onclick="location.href='examScheduleRegist.do?exam_paper_num=${classlist.exam_paper_num}&exam_paper_name=${classlist.exam_paper_name}'">시험등록</button>
				</se:authorize>
				<button type="button" id="${classlist.exam_paper_num}"
					class="btn btn-theme buttonGroupp" onclick="updateExamCheck()">시험지수정</button>
				<button type="button" id="${classlist.exam_paper_num}"
					class="btn btn-theme04 buttonGroupp" onclick="deleteExamCheck()"
					value="${classlist.exam_paper_name }">삭제</button>
				<input type="hidden" id="hidden_class_num"
					value='${param.class_num}'>
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