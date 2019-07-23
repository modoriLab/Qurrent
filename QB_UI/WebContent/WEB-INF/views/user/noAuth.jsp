<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.noAuthBack {
	text-align: center;
}
.authLogoutBtn{
	text-align: center;
}
.back{
	margin-top: 25%;
}
.noAuthText{
	color:white;
}

</style>
	<div class="back">
	<div class="noAuthBack">
	<h1 class="noAuthText">아직 등록된 클래스가 없습니다.</h1>
		<h3 class="noAuthText">회원 가입시 선택했던 클래스에 등록하는 절차가 진행 중입니다.</h3>
		<h3 class="noAuthText">관리자가 해당 회원님의 클래스를 등록할 때까지 기다려 주세요.</h3>
		<br> 
		<div class="noAuthBtn">
		<a class="btn btn-theme confirm authLogoutBtn"
			href="${pageContext.request.contextPath}/logout">Logout</a>
	</div>
</div>
</div>







<script>
	$.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
		speed : 500
	});
</script>