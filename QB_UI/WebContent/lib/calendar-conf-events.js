var Script = function () {


    /* initialize the external events
     -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
     -----------------------------------------------------------------*/
    var title = "";
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    
    var string = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getEList?serviceKey=bE%2BMHNWc5Mt6LzYVw%2BLeZmthCrGWctkYd%2F6FOUod7Vz4BTcOaljwRzx2fuRqduyJormhYl%2BAgvIU2sZcA%2FQW%2Bw%3D%3D&_type=json";
    var StartD;
    var EndD;
    var startDate;
    var endDate;

    $.getJSON(string, function(data){
    	
    	if(data.response){
    			
    		$.each(data.response.body.items.item,function(index,obj){
				title = obj.description;

				startDate = obj.docregstartdt + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				endDate = obj.docregenddt + "";
				EndD = endDate.substr(0,4) + "-" + endDate.substr(4,2)+"-" + endDate.substr(6,2);
				var PilgiEvent = {
						title:title + " 원서 접수",
						start:StartD,
						end:EndD
				}
				
				startDate = obj.docexamdt + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				var PilgiExEvent = {
						title:title + " 필기 시험",
						start:StartD
				}
				
				startDate = obj.docpassdt  + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				var PilgiPassEvent = {
						title:title + " 필기 시험 합격자 발표",
						start:StartD
				}
				
				startDate = obj.pracregstartdt  + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				endDate = obj.pracregenddt + "";
				EndD = endDate.substr(0,4) + "-" + endDate.substr(4,2)+"-" + endDate.substr(6,2);
				var SilgiEvent = {
						title:title + " 실기시험 원서접수",
						start:StartD,
						end:EndD
				}
				
				startDate = obj.pracexamstartdt  + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				endDate = obj.pracexamenddt + "";
				EndD = endDate.substr(0,4) + "-" + endDate.substr(4,2)+"-" + endDate.substr(6,2);
				var SilgiExEvent = {
						title:title + " 실기 시험",
						start:StartD,
						end:EndD
				}
				
				startDate = obj.pracpassdt  + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				var HapEvent = {
						title:title + " 합격자 발표 일자",
						start:StartD
				}
				
				$('#calendar').fullCalendar('renderEvent', PilgiEvent, true);
				$('#calendar').fullCalendar('renderEvent', PilgiExEvent, true);
				$('#calendar').fullCalendar('renderEvent', PilgiPassEvent, true);
				$('#calendar').fullCalendar('renderEvent', SilgiEvent, true);
				$('#calendar').fullCalendar('renderEvent', SilgiExEvent, true);
				$('#calendar').fullCalendar('renderEvent', HapEvent, true);
	        })

    		
		}
    });
   
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        editable: false,
        titleFormat: {
        	   month: "yyyy년 MMMM",
        	   week: "yyyy년 MMM",
        	   day: "yyyy년 MMM d일 dddd"
        	   },
        monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        buttonText: {
        	   today : "오늘",
        	   month : "월별",
        	   week : "주별",
        	   day : "일별",
        	   }
    });
}();