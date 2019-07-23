<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="${pageContext.request.contextPath}/css/adminMessage.css"
   rel="stylesheet">
<style>
.receiveBtn {
   color: #3163C9;
   text-decoration: underline;
}
.sendBtn{
   color: #3163C9;
   text-decoration: underline;
}
.textarea{
   resize: none;
}
.th1{
   text-align: center;
   width:100px;
}
.th2{
   
   width:100px;
}
.th3{
   text-align:center;
   width:200px;
}
.th4{
   
   width:100px;
}
.th5{
   text-align: center;
   width:100px;
}
.to{
   color:orange;
}
.sendMessageDelete{
   font-size: 14px;
   color: red;
   cursor: pointer;
}
.receiveMessageDelete{
   font-size: 14px;
   color: red;
   cursor: pointer;
}
#message_content{
   resize:none;
   border-radius: 4px;
}
.textareadiv{
   margin-left: -30px;
}
.newMessageAll{
   background: #8C8C8C;
   
}
#allchoose{
   color: #f1f1f1;
}
.allchooseicon{
   color: #f1f1f1;
}
.msgBtn{
width:80px;
margin-left:0px;
margin-right:15px;
}
.s{
margin-right: -2px;
}

</style>
<script
   src="${pageContext.request.contextPath}/lib/onet-js/myMessage.js"></script>
<!-- 쪽지보기 모달창 -->
<div class="modal fade" id="MessageModal1" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">쪽지 확인</h4>
         </div>
         <div class="modal-body">
            <!-- /col-lg-12 -->
            <div id="messageform">
               <div class="mail-sender">
                  <div class="row">
                     <div class="col-md-8">
                        <img src="img/ui-zac.jpg" alt=""> <input type="hidden"
                           class="messageReceive"><strong class="receiverName"></strong><span class="to"> To </span> <strong>Me</strong>
                     </div>

                     <div class="col-md-4">
                        <p class="date"></p>
                     </div>
                  </div>
               </div>
               <div class="view-mail">
                  <p class="messageText"></p>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <div class="form-group">
               <div class="col-lg-offset-2 col-lg-10">
                  <button class="btn btn-large btn-primary messageBtn" type="button" id="">답장하기</button>
                  <button class="btn btn-theme04" type="button" data-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- 쪽지보기 모달창 끝 -->
<!-- 쪽지보기 모달창 2 시작 -->
<!-- 쪽지보기 모달창 -->
<div class="modal fade" id="MessageModal2" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">쪽지 확인</h4>
         </div>
         <div class="modal-body">
            <!-- /col-lg-12 -->
            <div id="messageform">
               <div class="mail-sender">
                  <div class="row">
                     <div class="col-md-8">
                        <img src="img/ui-zac.jpg" alt="">
                        <span class="to">To</span>
                         <strong class="messageSender"></strong>
                     </div>

                     <div class="col-md-4">
                        <p class="date"></p>
                     </div>
                  </div>
               </div>
               <div class="view-mail">
                  <p class="messageText"></p>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <div class="form-group">
               <div class="col-lg-offset-2 col-lg-10">
                  <button class="btn btn-theme04" type="button" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>

      </div>
   </div>
</div>
<!-- 쪽지보기 모달창2 끝 -->
<!-- 답장 모달창 시작 -->
<!-- 쪽지보기 모달창 -->
<div class="modal fade" id="MessageReplyModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">답장</h4>
         </div>
         <div class="modal-body">
            <!-- /col-lg-12 -->
            <div id="messageform">
               <div class="mail-sender">
                  <div class="row">
                     <div class="col-md-8">
                        <img src="img/ui-zac.jpg" alt="">
                        <span class="to">To&nbsp;&nbsp;</span><strong class="receiver"></strong>
                     </div>
                     <!-- <input type="hidden" class="receiver"> -->
                  </div>
               </div>
               <div class="view-mail">
                  <textarea rows="10" cols="75" class="textarea" style="width:480px;"></textarea>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <div class="form-group">
               <div class="col-lg-offset-2 col-lg-10">
                  <button class="btn btn-theme04 send" type="button" >전송</button>
                  <button class="btn btn-danger" type="button" data-dismiss="modal" style="margin-right:20px;">취소</button>
               </div>
            </div>
         </div>

      </div>
   </div>
</div>
<!-- 답장 모달창 끝 -->
<section id="main-content">
   <section class="wrapper site-min-height">
      <div class="col-lg-12 mt">
         <div class="row content-panel">
            <div class="panel-heading">
               <ul class="nav nav-tabs nav-justified">
                  <li class="active"><a data-toggle="tab" href="#overview">받은
                        쪽지</a></li>
                  <li><a data-toggle="tab" href="#sendMessagetab"
                     class="contact-map">보낸 쪽지</a></li>
                  <li><a data-toggle="tab" href="#contact">새 쪽지</a></li>

               </ul>
            </div>
            <!-- /panel-heading -->

            <div class="panel-body">
               <div class="tab-content">
                  <!-- 받은 쪽지함 -->
                  <div id="overview" class="tab-pane active">
                     <section>
                        <div class="col-sm-12">
                           <div class="panel-body minimal" id="messageTable">
                              <div class="table-inbox-wrap ">
                                 <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                      <input type="hidden" id="sendDeleteHidden" name="sendDeleteHidden" />
                                       <table class="table table-inbox table-hover" id="sendMessageTable">
                                          <thead>
                                             <tr>
                                                <th class="th1">&nbsp;&nbsp;&nbsp;<input type="checkbox" class="mail-checkbox" id="agreeAll2">&nbsp;전체선택</th>
                                                <th class="th2">보낸사람</th>
                                                <th class="th3">제목</th>
                                                <th class="th4">받는사람</th>
                                                <th class="th5">받은날짜</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach items="${receiveMessage}" var="receiveMessage">

                                                <tr class="${receiveMessage.message_num}" id="${receiveMessage.send_member_id}">
                                                   <td class="inbox-small-cells"><input name="chk2"
                                                      type="checkbox" class="mail-checkbox" style="margin-left:30px;" value="${receiveMessage.message_num}"></td>
                                                   <td class="view-message " id="${receiveMessage.message_content}">${receiveMessage.member_name}</td>
                                                   <td class="view-message receiveBtn message_content_row " data-toggle="modal" 
                                                      data-target="#MessageModal1" id="${receiveMessage.message_num}" >${receiveMessage.message_content}
                                                   </td>
                                                   <c:choose>
                                                   <c:when test="${receiveMessage.message_check == 0}">
                                                   
                                                   <td class="view-message  inbox-small-cells">나</td>
                                                   </c:when>
                                                   <c:otherwise>
                                                   <td class="view-message  inbox-small-cells">나&nbsp;&nbsp;<i class="fa fa-check-square"></i></td>
                                                   </c:otherwise>
                                                   </c:choose>
                                                   
                                                   <td class="view-message  text-right">${receiveMessage.message_date}</td>
                                                </tr>
                                                <input type="hidden" id="${receiveMessage.message_num}" value="${receiveMessage.message_content}"/>
                                             </c:forEach>
                                                   
                                             <!-- <tr class="read">
                                                      <td class="inbox-small-cells"><input
                                                         type="checkbox" class="mail-checkbox"></td>
                                                      <td class="view-message "><a
                                                         href="mail_view.html">학생2</a></td>
                                                      <td class="view-message "><a id="updatebtn"
                                                         data-toggle="modal" data-target="#MessageModal">Your
                                                            안녕하세요</a></td>
                                                      <td class="view-message  inbox-small-cells">나</td>
                                                      <td class="view-message  text-right">08:10 AM</td>
                                                   </tr> -->

                                          </tbody>
                                       </table>
                                       <a class="sendMessageDelete"><i class="fa fa-trash-o"></i>&nbsp;삭제</a>
                                    </div>
                                 </div>
                              </div>


                           </div>
                        </div>

                     </section>

                  </div>

                  <!-- 보낸 쪽지 탭- -->
                  <div id="sendMessagetab" class="tab-pane">
                     <section>
                        <div class="col-sm-12">
                           <div class="panel-body minimal" id="messageTable">
                              <div class="table-inbox-wrap ">
                                 <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                      <input type="hidden" id="receiveDeleteHidden" name="receiveDeleteHidden" />   
                                       <table class="table table-inbox table-hover" id="receiveMessageTable">
                                          <thead>
                                             <tr>
                                                <th class="th1">&nbsp;&nbsp;&nbsp;<input type="checkbox" class="mail-checkbox" id="agreeAll3">&nbsp;전체선택</th>
                                                <th class="th2">보낸사람</th>
                                                <th class="th3">제목</th>
                                                <th class="th4">받는사람</th>
                                                <th class="th5">보낸날짜</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach items="${sendMessage}" var="sendMessage">
                                                <tr id="${sendMessage.receive_member_id}">
                                                   <td class="inbox-small-cells"><input name="chk3"
                                                      type="checkbox" class="mail-checkbox" style="margin-left:30px;" value="${sendMessage.message_num}"></td>
                                                   <td class="view-message" id="${sendMessage.message_content}"><a href="mail_view.html">나</a></td>
                                                   <td class="view-message sendBtn subject" data-toggle="modal"
                                                      data-target="#MessageModal2" id="${sendMessage.message_num}">
                                                      ${sendMessage.message_content}</td>
                                                   <td class="view-message  inbox-small-cells">${sendMessage.member_name}</td>
                                                   <td class="view-message  text-right">${sendMessage.message_date}</td>
                                                </tr>
                                             </c:forEach>
                                             <!-- <tr class="read">
                                                      <td class="inbox-small-cells"><input
                                                         type="checkbox" class="mail-checkbox"></td>
                                                      <td class="view-message "><a
                                                         href="mail_view.html">나</a></td>
                                                      <td class="view-message "><a id="updatebtn"
                                                         data-toggle="modal" data-target="#MessageModal">Your
                                                            안녕하세요</a></td>
                                                      <td class="view-message  inbox-small-cells">학생2</td>
                                                      <td class="view-message  text-right">08:10 AM</td>
                                                   </tr> -->

                                          </tbody>
                                       </table>
                                       <a class="receiveMessageDelete"><i class="fa fa-trash-o"></i>&nbsp;삭제</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </section>
                  </div>
                        <!-- /tab-pane -->
                        <div id="contact" class="tab-pane examstudent">
                           <div class="row">
                              <div class="row mt">
                                 <div id="updateExam" class="tab-pane">
                                 <form class="contact-form php-mail-form" role="form"
                                                action="sendTeacherMessage.do" method="POST" >
                                    <input type="hidden" id="messagemember" name="messagemember" />
                                    <div class="row">
                                       <div class="col-md-12">
                                          <div class="col-md-3">
                                             <section class="panel" style="width:200px; height:424px; overflow-y:auto;">
                                                <div class="panel-body grey-panel">
                                                   <div>
                                                      <label class="btn btn-compose newMessageAll"> <i
                                                         class="fa fa-user allchooseicon"></i><strong id="allchoose">전체선택</strong><input type="checkbox"
                                                         class="checkbox form-control" id="agreeAll" />
                                                      </label>
                                                   </div>
                                                   <ul class="nav nav-pills nav-stacked mail-nav">
                                                   <se:authorize access="hasRole('ROLE_TEACHER')">
                                                      <c:forEach items="${classMemberList}" var="classMemberList">
                                                      <li id="messageSelect" class="messageSelect"><div>
                                                       <div class="checkbox" id="checkboxName" style="text-align: left; width:110px; height:15px;" >
                                                        <label style="padding-left:0px;">
                                                        <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${classMemberList.member_id}"style="position:relative;"/>
                                                            <img
                                                               src="${pageContext.request.contextPath}/img/friends/student.png"
                                                               class="img-circle" width="25">${classMemberList.member_name}
                                                               </label>
                                                               </div>
                                                         </div></li>
                                                   </c:forEach>
                                                   </se:authorize>
                                                   <se:authorize access="hasRole('ROLE_STUDENT')">
                                                      <c:forEach items="${classTeacherList}" var="classTeacherList">
                                                      <li id="messageSelect" class="messageSelect"><div>
                                                       <div class="checkbox" id="checkboxName" style="text-align: left; width:130px;">
                                                        <label>
                                                        <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${classTeacherList.member_id}"style="position:relative;" checked/>
                                                            <img
                                                               src="${pageContext.request.contextPath}/img/friends/teacher2.jpeg"
                                                               class="img-circle" width="25">${classTeacherList.member_name}
                                                               </label>
                                                               </div>
                                                         </div></li>
                                                         <input type="hidden" id="teacher_id" name="teacher_id" value="${classTeacherList.member_id}"/>
                                                   </c:forEach>
                                                   </se:authorize>
                                                    <se:authorize access="hasRole('ROLE_ADMIN')">
                                                      <c:forEach items="${teacherList}" var="teacherList">
                                                      <li id="messageSelect" class="messageSelect"><div>
                                                       <div class="checkbox" id="checkboxName" style="text-align: left; width:150px;" >
                                                        <label style="padding-left:0px;">
                                                        <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${teacherList.member_id}"style="position:relative;"/>
                                                            <img
                                                               src="${pageContext.request.contextPath}/img/friends/teacher2.jpeg"
                                                               class="img-circle" width="25"> ${teacherList.member_name}
                                                               </label>
                                                               </div>
                                                         </div></li>
                                                   </c:forEach>
                                                   </se:authorize>
                                                   </ul>
                                                </div>
                                             </section>
                                          </div>
                                          <div class="col-md-8">
                                                <div class="form-group textareadiv">
                                                   <textarea class="form-control" name="message_content"
                                                      id="message_content" placeholder="메세지를 입력하세요"
                                                      rows="20" cols="10" data-rule="required"
                                                      data-msg="Please write something for us"></textarea>
                                                </div>
                                                <div class="sent-message">Your message has been
                                                   sent. Thank you!</div>
                                                   <se:authorize access="hasRole('ROLE_STUDENT')">
                                                <button type="button"  onclick="check()" class="btn btn-large btn-theme msgBtn pull-right s" >전송</button>
                                                </se:authorize>
                                                <se:authorize access="hasRole('ROLE_TEACHER')">
                                                <button type="button"  onclick="check_t()" class="btn btn-large btn-theme msgBtn pull-right s" >전송</button>
                                                </se:authorize>
                                                <se:authorize access="hasRole('ROLE_ADMIN')">
                                                <button type="button"  onclick="check_t()" class="btn btn-large btn-theme msgBtn pull-right s" >전송</button>
                                                </se:authorize>
                                          </div>
                                       </div>
                                    </div>
                                    </form>
                                 </div>
                                 <!-- /row -->
                              </div>
                              <!-- /tab-content -->
                           </div>
                           <!-- /panel-body -->
                        </div>
                     </div>
                     <!-- /tab-content -->
                  </div>
                  <!-- /panel-body -->
         </div><!-- row content-panel -->
      </div><!-- col-lg-12 mt -->
   </section><!-- wrapper site-min-height -->
</section><!-- main-content -->

<script>

$(document).ready(function(){


   $(document).on('click','.receiveBtn',function(){
       var text = $(this).prev().attr('id');   
       var sendManId = $(this).parent().attr('id');
       var date = $(this).parent().children().eq(4).text();
       var sendManName = $(this).prev().text();
       
         $('.messageReceive').val(sendManId);
         $('.receiverName').html(sendManName);
         $('.date').html(""+date+"");
         $('.messageText').html(""+text+"")
   });
   
      
      $(document).on('click','.sendBtn',function(){
        var text = $(this).prev().attr('id');   
        var receiveMan = $(this).next().text();
        var date = $(this).parent().children().eq(4).text();
          $('.messageSender').html(""+receiveMan+"");
          $('.date').html(""+date+"");
          $('.messageText').html(""+text+"")
      });
     
      

      });
function check_t(){
   
   
    var messagememberarray = new Array();
      $("input:checkbox[name=chk]:checked").each(function(){
         
         messagememberarray.push($(this).val());
      });
       
       document.getElementById("messagemember").setAttribute('value',messagememberarray);
       
   
   if($('#message_content').val()==""){
        swal({
            title : "전송실패",
            text:"내용을 입력하세요.",
            icon : "warning",
            dangerMode: true
         });
   }else if(messagememberarray==""){
        swal({
            title : "전송실패",
            text:"받는사람을 확인하세요.",
            icon : "warning",
            dangerMode: true
         });
   }
   else{
    
   var username='${member_id}';
   var message_content=$('#message_content').val();
   var receive_member_id=$('#messagemember').val();
   
   
   var data=new Array();
   data[0]=username;
   data[1]=message_content;
   data[2]=receive_member_id;
    swal({
         title : "전송성공",
         icon : "success",
         dangerMode: true
      });
   document.getElementById("message_content").value='';
   socket.send(data);
     
   }
      };

      function check(){
          
          if($('#agree').is(":checked")==false){
               swal({
                   title : "전송실패",
                   text:"받는사람을 확인하세요.",
                   icon : "warning",
                   dangerMode: true
                });
          }else if($('#message_content').val()==""){
               swal({
                   title : "전송실패",
                   text:"내용을 입력하세요.",
                   icon : "warning",
                   dangerMode: true
                });
          }
          
          else{
           
          var username='${member_id}';
          var message_content=$('#message_content').val();
          var receive_member_id=$('#teacher_id').val();
          
          var data=new Array();
          data[0]=username;
          data[1]=message_content;
          data[2]=receive_member_id;
           swal({
                title : "전송성공",
                icon : "success",
                dangerMode: true
             });
          document.getElementById("message_content").value='';
          socket.send(data); 
            
          }
             };
             

   
           
   $('.message_content_row').click(function(){
      var username='${member_id}';
       $(this).next().html("나&nbsp;&nbsp;<i class='fa fa-check-square'></i></td>");
      var message_num=window.event.target.id;
      var message_check={'message_check':1,
                     'message_num':message_num};
      
         $.ajax({
         url : "message_check.do",
         type : "get",
         dataType : "json",
         data : message_check,
         global:false,
         success : function(data){
             if(data>0){
               socket.send(username);
               $.ajax({

                url:"headerMessage.do",
                type:"get",
                global:false,
                success:function(data){
                   $('#minji').children().eq(2).html(data);
                   
                   
                },
                err:function(err){
                   console.log('err입니다');
                }
                
             });

             }else{
              
             }
            
            
         }
      });
      
   });
   
   $('.sendMessageDelete').click(function(){
      
      var sendMessageDeleterarray = new Array();
         $("input:checkbox[name=chk2]:checked").each(function(){
             sendMessageDeleterarray.push($(this).val());
         });
         if(sendMessageDeleterarray == ""){
            swal({
                  title : "삭제 실패",
                  text:"삭제할 쪽지를 선택하세요",
                  icon : "warning",
               });
         }else{
        
          document.getElementById("sendDeleteHidden").setAttribute('value',sendMessageDeleterarray);
            var data ={ 'sendDeleteHidden':$('#sendDeleteHidden').val()};
            
            $.ajax({
              url : "sendMessageDelete.do",
              type : "post",
              dataType : "html",
              global:false,
              data : data,
              success : function(data){
                if(data>0){
                    swal({
                      title: "삭제성공",
                     text: "선택된 쪽지가 삭제되었습니다.",
                     icon:"info"
                  }).then(function() {
                      window.location = "myMessage.do";
                  });
                 }
              }
           });
         }      
   });
   
   $('.receiveMessageDelete').click(function(){
      
      var receiveMessageDeleterarray = new Array();
         $("input:checkbox[name=chk3]:checked").each(function(){
             receiveMessageDeleterarray.push($(this).val());
         });
         if(receiveMessageDeleterarray == ""){
            swal({
                  title : "삭제 실패",
                  text:"삭제할 쪽지를 선택하세요",
                  icon : "warning",
               });
         }else{
            
          document.getElementById("receiveDeleteHidden").setAttribute('value',receiveMessageDeleterarray);
            var data ={ 'receiveDeleteHidden':$('#receiveDeleteHidden').val()};
            $.ajax({
              url : "receiveMessageDelete.do",
              type : "post",
              dataType : "html",
              global:false,
              data : data,
              success : function(data){
                if(data>0){
                    swal({
                      title: "삭제성공",
                     text: "선택된 쪽지가 삭제되었습니다.",
                     icon:"info"
                  }).then(function() {
                      window.location = "myMessage.do";
                  });
                 }
              }
           });
         }
   });
   $('.messageBtn').click(function(){
     var text = $('.messageReceive').val();
     $('#MessageModal').modal('hide');
     $('.MessageReplyModal').val(text);
     $('#MessageReplyModal').modal();
     $('.receiver').html(text);  });
   $('.send').click(function(){
    var text = $('.textarea').val();
     var sender = $('.receiver').text();
     var username='${member_id}';
     if(text == ""){
    	 swal({
             title : "전송 실패",
             text:"내용을 반드시 입력해주세요",
             icon : "warning",
          });
     }else{
     var data = new Array();
     data[0]=username;
     data[1]=text;
     data[2]=sender;
     swal({
         title: "답장성공",
        text: "",
        icon:"info"
     }).then(function() {
        window.location = "myMessage.do";
     });
     socket.send(data);
     }
   });
  
   
</script>