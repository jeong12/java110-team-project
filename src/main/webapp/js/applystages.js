
//이전값을 저장해주는 변수
var _prevObj = null;
$(function() {
	// 캘린더 출력해주는 코드
	$('#calendar').fullCalendar({
		dayClick: function(date, jsEvent, view, resourceObj) {
			var current_date = moment().format('YYYY-MM-DD')
			if(current_date > date.format()) {
                alert("오늘 이후의 날짜를 골라주세요")
              }else{
			if(_prevObj) {
				_prevObj.css('background-color', 'white');
				$(this).css('background-color', 'gray');
			} else {
				$(this).css('background-color', 'gray');
			}
			_prevObj = $(this);
			$("#selectday h2").html(date.format());
		}
		  }
	})
})
