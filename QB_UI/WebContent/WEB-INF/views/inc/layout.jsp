<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<title>Welcome QB</title>


<!-- jquery UI -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<%-- 회준 css 시작 --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.css" />
	
	--%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/bootstrap-timepicker/compiled/timepicker.css" />

<%--
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/bootstrap-datetimepicker/css/datertimepicker.css" />
--%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/zabuto_calendar.css">



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">	**에러 **  -->


<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/gritter/css/jquery.gritter.css" /> --%>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style-responsive.css"
	type="text/css" rel="stylesheet" />

<!-- 현이 로딩 이미지 css 시작 -->
<link href="${pageContext.request.contextPath}/css/loading.css"
	rel="stylesheet">

<!-- 재훈 - summernote 관련 css  시작  -->
<link
	href="${pageContext.request.contextPath}/lib/summernote/summernote.css"
	rel="stylesheet">
<!-- 재훈 - summernote 관련 css 끝  -->

<script
	src="${pageContext.request.contextPath}/lib/chart-master/Chart.js"></script>

<!-- DataTables 관련 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/buttons.dataTables.css">
	
<!-- hover css -->
<link href="${pageContext.request.contextPath}/css/hover.css" rel="stylesheet" media="all">
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<!-- 로딩 이미지 -->
	<div class="loadingDiv loadingDisplay">
		<img src="${pageContext.request.contextPath}/img/loading2.gif" alt="loadingImage" class="loadingImg">
	</div>
	<section id="container"> <!-- 헤더 부분 --> <tiles:insertAttribute
		name="header" /> <!-- 사이드바 부분 --> <tiles:insertAttribute
		name="sidebar" /> <!-- 컨텐츠 부분 --> <tiles:insertAttribute
		name="content" /> <!-- 푸터부분 --> </section>

	<tiles:insertAttribute name="footer" />
	<!-- js placed at the end of the document so the pages load faster -->
	<%--  <script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script> --%>

	<script
		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
	<%-- <script
		src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js"
		type="text/javascript"></script> --%>
	<script
		src="${pageContext.request.contextPath}/lib/jquery.sparkline.js"></script>
	<!--common script for all pages-->
	<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
	<%-- 	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/gritter/js/jquery.gritter.js"></script> --%>
	<%-- 	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/gritter-conf.js"></script> --%>
	<!--script for this page-->
	<script src="${pageContext.request.contextPath}/lib/sparkline-chart.js"></script>
	<script src="${pageContext.request.contextPath}/lib/zabuto_calendar.js"></script>

	<!-- 재훈 - summernote 관련 js 시작  -->
	<script
		src="${pageContext.request.contextPath}/lib/summernote/summernote.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/summernote/lang/summernote-ko-KR.js"></script>
	<!-- 재훈 - summernote 관련 js 끝  -->

	<script type="application/javascript">
		
		
		
	$(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
      //알수 없음 - 임시
		/* $('#myTable').DataTable({
			"columnDefs" : [{
				"width" : "15%",
				"targets" : 3
			}]
		}) */;
	<!-- 재훈 - 관리자 문제분류관리 페이지 데이터테이블 시작-->
	
	/* $('table.display').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
        }
	}); */
	//공지사항
	$('#noticetable').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
        },
        "order": [[ 0, "desc" ]]
	});
	//학생&성적관리-클래스통계
	/* $('#studentPerGrade').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
        }
	}); */
	//시험공지
	$('#noticetable2').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
        },
        "order": [[ 2, "desc" ]]
	});

	//관리자 클래스 관리
	$('#AdminTable').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
        }
	});
	//관리자 문제 분류 관리(소,중,대)
	$('#table_smCategory').DataTable({
			"ordering": false,
			"scrollY":"390px",
	       "scrollCollapse": true,
	       "paging": false,
	       "searching": false,
	       "language": {
	            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
	        }
		});
	$('#table_mdCategory').DataTable({
			"ordering":false,
			"scrollY":"390px",
	       "scrollCollapse": true,
	       "paging":false,
	       "searching": false,
	       "language": {
	            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
	        }
	});
	$('#table_lgCategory').DataTable({
		"ordering":false,
		"scrollY":"390px",
       "scrollCollapse": true,
       "paging":false,
       "searching": false,
       "language": {
           "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
       }
	 });
	  
});

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  
	
	
	</script>

	<!-- 재훈 - 문제 만들기 페이지 시작-->
	<script type="text/javascript">
		$(function() {
			$('.summernote1').summernote({
				height : 300, // 기본 높이값
				minHeight : null, // 최소 높이값(null은 제한 없음)
				maxHeight : null, // 최대 높이값(null은 제한 없음)
				focus : true, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
			});

			$('.summernote2').summernote({
				height : 100, // 기본 높이값

				minHeight : null, // 최소 높이값(null은 제한 없음)
				maxHeight : null, // 최대 높이값(null은 제한 없음)
				focus : true, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
			});

			$(this).ajaxStart(function() { // ajax 실행 시 로딩 이미지를 보여줌
				$('.loadingDisplay').show();
			});
			$(this).ajaxStop(function() {
				setTimeout(function() {
					$('.loadingDisplay').hide();
				}, 300);
			});
		});
	</script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

	<!-- 양회준 11.3 데이터테이블 추가기능 -->
	<script type="text/javascript" charset="utf8"
		src="${pageContext.request.contextPath}/lib/datatables/dataTables.buttons.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="${pageContext.request.contextPath}/lib/datatables/pdfmake.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="${pageContext.request.contextPath}/lib/datatables/vfs_fonts.js"></script>
	<script type="text/javascript" charset="utf8"
		src="${pageContext.request.contextPath}/lib/datatables/buttons.html5.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="${pageContext.request.contextPath}/lib/datatables/buttons.colVis.js"></script>
	<!-- 테이블 관련 end -->

	<!--script for this page-->
	<script
		src="${pageContext.request.contextPath}/lib/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/lang/ko.min.js"></script>
	회준 js 시작
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
		--%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

	<script
		src="${pageContext.request.contextPath}/lib/advanced-form-components.js"></script>

</body>
</html>