<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>${pageContext.request.contextPath }</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/' />assets/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.7.0/fullcalendar.min.css' />
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-ui.js"></script>
<!-- full calendar -->
<link href='${pageContext.request.contextPath }/assets/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/assets/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/assets/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/assets/fullcalendar/packages/list/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath }/assets/fullcalendar/vendor/rrule.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/list/main.js'></script>
<script src='${pageContext.request.contextPath }/assets/fullcalendar/packages/rrule/main.js'></script>


<script type="text/javascript">
/* calendar 한글 setting */
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(function() {
	var today = $.datepicker.formatDate('yy-mm-dd', new Date());
	/* calendar */
	$( "#datepicker" ).datepicker();
    $( "#datepicker2" ).datepicker();
   
    
    
    /* full calendar  */
    var calendarEl =  $('#calendar')[0]; //document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: this.today,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      right:'dayGridMonth',
      locale : "ko",
      eventClick:function(info) {
    	    alert('Event: ' + info.event.title);
    	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    	    alert('View: ' + info.view.type);

    	    //클릭시 red
    	    //info.el.style.borderColor = 'red';
    	  },
      events: [
        {
          title: 'All Day Event',
          start: '2019-03-01'
        },
        {
          title: 'Long Event',
          start: '2019-03-07',
          end: '2019-03-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-03-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-03-11',
          end: '2019-03-13'
        },
        {
          title: 'Meeting',
          start: '2019-03-12T10:30:00',
          end: '2019-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-03-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2019-03-28'
        }
      ]
    });
    calendar.render();
  });
</script>

</head>
<body>

	<div style="">
	날짜 : <input type="text" id="datepicker"> &nbsp; &nbsp; - &nbsp; &nbsp; <input type="text" id="datepicker2">
	</div>
	<div style="width:70%" id='calendar'></div>
</body>
</html>