$(document).ready(function(){
   
   
   $('#sendMessageTable').DataTable({
        "order":[[4,'desc']],
        "columnDefs": [ 
           { "orderable": false, "targets": 0 },
           {
              targets: 2,
              render: function ( data, type, row ) {
                  return data.length > 10 ?
                            data.substr( 0, 10 ) +'…' :
                            data;
              }
          } ],
          "searching" : false,
        "lengthChange": false
   });
   $('#receiveMessageTable').DataTable({
        "order":[[4,'desc']],
        "columnDefs": [ 
           { "orderable": false, "targets": 0 },
           {
              targets: 2,
              render: function ( data, type, row ) {
                  return data.length > 10 ?
                            data.substr( 0, 10 ) +'…' :
                            data;
              }
          } ],
          "searching" : false,
        "lengthChange": false
   });
   
   /*체크박스*/
    function allCheckFunc( obj ) {
         $("[name=chk]").prop("checked", $(obj).prop("checked") );
   }
      
      
   function oneCheckFunc( obj )
   {
      var allObj = $("#agreeAll");
      var objName = $(obj).attr("name");

      if( $(obj).prop("checked") )
      {
         checkBoxLength = $("[name="+ objName +"]").length;
         checkedLength = $("[name="+ objName +"]:checked")
         .length;

         if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
         } else {
            allObj.prop("checked", false);
         }
      }
      else
      {
         allObj.prop("checked", false);
      }
   }

   $("#agreeAll").click(function(){
      allCheckFunc( this );
   });
   
   $("[name=chk]").each(function(){
      $(this).click(function(){
         oneCheckFunc( $(this) );
      });
   });

   /*************************************************/
   /*체크박스*/
   
    function allCheckFunc2( obj ) {
         $("[name=chk2]").prop("checked", $(obj).prop("checked") );
   }
      
      
   function oneCheckFunc2( obj )
   {
      var allObj = $("#agreeAll2");
      var objName = $(obj).attr("name");

      if( $(obj).prop("checked") )
      {
         checkBoxLength = $("[name="+ objName +"]").length;
         checkedLength = $("[name="+ objName +"]:checked")
         .length;

         if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
         } else {
            allObj.prop("checked", false);
         }
      }
      else
      {
         allObj.prop("checked", false);
      }
   }

   $("#agreeAll2").click(function(){
      allCheckFunc2( this );
   });
   
   $("[name=chk2]").each(function(){
      $(this).click(function(){
         oneCheckFunc2( $(this) );
      });
   });
/********************************************************/
    function allCheckFunc3( obj ) {
         $("[name=chk3]").prop("checked", $(obj).prop("checked") );
   }
      
      
   function oneCheckFunc3( obj )
   {
      var allObj = $("#agreeAll3");
      var objName = $(obj).attr("name");

      if( $(obj).prop("checked") )
      {
         checkBoxLength = $("[name="+ objName +"]").length;
         checkedLength = $("[name="+ objName +"]:checked")
         .length;

         if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
         } else {
            allObj.prop("checked", false);
         }
      }
      else
      {
         allObj.prop("checked", false);
      }
   }

   $("#agreeAll3").click(function(){
      allCheckFunc3( this );
   });
   
   $("[name=chk3]").each(function(){
      $(this).click(function(){
         oneCheckFunc3( $(this) );
      });
   });
   
   
});