/*페이징 처리*/
function pasing(){
    $('#pageno').each(function() {

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

    var cap = document.getElementsByClassName('caption');
    $('.thumb').hover(function(){
        $(this).find('.caption').fadeIn(250);
    },function(){
        $(this).find('.caption').fadeOut(250);
    }); 

}