
$('document').ready(function(){
    $('#todayList').each(function() {
        var currentPage = 1;
        var numPerPage = 1; // 페이지당 보일 갯수
        var $table = $(this).show();
        $table.bind('repaginate', function() {
            $table.find('tr').hide()
            //기본적으로 모두 감춘다
            .slice((currentPage - 1) * numPerPage,
                    currentPage * numPerPage)
                    .show();
            //현재페이지+1 곱하기 현재페이지까지 보여준다
        }); 

        var numRows = $table.find('tr').length;//length로 전체길이구함
        console.log(numRows);
        var numPages = Math.ceil(numRows / numPerPage); //Math.ceil를 이용하여 반올림

        var $pager = $('<ul class="nav justify-content-center" id="pasingNum">');

        for (var page = 1; page <= numPages; page++) {
            $('<a class="page-link"></a>').text(page)
            .bind('click', {newPage: page}, function(event) {        
                currentPage = event.data['newPage'];
                $table.trigger('repaginate');
                //for구문을 이용하여 페이지 수만큼
                //버튼을 구현
                $(this).addClass('active')
                //활성화된페이지에는 active라는 클래스명을 붙여준다.
                .siblings().removeClass('active');
            }).appendTo($pager).addClass('clickable');
        }
        //$('<li class="page-item"></li>').append(a_tag);
        $pager.appendTo('#button')
        //앞서 설정한 페이지키를 삽입
        .find('a.page-link:first').addClass('active');
        $('.active').trigger('click');
    });
    
});

$.ajax({ 
    type : "POST", 
    url : "main",
    dataType: 'json',
    //data: values, 
    success : function(data) {
        console.log(data);
        $('#todayList').empty();
        $.each(data,function(index,item){
            var timeSdt = item.sdt;
            var timeEdt = item.edt;
            var dateSdt = new Date(timeSdt);
            var dateEdt = new Date(timeEdt);
            $('#todayList').append(
                    '<tr><td scope="row">'+item.busker.teamname+'</td>'+
                    '<td>'+item.busker.teamgenre+'</td>'+
                    '<td>'+item.supporter.baseaddr.substring(6,8)+'</td>'+
                    '<td>'+dateSdt.getHours()+zeroPlus(dateSdt.getMinutes())+
                    '~'+dateEdt.getHours()+zeroPlus(dateEdt.getMinutes())+'</td>'
            ).hide();
        });

        /*$("#pasingNum").empty();  //페이징에 필요한 객체내부를 비워준다.

        for(var i = values.pageFirst ; i <= values.pageSize ; i++){        //시작페이지부터 종료페이지까지 반복문

            if($('li.page-item').val() == i){                            //현재페이지가 반복중인 페이지와 같다면
                $("#pasingNum").append("<li class='page-item num disabled' value="+i+">" +
                		"<a class='page-link' value>"+i+"</a></li>");    //버튼 비활성화

            }else{
                $("#pasingNum").append("<li class='page-item num' value="+i+">" +
                		"<a class='page-link'>"+i+"</a></li>"); //버튼 활성화
            }

        }*/

        /*if(paging.block < paging.totalBlock){            //전체페이지블럭수가 현재블럭수보다 작을때

            $("#pasingNum").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화

        }else{

            $("#pasingNum").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화

        }*/

//      첫번째 페이지로 가기 버튼 이벤트

        /*$(".goBackPage").click(function(){

            page = Number(paging.startPage) - 1;

            pageFlag = 1;

            $("상단 ajax를 함수로 만들어 재귀호출");

            pageFlag = 0;

        });*/



        /*$(".num").click(function(){

            pageFlag = 1;

            $("상단 ajax를 함수로 만들어 재귀호출");

            pageFlag = 0;

        });*/



        /*//다음페이지로 가기 클릭이벤트

        $(".goNextPage").click(function(){

            page = Number(paging.endPage) + 1;

            pageFlag = 1;

            $("상단 ajax를 함수로 만들어 재귀호출");

            pageFlag = 0;

        });



        //마지막페이지로 가기 클릭이벤트

        $(".goLastPage").click(function(){

            page = paging.totalPage;

            pageFlag = 1;

            $("상단 ajax를 함수로 만들어 재귀호출");

            pageFlag = 0;

        });*/



    },
    error : function(request, status, error) {
        alert("실패~");
    }
});







function zeroPlus(min){
    if(min< 10){
        return ':'+min+ '0';
    } else{
        return ':'+min
    }
}
