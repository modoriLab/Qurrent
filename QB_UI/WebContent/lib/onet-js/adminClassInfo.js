/*
	@JSP:adminClassInfo.js
	@DATE:2018-10-13
	@Author:방민지
	@Desc:클래스관리 js(스토리보드 ??of 41)
*/

$(document).ready(function(){
	
	
	
	var dateFormat = "yy-mm-dd",
    from = $( "#from" )
      .datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        minDate:0
      })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
    to = $( "#to" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 3
    })
    .on( "change", function() {
      from.datepicker( "option", "maxDate", getDate( this ) );
    });

  function getDate( element ) {
    var date;
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }

    return date;
  }
	
	/*수정버튼 눌렀을때 부모창 값을 모달창에 가져오기*/
	$("button[name='updatebtn']").click(function(){
		
		
		action='modify';
		type='PUT';
		memberid=this.value;
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(1).text();
		var member_email_modal=tr.eq(3).text();
		var member_phone_modal=tr.eq(4).text();
		var member_name_modal=tr.eq(2).text();
		var role_code_modal = tr.eq(5).text();
		var class_name_modal = tr.eq(0).text();
		
		$('#cid').val(member_id_modal);
		$('#cemail').val(member_email_modal);
		$('#curl').val(member_phone_modal);
		$('#cname').val(member_name_modal);
		$('#class_name').val(class_name_modal);
		
		
		if(role_code_modal == '학생'){
			$("#agree_s").attr("checked", true);
			$("#agree_t").attr("checked", false);
		}
		else if(role_code_modal == '선생님'){
			$("#agree_t").attr("checked", true);
			$("#agree_s").attr("checked", false);
		}
		
		
		
	});
	
	/*클래스 멤버 수정*/
	$('#classUpdateMemberBtn').click(function() {
		
	
		
		var role_code_val;
		
		if ($('#agree_s').is(":checked"))
			{
			  role_code_val=$('#agree_s').val();
			}
			else if($('#agree_t').is(":checked")){
				role_code_val=$('#agree_t').val();
			}
		
		
		
		
	var class_num_parameter=$('#hidden_class_num2').val();
	console.log("파라미터 클래스이름>>"+class_num_parameter);
		var _param = {member_email:$("#cemail").val(), member_phone:$("#curl").val()
				, member_id:$("#cid").val(), class_name:$("#class_name option:selected").text()
				, role_code:role_code_val }

		var _data = JSON.stringify(_param); //jsonString으로 변환	                                                      
		$.ajax({
   			  type : "post",
   			  url : "adminClassMemberUpdate.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				if($('#cemail').val()==""||$('#curl').val()==""){
   					swal("입력칸을 채워주세요.", "", "error");
   				}else{
   					swal({
   	                   title: "수정 되었습니다",
   	                  text: "",
   	                  icon:"success"
   	               }).then(function() {
   	                   window.location = "adminClassInfo.do?class_num="+class_num_parameter;
   	               });

   				  
   				}

   			  },
   			  error: function(request, status, error){
   				  
  
   				if($("#agree_s").attr("checked", false) && $("#agree_t").attr("checked", false)){
   					alert('권한을 체크해주세요.');
   				}
   			 }


   		});
		
	});	
	
	/*클래스멤버 삭제 */
	var member_id_table;
	var member_id_table_value;
	$("button[name='deletebtn']").click(function(){
		action='delete';
		type='PUT';
		memberid=this.value;
		member_id_table=memberid;
		console.log('삭제할 테이블 아이디값' + memberid);
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(1).text();
		
		member_id_table_value=member_id_modal;
		
	});
	
	
	$('#classDeleteMemberBtn').click(function() {
		
		
		var _param = {member_id:member_id_table_value};

		var _data = JSON.stringify(_param); //jsonString으로 변환	  
		
		var class_num_parameter=$('#hidden_class_num').val();
		
		
		$.ajax({
   			  type : "post",
   			  url : "adminClassMemberDelete.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				  alert("삭제 성공");
   				  location.href="adminClassInfo.do?class_num="+class_num_parameter;
   			  },
   			  error: function(request, status, error){
   				  alert("에러야!");
   			 }
   		});
		
	});	
	
	/*클래스 수정*/
	$('#classUpdateBtn').click(function(){
		
	
		
		var class_num_parameter=$('#hidden_class_num').val();
		console.log("class_num값 :" +$('#hidden_class_num').val()+"클래스이름값:"+$("#updatetab_class_name").val()+", 시작날짜:"+$("#from").val()+", 종료날짜:"+$("#to").val()+",강사이름:"+$("#teacher_name").val());
		var _param = {class_name:$("#updatetab_class_name").val(),class_start_date:$("#from").val()
				, class_end_date:$("#to").val(), teacher_name:$("#teacher_name").val(), class_num:class_num_parameter}
		
		var _data = JSON.stringify(_param); //jsonString으로 변환	 
		
		
		
		$.ajax({
   			  type : "post",
   			  url : "adminClassUpdate.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data, 
   			 processData: false,
  			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				  if($('#teacher_name').val()==""|| $('#form').val()==""||$('#to').val()==""||$('#updatetab_class_name').val()=="" ){
   					swal("입력칸을 채워주세요.", "칸을 채워주세요", "error");
   					  
   				  }
   				  else{
   					swal({
    	                   title: "수정 되었습니다",
    	                  text: "",
    	                  icon:"success"
    	               }).then(function() {
    	                   window.location = "adminClassInfo.do?class_num="+class_num_parameter;
    	               });
   				  }
   			  }
   		});
		
		
		
	});
	
});

function oneCheckbox(a){

    var obj = document.getElementsByName("agree");

    for(var i=0; i<obj.length; i++){

        if(obj[i] != a){

            obj[i].checked = false;

        }

    }

}

/*클래스이름 체크*/
var namecheck = false;

function confirmName() {
	var val = document.getElementById("updatetab_class_name").value;
	var iddiv = document.getElementById("namediv");
	if (val == "") {
		iddiv.innerHTML = "클래스이름을 입력해주세요";
		iddiv.style.color = 'green';
		namecheck = false;

	} else {
		$.ajax({
			url : 'classNameCheck.do',
			data : {
				'class_name' : val
			},
			dataType : 'json',
			success : function(data) {
			
				if (data.result == true) {
					iddiv.innerHTML = "사용가능한 이름 입니다.";
					iddiv.style.color = 'blue';
					namecheck = true;
				}
				else if($('#hiddenName').val()==val){
					iddiv.innerHTML = "사용가능한 이름 입니다.";
					iddiv.style.color = 'blue';
					namecheck = true;
				}
				else {
					iddiv.innerHTML = "사용 불가능한 이름입니다.";
					iddiv.style.color = "red";
					namecheck = false;
				}
	
			}
		});
	}
}
