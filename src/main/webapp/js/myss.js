
  // 이전값을 저장해주는 변수
 var _prevObj = null;
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({      
      dayClick: function(date, jsEvent, view, resourceObj) {
            if(_prevObj) {
                _prevObj.css('background-color', 'white');
                $(this).css('background-color', 'gray');
            } else {
                $(this).css('background-color', 'gray');
            }
              _prevObj = $(this);
            $("#selectday h2").html(date.format());
            $('#showtype h4').empty();
            $('.insertDate tbody').empty();
          }  
  })
});


$('.chkFlag button').click(function(){
    var f = $(this).val();   
    $.ajax({ 
        type : "POST", 
        url : "chkFlag", 
        dataType: 'json',
        data : {"flag" : f},
        success : function(data) {
            alert("성공!");
            $('.suggests tbody').empty();
    if(data == null){
        $(".suggests tbody").append('해당일의 스케줄이 존재하지않습니다.');
    }else{
        $.each(data,function(index,item){
            if(item.flag==1){
                $(".suggests tbody").append(
                        '<tr>'+
                        '<td>'+item.shopname+'</td>'+
                        '<td>'+item.genre+'</td>'+
                        '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                        '<td>'+item.cnt+'명</td>'+
                        '<td>'+'진행중'+'</td>'+
                        '<td>'+item.ncdt+'</td>'+
                        '<td><button>'+'상세보기'+'</button></td>'+
                        '</tr>');
            }else if(item.flag==2){
                $(".suggests tbody").append(
                        '<tr>'+
                        '<td>'+item.shopname+'</td>'+
                        '<td>'+item.genre+'</td>'+
                        '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                        '<td>'+item.cnt+'명</td>'+
                        '<td>'+'완료'+'</td>'+
                        '<td>'+item.ncdt+'</td>'+
                        '<td><button>'+'상세보기'+'</button></td>'+
                        '</tr>');
            }else{
                $(".suggests tbody").append(
                        '<tr>'+
                        '<td>'+item.shopname+'</td>'+
                        '<td>'+item.genre+'</td>'+
                        '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                        '<td>'+item.cnt+'명</td>'+
                        '<td>'+'etc'+'</td>'+
                        '<td>'+item.ncdt+'</td>'+
                        '<td><button>'+'상세보기'+'</button></td>'+
                        '</tr>');
            }
        });
    }

    },
    error : function(request, status, error) {
        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    }
});

});

$('#datetimepicker').datetimepicker();
jQuery('#datetimepicker2').datetimepicker({
      datepicker:false,
      format:'H:i'
    });    


function add(){
    var td = $('#showDate').text();
   if(td==null || td==''){
       alert("날짜를 먼저 선택해주세요");
       return;
   }
   $('#showtype h4').empty();
   $('#showtype h4').append('무대등록하기');
   
   $.ajax({ 
       type : "POST", 
       url : "showDate", 
       dataType: 'json',
       data : {"date" : td},
       success : function(data){
           $('.insertDate tbody').empty();
           if(data.length == 0){
               $(".insertDate tbody").append(
               '<tr>'+
               '<td>'+'all'+'</td>'+
               '</tr>');      
           }else{
               $.each(data,function(index,item){
               $(".insertDate tbody").append(
                 '<tr>'+
                 '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                 '</tr>');
               })
           }
       },
   error : function(request, status, error) {
       alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
   }
});

   }

function remove(){
    var td = $('#showDate').text();
   if(td==null || td==''){
       alert("날짜를 먼저 선택해주세요");
       return;
   }
   $('#showtype h4').empty();
   $('#showtype h4').append('무대 삭제하기');
   
   $.ajax({ 
       type : "POST", 
       url : "showDate", 
       dataType: 'json',
       data : {"date" : td},
       success : function(data){
           $('.insertDate tbody').empty();
           if(data.length == 0){
               $(".insertDate tbody").append(
               '<tr>'+
               '<td>'+'해당 일자에 등록된 무대 일정이 없습니다.'+'</td>'+
               '</tr>');      
           }else{
               $.each(data,function(index,item){
               $(".insertDate tbody").append(
                 '<tr>'+
                 '<td>'+'<input type="checkbox" name="stagedate" value="'+item.nsdt+'">'+item.nsdt+'~'+item.nedt+'</td>'+
                 '</tr>');
               });
               $(".insertDate tbody").append(
            	'<tr>'+
            	'<td>' + '<button onclick="removeDate()">삭제하기</button>'+'</td>'+
            	'</tr>'
               )
           }
       },
   error : function(request, status, error) {
       alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
   }
});

   }


function removeDate(){
	var td = $('#showDate').text();
    var chkbox = document.getElementsByName("stagedate");
    var chkCnt=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            chkCnt++;
        }
    }
    if(chkCnt == 0){
    	alert("삭제하실 일정을 체크해주세요");
    }
    
    
    $.ajax({ 
        type : "POST", 
        url : "showDate", 
        dataType: 'json',
        data : {"date" : td},
        success : function(data){
            $('.insertDate tbody').empty();
            if(data.length == 0){
                $(".insertDate tbody").append(
                '<tr>'+
                '<td>'+'all'+'</td>'+
                '</tr>');      
            }else{
                $.each(data,function(index,item){
                $(".insertDate tbody").append(
                  '<tr>'+
                  '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                  '</tr>');
                })
            }
        },
    error : function(request, status, error) {
        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    }
 });
    
    
    
    
    
}