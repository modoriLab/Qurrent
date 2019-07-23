/*
  	@JS:myPage.js
	@JSP:myPage.jsp
	@DATE:2018-10-16
	@Author:양회준
	@Desc:마이페이지(스토리보드 12,13,14 of 41) - 개인정보 수정 및 탈퇴
*/

//양회준 10.16 - 비밀번호변경 활성 비활성 체크박스

$("#passwordChangeChk").change(function(){
	if(this.checked){
		$("#modify_member_pwd").removeAttr("name");
		$("#passwordChange").attr("disabled", false);
		$("#passwordChangeConfirm").attr("disabled", false);
		$("#pwddiv").show();
		$("#pwdcheckdiv").show();
	}else{
		$("#modify_member_pwd").attr("name", "member_pwd");
		$("#passwordChange").attr("disabled", true);
		$("#passwordChangeConfirm").attr("disabled", true);
		$("#pwddiv").hide();
		$("#pwdcheckdiv").hide();
	}
});

//양회준 10.16 - 이메일변경 활성 비활성 체크박스
$("#emailChangeChk").change(function(){
	if(this.checked){
		$("#member_email").attr("readonly", false);
		$("#emailCodeCheck").attr("disabled", false);
		$("#emailCodeRquestBtn").attr("disabled", false);
		$("#emailCodeCheckBtn").attr("disabled", false);
	}else{
		$("#member_email").attr("readonly", true);
		$("#emailCodeCheck").attr("disabled", true);
		$("#emailCodeRquestBtn").attr("disabled", true);
		$("#emailCodeCheckBtn").attr("disabled", true);
	}
});

//양회준 10.16 - 개인정보 수정 비밀번호 확인
$('#infoModifiy').click(function() {
	if(($("#passwordChangeChk").is(":checked")==true)&&($("#emailChangeChk").is(":checked")==true)){
		if(pwdcheck==false || pwdcheck2==false){
			swal("Error!", "비밀번호를 다시 설정해 주십시오!", "error");
		}else if(mailcheck==false || mailNumberChk==false){			
			swal("Error!", "이메일 인증이 안되었습니다!", "error");
		}else{
			modifySubmit();
		}
	}else if($("#passwordChangeChk").is(":checked")==true){
		if(pwdcheck==false || pwdcheck2==false){
			swal("Error!", "비밀번호를 다시 설정해 주십시오!", "error");
		}else{
			modifySubmit();
		}		
	}else if($("#emailChangeChk").is(":checked")==true){
		if(mailcheck==false || mailNumberChk==false){
			swal("Error!", "이메일 인증이 안되었습니다!", "error");
		}else{
			modifySubmit();
		}
	}else{
		modifySubmit();
	}
});

function modifySubmit(){
	$.ajax({
		type: 'post',
		url : 'memberDrop.do',
		global:false,
		data : {
				"member_id" : $("#modify_member_id").val(), 
				"member_pwd" : $("#modify_member_pwd").val()
				},
		success : function(data) {
			if (data == 0){
				swal("Error!", "비밀번호가 입력되지 않았거나 일치하지 않습니다!", "error");
			} else {
				swal({
					  title:"수정 확인",
					  text: "정말 수정 하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDrop) => {
					  if (willDrop) {
					    swal("성공적으로 수정하였습니다.", {
					      icon: "success",					      
					    })
					    .then((Chk) => {
                          swal.setActionValue(
                                          document.getElementById('memberModifyFrm').submit()
                                          );                                                    
					    });
					  } else {
					    swal("수정이 취소되었습니다.");
					  }
					});				
			}		
		},
		error : function(error) {
			swal("Error!", "전송 실패!", "error");
		}
	});
}
//양회준 10.16 - 회원탈퇴 비밀번호 확인
$('#memberDropBtn').click(function() {	
	$.ajax({
		type: 'post',
		url : 'memberDrop.do',
		global:false,
		data : {
				"member_id" : $("#drop_member_id").val(), 
				"member_pwd" : $("#drop_member_pwd").val()
				},
		success : function(data) {
			if (data == 0){
				swal("Error!", "비밀번호가 입력되지 않았거나 일치하지 않습니다!", "error");
			}else {
				swal({
					  title:"탈퇴 확인",
					  text: "정말 탈퇴 하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDrop) => {
					  if (willDrop) {
					    swal("성공적으로 탈퇴하였습니다.", {
					      icon: "success",					      
					    })
					    .then((Chk) => {
                            swal.setActionValue(
                                            document.getElementById('memberDropFrm').submit()
                                            );                                                    
					    });
					  } else {
					    swal("탈퇴가 취소되었습니다.");
					  }
					});
			}
		},
		error : function(error) {
			swal("Error!", "전송 실패!", "error");
		}
	});
});

//비밀번호 유효성 검사
var pwdcheck = false;
var pwdcheck2 = false;

function confirmPwd() {
	var pwd = document.getElementById("passwordChange");
	var pwddiv = document.getElementById("pwddiv");

	var p1 = /[0-9]/;
	var p2 = /[a-zA-Z]/;
	var p3 = /[~!@#$%^&*()]/;

	if (!p1.test(pwd.value) || !p2.test(pwd.value) || !p3.test(pwd.value)
			|| pwd.value.length < 8) {

		pwddiv.innerHTML = "비밀번호는 8자 이상 숫자, 영문자, 특수문자를 포함해야 합니다.";
		pwddiv.style.color = '#ff6600';
		pwdcheck = false;
	} else {
		pwddiv.innerHTML = "안전한 비밀번호입니다.";
		pwddiv.style.color = 'dodgerblue';
		pwdcheck = true;
	}
	pwdcheck = true;
}

function confirmPwd2() {
	var pwd = document.getElementById("passwordChange");
	var pwdcheck = document.getElementById("passwordChangeConfirm");
	var pwdcheckdiv = document.getElementById("pwdcheckdiv");

	if (pwd.value != pwdcheck.value) {
		pwdcheckdiv.innerHTML = "비밀번호가 일치하지 않습니다.";
		pwdcheckdiv.style.color = '#ff6600';
		pwdcheck2 = false;
	} else {
		pwdcheckdiv.innerHTML = "일치합니다.";
		pwdcheckdiv.style.color = 'dodgerblue';
		pwdcheck2 = true;
	}
}
//인증번호 메일 보내기
var mailcheck = false;
var mailNumberChk = false;
var mailtonumber;
$('#emailCodeRquestBtn').click(function() {
	$("#emailCodeRquestBtn").removeAttr("class");
	$("#emailCodeRquestBtn").attr("class", "btn btn-theme02 myPageBtnControl");
	$.ajax({
		type : 'post',
		url : $('#contextPath').val()+"/index/mail.do",
		data : {
			mailto : $('#member_email').val(),
			command : "mailCheck",
			member_id : $('input[name="member_name"]').val()
		},
		success : function(data) {
			swal("성공!", "메일로 인증번호가 전송되었습니다!", "success");
			mailtonumber = data;
			mailcheck = true;
		},
		error : function(error) {
			swal("실패!", "인증 메일 전송 실패!", "error");
		}
	});
});

//인증번호 확인
$('#emailCodeCheckBtn').click(function() {	
	var mailnumber = document.getElementById("emailCodeCheck");		
	if(mailnumber.value != mailtonumber){
		swal("Error!", "인증번호가 일치하지 않습니다!", "error");
		document.getElementById("emailCodeCheck").focus();
		mailNumberChk = false;
	}
	else {
		swal("성공!", "인증번호가 확인되었습니다!", "success");
		$("#emailCodeCheckBtn").removeAttr("class");
		$("#emailCodeCheckBtn").attr("class", "btn btn-theme02 myPageBtnControl");
		mailNumberChk = true;
	}
});
