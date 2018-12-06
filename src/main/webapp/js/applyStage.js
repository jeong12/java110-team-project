import * as $ from 'jquery'
var _prevObj = null;
$(function() {  
  $('#calendar').fullCalendar({      
      dayClick: function(date, jsEvent, view, resourceObj) {
          var current_date = moment().format('YYYY-MM-DD')
          if(current_date > date.format()) {
              alert("오늘 이후의 날짜를 골라주세요")
          }else{
              if(_prevObj) {
                  _prevObj.css('background-color', 'white');
                  $(this).css('background-color', 'gray');
              } else 
                  $(this).css('background-color', 'gray');

              _prevObj = $(this); 
            $("#selectday h2").html(date.format());
            $('.applydates tbody').empty();
            
            $.ajax({ 
                type : "POST", 
                url : "chkDates",
                data: {"date":date.format()},
                success : function(data) {
                        $("#selectdate tbody").empty();
                        $("#selectday h3").empty();
                 if(data.length==0){
                    // 해당일의 데이터가 없을경우 
                    $(".applydates tbody").append('<p>해당일의 무대가 존재하지않습니다.</p>');
                    return
                }else{
                
       $.each(data,function(index,item){
                $(".applydates tbody").append(
                 '<tr>'+
                 '<td><input type="checkbox" name="applydate"'+ 
                 'value="'+item.sno+'_'+item.nsdt+'~'+item.nedt+'">'+item.nsdt+'~'+item.nedt+
                 '</td></tr>');
                });
       
                $(".applydates tbody").append(
                  '<tr><td>' + 
                  '<button type="button" class="abtn btn-primary btn-xs" data-target="#addcontModal"'+ 
                  'onclick="addcont()">신청하기</button><br/></td></tr>');
                }},
                error : function(request, status, error) {
                    alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                }
            });
          }  
  }})
});



$(".item:first").removeClass("item").addClass("active item");
document.getElementById("cont").focus();

function addcont(){
    $('.info ul').empty();
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var chks = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            chks[j] = chkbox[i].value.split("_")[1];
            j++
            chkCnt++;
        }
    }
    
    if(chkCnt == 0){
        alert("신청하실 시간을 체크해주세요");
        $('#addcontModal').modal('hide');
        return
    }
   
    $('#addcontModal').on('shown.bs.modal',function(){
        document.getElementById("count").focus();
    });
    
    $('#addcontModal').modal('show');
    $.each(chks,function(index,item){
    $('.info ul').append(
            '<li>'+item+'</li>');       
    });
};


function applyStage(){
    document.getElementById("count").focus(); 
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var addchk = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            addchk[j] = chkbox[i].value.split("_")[0];
            j++;
            chkCnt++;
        }
    }

    var cont = $('#cont').val();
    var count = $('#count').val();
    console.log(count);
    $.ajax({ 
        type : "GET", 
        url : "applyStage", 
        traditional : true,
        data : {"ssno" : addchk, "cont" : cont, "count":count},
        success : function(data){
            if(data != null){
                alert("success!");
                window.location.href=window.location.href;
            }else
                alert("fail!");
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });

    
}


$('#count').on("focusout",function(){
    var cnt = $('#count').val();
    if(cnt == "" || cnt == 0){
       $('#applybtn').prop("disabled", true);
       $('#countMsg').html("1 이상의 팀원 수를 적어주세요").css("background-color", "#FFCECE");
    }else{
         $('#applybtn').prop("disabled", false);
          $('#countMsg').html("");
    }
});


 var container = document.getElementById('map');
 var options = {
     center: new daum.maps.LatLng(${list.x}, ${list.y}),
     level: 3
};

 var map = new daum.maps.Map(container, options);
 var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${list.x}, ${list.y}),
        map: map
 });
 marker.setDraggable(true); // 마커를 움직일수 있게 설정 false일경우 고정!
 map.relayout();

