
$().ready(function(){
    /*메인 리스트 필터*/
    var busker = document.getElementById('busker').innerHTML;
    var sup = document.getElementById('sup').innerHTML;
    var mem_list_head = document.getElementById('mem_lis_head');
    var bus_list_head = document.getElementById('bus_lis_head');
    var sup_list_head = document.getElementById('sup_lis_head');
    var list_titl = document.getElementById('list_titl');

    if(busker.length > 0 ){
        list_titl.innerHTML = 'HOT PLACE';
        mem_list_head.style.display = 'none';
        bus_list_head.style.display = 'table-header-group';
        sup_list_head.style.dispaly = 'none';
    } else if (sup.length > 0){
        list_titl.innerHTML = 'Best Buskers';
        mem_list_head.style.display = 'none';
        bus_list_head.style.display = 'none';
        sup_list_head.style.display = 'table-header-group';
    } else {
        list_titl.innerHTML = '오늘의 공연 <span id="today"></span>';
        mem_list_head.style.display = 'table-header-group';
        bus_list_head.style.display = 'none';
        sup_list_head.style.dispaly = 'none';
        todayTime(); // 시간 설정
    }

    //오늘의 리스트 //
    if($('#mem_lis_head').css("display") != "none" && $('#bus_lis_head').css("display") == "none"){

        // 오늘의 리스트 뽑는 ajax
        $('#mem_lis_head').ready(function(){
            $.ajax({ 
                type : "POST", 
                url : "main",
                dataType: 'json',
                //data: values, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        var timeSdt = item.sdt;
                        var timeEdt = item.edt;
                        var dateSdt = new Date(timeSdt);
                        var dateEdt = new Date(timeEdt);
                        $('#mainList').append(
                                '<tr><td scope="row">'+item.busker.teamname+'</td>'+
                                '<td>'+item.busker.teamgenre+'</td>'+
                                '<td>'+item.addr+'</td>'+
                                '<td>'+dateSdt.getHours()+zeroPlus(dateSdt.getMinutes())+
                                '~'+dateEdt.getHours()+zeroPlus(dateEdt.getMinutes())+'</td></tr>'
                        ).hide();
                    });

                    pasing(); //페이징 처리
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });


        });


        /*오늘의 공연 검색 기능 */
        $('#Sear').click(function(){
            var city = $('input.form-control').val();
            console.log(city);
            $.ajax({ 
                type : "POST", 
                url : "todaySear",
                dataType: 'json',
                data: {"city":city}, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        var timeSdt = item.sdt;
                        var timeEdt = item.edt;
                        var dateSdt = new Date(timeSdt);
                        var dateEdt = new Date(timeEdt);
                        $('#mainList').append(
                                '<tr><td scope="row">'+item.busker.teamname+'</td>'+
                                '<td>'+item.busker.teamgenre+'</td>'+
                                '<td>'+item.addr+'</td>'+
                                '<td>'+dateSdt.getHours()+zeroPlus(dateSdt.getMinutes())+
                                '~'+dateEdt.getHours()+zeroPlus(dateEdt.getMinutes())+'</td></tr>'
                        ).hide();
                    });
                    pasing();
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });
        });
    }

    if($('#bus_lis_head').css("display") != "none"){ // HOT PLACE
        //  버스커회원일때 Hot place 뽑는 ajax
        $('#bus_lis_head').ready(function(){
            $.ajax({ 
                type : "POST", 
                url : "hotPlace",
                dataType: 'json',
                //data: values, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        $('#mainList').append(
                                '<tr onclick="OpenImg();"><td scope="row">'+item.name+'</td>'+
                                '<td>'+item.sgnere+'</td>'+
                                '<td>'+item.baseaddr+'</td>'+
                                '<td class="supno" style="display:none">'+item.no+'</td></tr>'
                        ).hide();
                    });
                    pasing();
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });

        });


        $('#Sear').click(function(){
            var city = $('input.form-control').val();
            console.log(city);
            $.ajax({ 
                type : "POST", 
                url : "hotSear",
                dataType: 'json',
                data: {"city":city}, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        $('#mainList').append(
                                '<tr onclick="OpenImg();"><td scope="row">'+item.name+'</td>'+
                                '<td>'+item.sgnere+'</td>'+
                                '<td>'+item.baseaddr+'</td>'+
                                '<td class="supno" style="display:none">'+item.no+'</td></tr>'
                        ).hide();
                    });
                    pasing();
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });
        });
    }

    if($('#sup_lis_head').css("display") != "none"){ 
        //  제공자회원일때 Best Buskers 뽑는 ajax
        $('#sup_lis_head').ready(function(){
            $.ajax({ 
                type : "POST", 
                url : "bestBuskers",
                dataType: 'json',
                //data: values, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        $('#mainList').append(
                                '<tr onclick="OpenDetail();"><td scope="row">'+item.teamname+'</td>'+
                                '<td>'+item.teamgenre+'</td>'+
                                '<td>'+item.city+'</td>'+
                                '<td class="bno" style="display:none">'+item.no+'</td></tr>'
                        ).hide();
                    });
                    pasing();
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });

        });

        $('#Sear').click(function(){
            var city = $('input.form-control').val();
            console.log(city);
            $.ajax({ 
                type : "POST", 
                url : "bestSear",
                dataType: 'json',
                data: {"city":city}, 
                success : function(data) {
                    console.log(data);
                    $('#mainList').empty();
                    $.each(data,function(index,item){
                        $('#mainList').append(
                                '<tr onclick="OpenDetail();"><td scope="row">'+item.teamname+'</td>'+
                                '<td>'+item.teamgenre+'</td>'+
                                '<td>'+item.city+'</td>'+
                                '<td class="bno" style="display:none">'+item.no+'</td></tr>'
                        ).hide();
                    });
                    pasing();
                },
                error : function(request, status, error) {
                    alert("실패~");
                }
            });
        });
    }

});

function zeroPlus(min){
    if(min< 10){
        return ':'+min+ '0';
    } else{
        return ':'+min
    }
}

/*페이징 처리*/
function pasing(){
    $('#mainList').each(function() {

        var currentPage = 1;
        var numPerPage = 3; // 페이지당 보일 리스트 갯수
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
        $('#button').children().remove(); // 상세검색시 페이징 초기화
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
                lastbtn = i+1;
            }
        }

        $($Previous).addClass('disabled'); // 처음 이전 버튼은 비활성화

        $($Next).click(function(){
            if(lastbtn<=numPages && !$($Next).hasClass('disabled')){ 
                $($Next).removeClass('disabled');

                for(var i = firstbtn; i<lastbtn; i++){ // 다음 블럭으로 넘어갈때 해당 페이지 active 비활성화
                    if(btn[i-1].getAttribute('class') == 'page-link page-btn active disabled'){
                        btn[i-1].classList.remove('active');
                        btn[i-1].classList.remove('disabled');
                    }
                }

                for(firstbtn; firstbtn < lastbtn; firstbtn++){
                    btn[firstbtn-1].style.display ='none';
                }

                blockPage++;

                for(lastbtn; lastbtn <= (blockPerPage*blockPage); lastbtn++){
                    if(btn[lastbtn-1] != null){
                        btn[lastbtn-1].style.display = 'inline';
                    } else break;
                }
                lastbtn--;

                $($Previous).removeClass('disabled'); // 다음 페이지 버튼 눌렀을때 이전 버튼 활성화

                btn[firstbtn-1].classList.add('active');
                btn[firstbtn-1].classList.add('disabled');// 다음 블럭으로 넘어가면서 첫 페이지 리스트 활성화
                $('.active').trigger('click'); // 해당 버튼 강제로 클릭이벤트 발생
            } 

            if(lastbtn >= numPages) {
                $($Next).addClass('disabled');
            }
        });

        $($Previous).click(function(){
            if(firstbtn>3){
                $($Previous).removeClass('disabled');

                btn[lastbtn-1].classList.remove('active');
                btn[lastbtn-1].classList.remove('disabled'); // 이전 블럭으로 넘어가면서 현 페이지 리스트 비활성화
                blockPage--;

                for(lastbtn; lastbtn > (blockPerPage*blockPage); lastbtn--){
                    btn[lastbtn-1].style.display = 'none';
                }

                for(var i = firstbtn; i > firstbtn-3; i--){
                    btn[i-2].style.display ='inline';
                }
                firstbtn-=3;

                for(var i = lastbtn-1; i<lastbtn; i++){ // 다음 블럭으로 넘어갈때 해당 페이지 active 활성화
                    if(btn[i].getAttribute('class') == 'page-link page-btn'){
                        btn[i].classList.add('active');
                        btn[i].classList.add('disabled');
                    }
                }

                lastbtn++;

                $('.active').trigger('click'); // 해당 버튼 강제로 클릭이벤트 발생

            } 
            if(firstbtn == 1) {
                $($Previous).addClass('disabled');
            }
        });

    });

    var cap = document.getElementsByClassName('caption');
    $('.thumb').hover(function(){
        $(this).find('.caption').fadeIn(250);
    },function(){
        $(this).find('.caption').fadeOut(250);
    }); 

}

/*HOT PLACE 클릭시 이벤트 */
function OpenImg(){
    $(document).on('click','tbody#mainList tr',function(e){

        e.stopImmediatePropagation();
        var no = $(this).find('.supno').text();

        $.ajax({ 
            type : "POST", 
            url : "supPhoto",
            dataType: 'json',
            data: {"no":no}, 
            success : function(data) {
                //console.log(data);
                
                var $consup = $('.hotPlace').find('a');
                $consup.attr('href','applystages/page?sno='+no);
                
                var subimg = document.getElementsByClassName('placeImg');
                $.each(data,function(index,item){
                    if(index == 0){
                        $('.placeMainImg').attr('src','/upload/'+item.photo);
                    }
                    subimg[index].setAttribute('src','/upload/'+item.photo);
                });

                $('.streaming').find('h1').next().remove();
            },
            error : function(request, status, error) {
                alert("실패~");
            }
        });

        $('.streaming').hide();
        $('.hotPlace').show();
    });  
}

/*Best Buskers 클릭시 이벤트 */
function OpenDetail(){
    $(document).on('click','tbody#mainList tr',function(e){

        e.stopImmediatePropagation();

        var no = $(this).find('.bno').text();

        $.ajax({ 
            type : "POST", 
            url : "busDetail",
            dataType: 'json',
            data: {"no":no}, 
            success : function(data) {
                $('table.custab').empty();
                $.each(data,function(index,item){
                    $('.BusMainImg').attr('src' ,'/upload/'+item.teamPhoto);
                    $('table.custab').append(
                            '<tr><th class="busTh">팀명</th>'+
                            '<td>'+item.teamname+'</td></tr>'+
                            '<tr><th class="busTh">장르/퍼포먼스</th>'+
                            '<td>'+item.teamgenre+'</td></tr>'+
                            '<tr><th class="busTh">좋아요</th>'+
                            '<td>'+item.likecount+'</td></tr>'
                    );
                });

                $('.streaming').find('h1').next().remove();
            },
            error : function(request, status, error) {
                alert("실패~");
            }
        });
        $('.streaming').hide();
        $('.bestBus').show();
    });  
}

function placeImg(){
    $(document).on('click','.placeImg',function(e){
        e.stopImmediatePropagation(); // 상위 뿐아니라 같은레벨의 동작도 중지 시킴  
        var changeImg = $(this).attr('src');

        $('.placeMainImg').attr('src',changeImg);
    });
}
