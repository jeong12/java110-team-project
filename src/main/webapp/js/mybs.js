function moveFocus(next){
	if(event.keyCode==13){
		document.getElementById(next).focus();
	}
}



var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	    center: new daum.maps.LatLng(37.5342, 126.992), // 지도의 중심좌표
	    level: 2 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});

marker.setDraggable(true); // 마커를 움직일수 있게 설정 false일경우 고정!
map.relayout(); //뭐지이거 ?


function search_addr() {
new daum.Postcode({
    oncomplete: function(data) {
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = data.address; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수

        // 기본 주소가 도로명 타입일때 조합한다.
        if(data.addressType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("addr").value = fullAddr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords);
                var gps = marker.getPosition();
                var x = gps.getLat();
                var y = gps.getLng();
                
                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                document.getElementById("x").value = x;
                document.getElementById("y").value = y;
                
            }
        });
        
        daum.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? result[0].road_address.address_name :'';
                    detailAddr += result[0].address.address_name;
                    
                    
                    // 마커를 클릭한 위치에 표시합니다 
                    marker.setPosition(mouseEvent.latLng);
                    marker.setMap(map);            
                                
                    var gps = marker.getPosition();
                    var x = gps.getLat();
                    var y = gps.getLng();
                    
                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                    document.getElementById("addr").value = detailAddr;
                    document.getElementById("x").value = x;
                    document.getElementById("y").value = y;
                }   
            });
        });
       
        
        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

    }
}).open();
}






//개인스케줄조회
function search_edit_addr() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var fullAddr = data.address; // 최종 주소 변수
	        var extraAddr = ''; // 조합형 주소 변수

	        // 기본 주소가 도로명 타입일때 조합한다.
	        if(data.addressType === 'R'){
	            //법정동명이 있을 경우 추가한다.
	            if(data.bname !== ''){
	                extraAddr += data.bname;
	            }
	            // 건물명이 있을 경우 추가한다.
	            if(data.buildingName !== ''){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	        }

	        // 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("edit_addr").value = fullAddr;
	        // 주소로 상세 정보를 검색
	        geocoder.addressSearch(data.address, function(results, status) {
	            // 정상적으로 검색이 완료됐으면
	            if (status === daum.maps.services.Status.OK) {

	                var result = results[0]; //첫번째 결과의 값을 활용

	                // 해당 주소에 대한 좌표를 받아서
	                var coords = new daum.maps.LatLng(result.y, result.x);
	                // 지도를 보여준다.
	                editmap.relayout();
	                // 지도 중심을 변경한다.
	                editmap.setCenter(coords);
	                // 마커를 결과값으로 받은 위치로 옮긴다.
	                editmarker.setPosition(coords);
	                var gps = marker.getPosition();
	                var x = gps.getLat();
	                var y = gps.getLng();
	                
	                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	                document.getElementById("edit_x").value = x;
	                document.getElementById("edit_y").value = y;
	                
	            }
	        });
	        
	        function searchDetailAddrFromCoords(coords, callback) {
	            // 좌표로 법정동 상세 주소 정보를 요청합니다
	            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	        }

	    }
	}).open();
}


// 클릭한 이전값을 저장해주는 변수
var _prevObj = null;
 
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({
      
	  // fullCalendar에 날짜클릭시 발생하는 이벤트 function = dayClick
      dayClick: function(date, jsEvent, view, resourceObj) {
    	  
    	  
            if(_prevObj) { // 이전클릭한 데이터가 존재한다면? ture라면?
                _prevObj.css('background-color', 'snow'); // 이전날짜의 배경을 없앰 
                $(this).css('background-color', 'gray'); // 현재의 배경을 색상을 지정
            } else {
                $(this).css('background-color', 'gray'); // 이전클릭한 데이터가 없다면? 그냥 현재의 배경만 색상 지정
            }
              _prevObj = $(this); // 이전데이터 저장하는 변수에 현재누른 것을 넣어줌으로 첫번째 if 문에서 실행되게 함
            $("#selectday").html(date.format());
            
              
            /* 여기서 부터는 클릭 date를 받아 스케줄 출력해주는 ajax처리  */ 
            
            // no같은 경우 버스커 번호임, 지금은 로그인안했으니까 5번으로 고정 
            var values = {"date":date.format()};
            
            $.ajax({ 
                type : "POST", 
                url : "clikeDate",
                dataType: 'json',
                data: values, 
                success : function(data) {
                	    // 데이터 출력 할 곳 초기화
                        $("#clickdate").empty();
                        $("#nodata").empty();
                if(data.length==0){	
                	// 해당일의 데이터가 없을경우 
                    $("#nodata").append('해당일의 스케줄이 존재하지않습니다.');
                }else{
                	
                	// 데이터를 list로 받아와서 foreach문으로 출력해줌!
                    $.each(data,function(index,item){
                        $("#clickdate").append(
                        		'<tr class="agenda-date" class="active"><td>'+item.nsdt.substring(11,16)+'~'+item.nedt.substring(11,16)+
                                '</td><td class="agenda-time">'+item.shopname+'</td><td class="agenda-events">'+item.supporter.baseaddr+'</td></tr>');
                    });
                }
                },
                error : function(request, status, error) {
                	swal("오류","달력데이터 오류","error");
                }
            });
          }  
  })
  
});





/* 날짜입력타입 설정해주기 (현재 페이지에선 스케줄등록 모달에 사용중)  */
$('#regstarttimepicker').datetimepicker({
    minDate: 0,
});

var jsDate = moment($("#regstartimepicker").val(), 'DD-MM-YYYY HH:mm'); 
var minimum = function(jsDate){
    this.setOptions({
       minTime : minitime
    })
}; 

var minitime;

$('#regstarttimepicker').change(function(){
	console.log("select이벤트발생!");//ㅅㄷㅅㄷㅅㄴtest
	$('#regendtimepicker').focus();
	jsDate = moment($(this).val(), 'DD-MM-YYYY HH:mm');
	var faketime=$(this).val();
	console.log(faketime);
	minitime=(parseInt(faketime.substring(10,13))+1) +':00';
	console.log(minitime);
})

  
$('#regendtimepicker').datetimepicker({
      datepicker:false,
      format:'H:i',
      onChangeDateTime:minimum,
      onShow:minimum
});


/* 수정페이지 날짜입력타입 설정해주기 (현재 페이지에선 스케줄등록 모달에 사용중)  */
$('#editstarttimepicker').datetimepicker({
    minDate: 0,
});

var jsDate = moment($("#editstarttimepicker").val(), 'DD-MM-YYYY HH:mm'); 
var minimum = function(jsDate){
    this.setOptions({
       minTime : minitime
    })
}; 

var minitime;

$('#editstarttimepicker').change(function(){
	
    jsDate = moment($(this).val(), 'DD-MM-YYYY HH:mm');
    var faketime=$(this).val();
    minitime=(parseInt(faketime.substring(10,13))+1) +':00';
})

  
$('#editendtimepicker').datetimepicker({
      datepicker:false,
      format:'H:i',
      onChangeDateTime:minimum,
      onShow:minimum
});









/* 상세정보 조회 ajax처리 */
$(document).on('click','.detailinfobtn',function(){
    var f = $(this).val(); // 클릭한 값을 받음 ex) a1일 경우 컨트롤러에서 a=요청스케줄, b=개인스케줄로 분류하여 처리
    var no = f.substring(1,f.length);
    
    
    $.ajax({ 
        type : "POST", 
        url : "clikedetail",
        dataType: 'json',
        data: { "fakeflag" : f},
        success : function(data) {
                /* 요청스케줄, 개인스케줄 모달 태크에 기존 값을 초기화 */
        	 	$("#reqname").empty();
             	$("#reqgenre").empty();
             	$("#reqtel").empty();
             	$("#reqsdt").empty();
             	$("#reqedt").empty();
             	$("#reqaddr").empty();
             	$("#reqetc").empty();
             	$("#supimg1").empty();
             	$("#supimg2").empty();
             	$("#supimg3").empty();
                $("#pershopname").empty();
                $("#pergenre").empty();
                $("#percnt").empty();
                $("#persdt").empty();
                $("#peredt").empty();
                $("#peraddr").empty();
                $("#peretc").empty();
                $("#perx").empty();
                $("#pery").empty();
            
            if(data ==false){
                /* 이거왜했지? 테스트인듯.. */
                cosole.log(data.addr)
            }else{
            	console.log(data);
                /* 컨트롤러에서 a,b값에 따라 요청스케줄, 개인스케줄중 한가지를 리턴해줌 */
                if(data.supporter==null){// 개인스케줄의 경우 supporter 객체를 받지 않음, 고로 개인스케줄 모달에 데이터 처리
                    $("#pershopname").append(data.busker.teamname);
                    $("#pergenre").append(data.busker.teamgenre);
                    $("#percnt").append(data.cnt+'명');
                    $("#persdt").append(data.nsdt);
                    $("#peredt").append(data.nedt);
                    $("#peraddr").append(data.addr);
                    $("#perx").append(data.x);
                    $("#pery").append(data.y);
                    $("#editno").val(no);
                    
                    $('#detailperModal').on('shown.bs.modal', function (e) {
                    	//요청페이지 map을 만들자 
                    		var permapContainer = document.getElementById('permap'), // 지도를 표시할 div
                    		permapOption = {
                    			center: new daum.maps.LatLng(data.x, data.y), // 지도의 중심좌표
                    			level: 5 // 지도의 확대 레벨
                    		};
                    		
                    	//지도를 미리 생성
                    		var permap = new daum.maps.Map(permapContainer, permapOption);
                    	//주소-좌표 변환 객체를 생성
                    		var pergeocoder = new daum.maps.services.Geocoder();
                    	//마커를 미리 생성
                    		var permarker = new daum.maps.Marker({
                    			position: new daum.maps.LatLng(data.x, data.y),
                    			map: permap
                    		});
                    		permap.relayout(); //뭐지이거 ?
                    });
                }else{ // supporter객체가 있다면 요청스케줄 모달에 데이터 처리
                	console.log(data);
                    $("#reqname").append(data.supporter.name);
                    $("#reqgenre").append(data.supporter.sgnere);
                    $("#reqtel").append(data.supporter.tel);
                    $("#reqsdt").append(data.nsdt);
                    $("#reqedt").append(data.nedt);
                    $("#reqcnt").append(data.cnt+'명');
                    $("#reqaddr").append(data.supporter.baseaddr);
                    $("#reqetc").append(data.supporter.message);
                    
                    $.each(data.stagephotos,function(index,item){
                    	if(index==0){
                    		$("#supimg1").append('<img class="img-responsive" src="/upload/'+item.photo+'"alt="웃긴사진6.JPG"  style="height:100%;">')
                    	}else if(index==1){
                    		$("#supimg2").append('<img class="img-responsive" src="/upload/'+item.photo+'"alt="웃긴사진6.JPG"  style="height:100%;">')
                    	}else{
                    		$("#supimg3").append('<img class="img-responsive" src="/upload/'+item.photo+'"alt="웃긴사진6.JPG"  style="height:100%;">')
                    	}
                    });
                    
                    $('#detailreqModal').on('shown.bs.modal', function (e) {
                    	//요청페이지 map을 만들자 
                    	var reqmapContainer = document.getElementById('reqmap'), // 지도를 표시할 div
                    		reqmapOption = {
                    				center: new daum.maps.LatLng(data.supporter.x, data.supporter.y), // 지도의 중심좌표
                    				level: 5 // 지도의 확대 레벨
                    	};
                    	//지도를 미리 생성
                    	var reqmap = new daum.maps.Map(reqmapContainer, reqmapOption);
                    	//주소-좌표 변환 객체를 생성
                    	var reqgeocoder = new daum.maps.services.Geocoder();
                    	//마커를 미리 생성
                    	var reqmarker = new daum.maps.Marker({
                    		position: new daum.maps.LatLng(data.supporter.x, data.supporter.y),
                    		map: reqmap
                    	});
                    	reqmap.relayout(); //뭐지이거 ?
                    	
                    	
                    });	
                    
                }
                
            }

        },
        error : function(request, status, error) {
        	swal("오류","상세정보조회 오류","error");
        }
        
        
    });
});
    
/*$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});

*/
$(document).on('click','.removebtn',function(){
	
	var f = $(this).val();
	swal({
	      title: "스케줄삭제?",
	      text: "삭제하시겠습니까??",
	      type: "warning",
	      buttons:{
	    	  cancel : "취소",
	    	  catch: {
	    	      text: "확인",
	    	      value: "ok",
	    	    }
	      }
	}).then((value)=>{
		
		if(value=='ok'){
			$.ajax({ 
		        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
		        url : "deleteschedule", 
		        dataType: 'json',
		        data : { fakeflag : f }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
		        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
		        	swal({
		        		  title: "삭제",
		        		  text: "해당스케줄이 삭제되었습니다.",
		        		  icon: "success",
		        		  button: "확인",
		        		}).then((value)=>{
		        			window.location="/app/mybs/main";
		        		});
		        },
		        error : function(request, status, error) {
		            console.log("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
		        }
		    });
		}else{
			
		}
		
	})
	 
});


//swal 테스트
function onClickConfirm() {
	swal("Write something here:", {
		  content: "input",
		})
		.then((value) => {
		  swal(`value1의 얼랏.`);
		})
}


$('#regendtimepicker').focusout(function(){
	
	
	var presdt=$('#regstarttimepicker').val().substring(11,13);
	var preedt=$('#regendtimepicker').val().substring(0,2);
	console.log(preedt);
	if(presdt>preedt){
		swal("오류","공연시간을 확인해주세요","error");
		return;
	}
		
    var f = {
        		"sdt": $('#regstarttimepicker').val(),
        		"edt": $('#regendtimepicker').val(),
        		"no": 5
    }
       
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "checkschedule", 
        dataType: 'json',
        data : f, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
        	if(data==0){
        		$('#datecheck').html('등록 가능한 일정입니다.').css('color','green');
        		$("#appbtn").prop("disabled", false);
        	}else{
        		$("#appbtn").prop("disabled", true);
        		$('#datecheck').html('중복된 일정이 존재합니다.').css('color','red');
        	} 
        },
        error : function(request, status, error) {
        	swal("잠깐!","입력시간을 확인하세요.","error");
        }
        
    });
    
});

	
var oldsdt ;
var oldedt ;

$('#editbtn').click(function(){
	//$('#detail`Modal').modal('hide');
	var cnt = $('#detailperModal #percnt').text().substring(0,$('#detailperModal #percnt').text().length-1);
	var peredt=$('#detailperModal #peredt').text().substring(11,16);
	console.log($('#detailperModal #pershopname').text());
	$('#edit_shopname').val($('#detailperModal #pershopname').text());
	$('#editstarttimepicker').val($('#detailperModal #persdt').text());
	$('#editendtimepicker').val(peredt);
	$('#edit_cnt').val(cnt);
	$('#edit_addr').val($('#detailperModal #peraddr').text());
	$('#edit_x').val($('#detailperModal #perx').text());
	$('#edit_y').val($('#detailperModal #pery').text());
	oldsdt = $('#editstarttimepicker').val();
	oldedt = $('#editendtimepicker').val();
	
	$('#EditScheduleModal').on('shown.bs.modal', function (e) {
    	
		var editmapContainer = document.getElementById('editmap'), // 지도를 표시할 div
		editmapOption = {
			    center: new daum.maps.LatLng($('#detailperModal #perx').text(), $('#detailperModal #pery').text()), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
		};

		//지도를 미리 생성
		var editmap = new daum.maps.Map(editmapContainer, editmapOption);
		//주소-좌표 변환 객체를 생성
		var editgeocoder = new daum.maps.services.Geocoder();
		
		//마커를 미리 생성
		var editmarker = new daum.maps.Marker({
		position: new daum.maps.LatLng($('#detailperModal #perx').text(), $('#detailperModal #pery').text()),
		map: editmap
		});

		//editmarker.setDraggable(true); 
		editmap.relayout(); //뭐지이거 ?
		
		
		daum.maps.event.addListener(editmap, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		        	var detailAddr = !!result[0].road_address ? result[0].road_address.address_name :'';
                    detailAddr += result[0].address.address_name;

		         // 마커를 클릭한 위치에 표시합니다 
	                editmarker.setPosition(mouseEvent.latLng);
	                //editmarker.setMap(editmap);            
	                            
	                var gps = editmarker.getPosition();
	                var x = gps.getLat();
	                var y = gps.getLng();
	                
	                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	                document.getElementById("edit_addr").value = detailAddr;
	                document.getElementById("edit_x").value = x;
	                document.getElementById("edit_y").value = y;
		        }   
		    });      
	    });
		
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
			editgeocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
    });	
	
});

//edit스케줄 수정
$('#editendtimepicker').focusout(function(){
	console.log('oldsdt:'+ oldsdt);
	console.log('oldedt:'+ oldedt);
	
    var f = {
 		   	"sdt": oldsdt,
    		"edt": oldedt,
     		"nsdt": $('#editstarttimepicker').val(),
     		"nedt": $('#editendtimepicker').val(),
     		"no": 5
    }
     console.log(f);
    
 $.ajax({ 
     type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
     url : "editcheckschedule", 
     dataType: 'json',
     data : f, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
     success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
    	 
    	 console.log(data);
     	if(data==0){
     		$('#editdatecheck').html('등록 가능한 일정입니다.').css('color','green');
     		$("#editno").prop("disabled", false);
     		console.log(data+"중복값이없어 바꾼다");	
     	}else{
     		$("#editno").prop("disabled", true);
     		console.log(data+"중복일정이있어 못바꾸게한다");
     		$('#editdatecheck').html('중복된 일정이 존재합니다.').css('color','red');
     	}
     },
     error : function(request, status, error) {
    	 swal("오류","공연시간 설정을 확인해주세요.","error");
     }
 });
 
});


$('#editno').click(function(){
	
	
	var schedule= { "sno":$(this).val(),
			        "shopname": $('#edit_shopname').val() ,
			        "nsdt": $('#editstarttimepicker').val(),
			        "nedt": $('#editendtimepicker').val(),
			        "addr": $('#edit_addr').val(),
			        "cnt" : $('#edit_cnt').val(),
			        "x"   : $('#edit_x').val(),
			        "y"   : $('#edit_y').val() 
			      }
	
	console.log(schedule);
	$.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "editperschedule", 
        dataType: 'json',
        data : schedule, 
        success : function(data) { 
        	 window.location = '/app/mybs/main';            
        },
        error : function(request, status, error) {
        	swal("오류","개인스케줄 수정 오류","error");
        }
    });
});


$('.tabs li').click(function(){
    console.log('test');
    var tab_id = $(this).attr('data-tab');
    $('.tabs li').removeClass('active current');
    $('.span12').removeClass('active current');
     
    $(this).addClass('active current');
    $("#"+tab_id).addClass('active current');
    
});

$('.pages li').click(function(){
    $('.pages li').siblings().removeClass('active');
    $(this).addClass('active');
});


function add(){
	var shopname=$('#shopname').val();
	var cnt=$('#cnt').val();
	var addr=$('#addr').val();
	var time1=$('#regstarttimepicker').val();
	var time2=$('#regendtimepicker').val();
	
	if(shopname==''){
		swal("잠깐!","상호명을 입력하세요.","error");
	}else if(cnt==''){
		swal("잠깐!","인원을 입력하세요.","error");
	}else if(time1==''||time2==''){
		swal("잠깐!","시간을 입력하세요.","error");
	}else if(addr==''){
		swal("잠깐!","주소를 입력하세요.","error");
	}else{
		$('#scheduleaddform').submit();
	}
}




/*페이징 처리*/
function pasing(){
    $('#schedulelist').each(function() {
        var currentPage = 1;
        var numPerPage = 5; // 페이지당 보일 리스트 갯수
        var $table = $(this).show();
        $table.bind('repaginate', function() {
            $table.find('tr').hide()
            //기본적으로 모두 감춘다
            .slice((currentPage - 1) * numPerPage,
                    currentPage * numPerPage)
                    .show();
            //현재페이지 곱하기 현재페이지까지 보여준다
        });

        var numRows = $table.find('tr').length;//length로 전체길이구함
        var numPages = Math.ceil(numRows / numPerPage); //Math.ceil를 이용하여 반올림
        $('#list-group-item').children().remove(); // 상세검색시 페이징 초기화
        var $pager = $('<ul class="nav justify-content-center" id="pasingNum">');

        for (var page = 1; page <= numPages; page++) {
            $('<a class="page-link page-btn"></a>').text(page)
            .bind('click', {newPage: page}, function(event) {        
                currentPage = event.data['newPage'];
                $table.trigger('repaginate');
                //for구문을 이용하여 페이지 수만큼
                //버튼을 구현
                $(this).addClass('active')
                //활성화된페이지에는 active라는 클래스명을 붙여준다.
                .siblings().removeClass('active');

                $(this).addClass('disabled')
                //활성화된페이지에는 active라는 클래스명을 붙여준다.
                .siblings().removeClass('disabled');
            }).appendTo($pager);
        }
        $pager.appendTo('#button')
        //앞서 설정한 페이지키를 삽입
        .find('a.page-link:first').addClass('active');
        $('.active').trigger('click');

        var $Previous = $('<li class="page-link"> « </li>');
        var $Next = $('<li class="page-link"> » </li>');
        if(numPages > 1){
            $($Next).appendTo('#pasingNum');
            $($Previous).prependTo('#pasingNum');
        }

        var blockPerPage = 3;//블럭당 페이지 수
        var blockPage = 1; // 블럭 갯수 처음은 1개로 초기화
        var firstbtn = 1; //블럭의 첫 페이지 번호 처음은 1로 초기화
        var lastbtn; // 블럭의 마지막 페이지 번호
        var btn = document.getElementsByClassName('page-btn');
        for(var i = 0; i< numPages; i++){
            if(i >= blockPerPage) {
                btn[i].style.display ='none';
            } else {
                lastbtn = i+1;
            }
        }

        $($Previous).addClass('disabled'); // 처음 이전 버튼은 비활성화

        $($Next).click(function(){
            if(lastbtn<numPages){
                $($Next).removeClass('disabled');
                
                for(var i = firstbtn-1; i<lastbtn; i++){ // 다음 블럭으로 넘어갈때 해당 페이지 active 비활성화
                    if(btn[i].getAttribute('class') == 'page-link page-btn active disabled'){
                        btn[i].classList.remove('active');
                        btn[i].classList.remove('disabled');
                    }
                }
                
                for(firstbtn; firstbtn<=lastbtn; firstbtn++){
                    btn[firstbtn-1].style.display ='none';
                }

                blockPage++;

                for(lastbtn; lastbtn < (blockPerPage*blockPage); lastbtn++){
                    btn[lastbtn].style.display = 'inline';
                }
                $($Previous).removeClass('disabled'); // 다음 페이지 버튼 눌렀을때 이전 버튼 활성화
                
                btn[firstbtn-1].classList.add('active');
                btn[firstbtn-1].classList.add('disabled');// 다음 블럭으로 넘어가면서 첫 페이지 리스트 활성화
                $('.active').trigger('click'); // 해당 버튼 강제로 클릭이벤트 발생
            } 

            if(lastbtn == numPages) {
                $($Next).addClass('disabled');
            }
        });

        $($Previous).click(function(){
            if(firstbtn>1){
                $($Previous).removeClass('disabled');
                
                btn[lastbtn-1].classList.remove('active');
                btn[lastbtn-1].classList.remove('disabled'); // 이전 블럭으로 넘어가면서 현 페이지 리스트 비활성화
                blockPage--;

                for(lastbtn; lastbtn > (blockPerPage*blockPage); lastbtn--){
                    btn[lastbtn-1].style.display = 'none';
                }

                for(firstbtn; firstbtn > lastbtn; firstbtn--){
                    btn[firstbtn-2].style.display ='inline';
                }
                
                for(var i = lastbtn-1; i<lastbtn; i++){ // 다음 블럭으로 넘어갈때 해당 페이지 active 활성화
                    if(btn[i].getAttribute('class') == 'page-link page-btn'){
                        btn[i].classList.add('active');
                        btn[i].classList.add('disabled');
                    }
                }
                $('.active').trigger('click'); // 해당 버튼 강제로 클릭이벤트 발생

            } 
            if(firstbtn == 1) {
                $($Previous).addClass('disabled');
            }
        });

    });
}

function goPage(e,listtype) {
	console.log(e);
	console.log(listtype);
	$.ajax({ 
			type : "GET", 
			url : "page", 
			traditional : true,
			data : {"pageNo" : e, "type":listtype},
			success : function(data){
				if(listtype == 'list'){
					$("#schedulelist").empty();
					$.each(data,function(index,item){
						if(item.flag == '1'.charAt(0)){
							$("#schedulelist").append(
								'<tr><td>'+item.shopname+'</td>'+
								'<td>'+item.addr+'</td>'+
								'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
								'<td>'+item.cnt+'명'+'</td>'+
								'<td><span class="label label-warning">진행중</span></td>'+
								'<td>'+item.ncdt+'</td>'+
								'<td><button data-toggle="modal" data-target="#detailreqModal"'+
								'class="btns btns-outline-secondary detailinfobtn" value="a'+item.sno+'">상세보기</button>'+
								'<td><button class="btns btns-outline-danger removebtn" value="a'+item.sno+'">삭제</button></td>'
								);
						}else if(item.flag == '2'.charAt(0)){
							$("#schedulelist").append(
									'<tr><td>'+item.shopname+'</td>'+
									'<td>'+item.addr+'</td>'+
									'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
									'<td>'+item.cnt+'명'+'</td>'+
									'<td><span class="label label-success">완료</span></td>'+
									'<td>'+item.ncdt+'</td>'+
									'<td><button data-toggle="modal" data-target="#detailreqModal"'+
									'class="btns btns-outline-secondary detailinfobtn" value="a'+item.sno+'">상세보기</button>'+
									'<td><button class="btns btns-outline-danger removebtn" value="a'+item.sno+'">삭제</button></td>'
									);
						}else if(item.flag == '3'.charAt(0)){
							$("#schedulelist").append(
									'<tr><td>'+item.shopname+'</td>'+
									'<td>'+item.addr+'</td>'+
									'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
									'<td>'+item.cnt+'명'+'</td>'+
									'<td><span class="label label-info">개인스케줄</span></td>'+
									'<td>'+item.ncdt+'</td>'+
									'<td><button data-toggle="modal" data-target="#detailreqModal"'+
									'class="btns btns-outline-secondary detailinfobtn" value="b'+item.sno+'">상세보기</button>'+
									'<td><button class="btns btns-outline-danger removebtn" value="b'+item.sno+'">삭제</button></td>'
									);
						}
					});
				}else if(listtype == 'inglist'){
					$("#ingschedulelist").empty();
					$.each(data,function(index,item){
							$("#ingschedulelist").append(
								'<tr><td>'+item.shopname+'</td>'+
								'<td>'+item.addr+'</td>'+
								'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
								'<td>'+item.cnt+'명'+'</td>'+
								'<td><span class="label label-warning">진행중</span></td>'+
								'<td>'+item.ncdt+'</td>'+
								'<td><button data-toggle="modal" data-target="#detailreqModal"'+
								'class="btns btns-outline-secondary detailinfobtn" value="a'+item.sno+'">상세보기</button>'+
								'<td><button class="btns btns-outline-danger removebtn" value="a'+item.sno+'">삭제</button></td>'
								);
					});
				}else if(listtype=='edlist'){
					$("#edschedulelist").empty();
					$.each(data,function(index,item){
							$("#edschedulelist").append(
								'<tr><td>'+item.shopname+'</td>'+
								'<td>'+item.addr+'</td>'+
								'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
								'<td>'+item.cnt+'명'+'</td>'+
								'<td><span class="label label-success">완료</span></td>'+
								'<td>'+item.ncdt+'</td>'+
								'<td><button data-toggle="modal" data-target="#detailreqModal"'+
								'class="btns btns-outline-secondary detailinfobtn" value="a'+item.sno+'">상세보기</button>'+
								'<td><button class="btns btns-outline-danger removebtn" value="a'+item.sno+'">삭제</button></td>'
								);
					});
					
				}else if(listtype='plist'){
					$("#pschedulelist").empty();
					$.each(data,function(index,item){
							$("#pschedulelist").append(
								'<tr><td>'+item.shopname+'</td>'+
								'<td>'+item.addr+'</td>'+
								'<td>'+item.nsdt+'~'+item.nedt+'</td>'+
								'<td>'+item.cnt+'명'+'</td>'+
								'<td><span class="label label-info">완료</span></td>'+
								'<td>'+item.ncdt+'</td>'+
								'<td><button data-toggle="modal" data-target="#detailperModal"'+
								'class="btns btns-outline-secondary detailinfobtn" value="b'+item.sno+'">상세보기</button>'+
								'<td><button class="btns btns-outline-danger removebtn" value="b'+item.sno+'">삭제</button></td>'
								);
					});
				}else{
					
				}
			},
			error : function(request, status, error) {
				swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
			}
		});
		
		
	}
