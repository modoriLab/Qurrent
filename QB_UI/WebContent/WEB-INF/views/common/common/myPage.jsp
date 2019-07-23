<%-- 
	@JSP:myPage.jsp
	@DATE:
	@Author:김현이
	@Desc:마이페이지(스토리보드 12,13,14 of 41)
	
	@JSP:myPage.jsp
	@DATE:18.10.16
	@Author:양회준
	@Desc:마이페이지(스토리보드 12,13,14 of 41) - front & back 작업
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="${pageContext.request.contextPath}/css/myPage.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
			<%-- 탭 머리 시작--%>
				<div class="panel-heading">
                	<ul class="nav nav-tabs nav-justified">
                  		<li class="active">
                   		<a data-toggle="tab" href="#personalInfo">개인정보 수정</a>
                  		</li>
                  		<li>
                    	<a data-toggle="tab" href="#unregister" class="contact-map">회원 탈퇴</a>
                  		</li>
                	</ul>
              	</div>
			<%-- 탭 머리 종료 --%>
			<%-- 탭 몸통 시작 --%>
				<div class="panel-body">
                <div class="tab-content">
                <%--개인정보 수정 탭 시작 --%>
                  <div id="personalInfo" class="tab-pane active">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">개인정보 수정</h4>
                        <%-- 개인정보 수정 폼 시작 --%>
                        <form role="form" id="memberModifyFrm"class="form-horizontal formArrayHyunyi" method="post" action="myPage.do">
                        <%-- 아이디 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label">아이디</label>
                            <div class="col-lg-7">
                              <input type="text" id="modify_member_id" class="form-control" name="member_id" readonly value="${memberDto.member_id}">
                            </div>
                          </div>
                          <%-- 기존 비밀번호 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label">기존 비밀번호</label>
                            <div class="col-lg-7">
                              <input type="password" placeholder="기존 비밀번호를 입력해주세요." id="modify_member_pwd" class="form-control" name="member_pwd">
                            </div>
                          </div>
                          <%-- 비밀번호 변경 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label">비밀번호 변경
                             <input type="checkbox" class="ez-checkbox" id="passwordChangeChk" style="height: auto">
                            </label>                           
                            <div class="col-lg-7">
                              <input type="password" placeholder="새 비밀번호를 입력해주세요." class="form-control" id="passwordChange" name="member_pwd" onblur="confirmPwd()" disabled>
                            </div>
                            <div class="col-lg-offset-4 col-lg-7" id="pwddiv"></div> <%-- 비밀번호 유효성 결과 출력 --%>
                          </div>
                          	
                        <%-- 비밀번호 확인 --%>  	
                          <div class="form-group">
                            <label class="col-lg-4 control-label">비밀번호 확인</label>
                            <div class="col-lg-7">
                              <input type="password" placeholder="새 비밀번호를 한번 더 입력해주세요." id="passwordChangeConfirm" class="form-control" onblur="confirmPwd2()" disabled>
                            </div>
                            <div class="col-lg-offset-4 col-lg-7" id="pwdcheckdiv"></div> <%-- 비밀번호 일치 결과 출력 --%>
                          </div>
                          
                         <%-- 이름 --%> 
                          <div class="form-group">
                            <label class="col-lg-4 control-label">이름</label>
                            <div class="col-lg-7">
                              <input type="text" placeholder="name" class="form-control" name="member_name" readonly value="${memberDto.member_name}">
                            </div>
                          </div>  
                          <%-- 핸드폰 --%>      
                        <div class="form-group">
                            <label class="col-lg-4 control-label">핸드폰</label>
                            <div class="col-lg-7">
                              <input type="text" placeholder="HP" id="country" class="form-control" name="member_phone" value="${memberDto.member_phone}">
                            </div>
                          </div>
                          <%-- 이메일 변경 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label"><p style="display: inline-block">이메일 변경</p>
                              <input type="checkbox" class="ez-checkbox" id="emailChangeChk" style="height: auto">
                            </label>
                            <div class="col-lg-7">
                                  <input type="text" placeholder="email" id="member_email" class="form-control inlineTextField" name="member_email" value="${memberDto.member_email}" readonly>
                                  <button class="btn btn-theme myPageBtnControl" type="button" id="emailCodeRquestBtn" disabled>인증번호 요청</button> 
                            </div>
                          </div>
                          <%-- 인증번호 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label">인증번호</label>
                            <div class="col-lg-7">
                                  <input type="text" placeholder="인증번호" class="form-control inlineTextField" id="emailCodeCheck" disabled>
                                  <button class="btn btn-theme myPageBtnControl" type="button" id="emailCodeCheckBtn" disabled>인증번호 확인</button>
                            </div>
                          </div>
                          <%-- 정보 수정&취소 버튼 --%>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="button" id="infoModifiy">정보 수정</button>
                                <button class="btn btn-theme04" type="reset" id="modifyCancel">취소</button>
                            </div>
                          </div>
                        </form>
                        <%-- 개인정보 수정 폼 종료 --%>
                      </div>
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <%-- 개인정보 수정 탭 종료 --%>
                  
                  <%-- 회원 탈퇴 탭 시작 --%>
                    <div id="unregister" class="tab-pane">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">회원 탈퇴</h4>
                        <%--회원탈퇴 폼 시작 --%>
                        <form role="form" class="form-horizontal formArrayHyunyi" id="memberDropFrm" action="myPageDrop.do">
                          <%-- 아이디 --%>
                          <div class="form-group">  
                            <label class="col-lg-4 control-label">아이디</label>
                            <div class="col-lg-7">
                              <input type="text" id="drop_member_id" class="form-control" name="member_id" readonly value="${memberDto.member_id}">
                            </div>
                          </div>
                          <%-- 비밀번호 --%>
                          <div class="form-group">
                            <label class="col-lg-4 control-label">비밀번호</label>
                            <div class="col-lg-7">
                              <input type="password" placeholder="비밀번호를 입력해주세요." id="drop_member_pwd" class="form-control" name="member_pwd">
                            </div>
                          </div>
                          <%-- 회원탈퇴&취소 버튼 --%>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="button" id="memberDropBtn" >회원 탈퇴</button>
                                <button class="btn btn-theme04" type="button" id="dropCancel">취소</button>
                            </div>
                          </div>
                        </form>
                        <%-- 회원탈퇴 폼 종료 --%>
                      </div>
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <%-- 회원 탈퇴 탭 종료 --%>      
                </div>
                <!-- /tab-content -->
              </div>
              <%-- 탭 몸통 종료--%>			
			</div><!-- row content-panel -->
		</div><!-- col-lg-12 mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->

<%-- javascript --%>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
<script src="${pageContext.request.contextPath}/lib/onet-js/myPage.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>