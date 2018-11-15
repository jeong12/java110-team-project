
  // 이전값을 저장해주는 변수
 var _prevObj = null;
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({      
      dayClick: function(date, jsEvent, view, resourceObj) {
            alert('Date: ' + date.format());
            if(_prevObj) {
                _prevObj.css('background-color', 'white');
                $(this).css('background-color', 'gray');
            } else {
                $(this).css('background-color', 'gray');
            }
              _prevObj = $(this);
            $("#selectday h2").html(date.format());
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
   $('#showtype h4').append('무대등록하기');
   
   $.ajax({ 
       type : "GET", 
       url : "showDate", 
       dataType: 'json',
       data : {"date" : td},
       success : function(data){
           $('.insertDate tbody').empty();
           if(data == null){
               alert("if");
               $(".insertDate tbody").append(
               '<tr>'+
               '<td>'+'all'+'</td>'+
               '</tr>');      
           }else{
               alert("else");
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