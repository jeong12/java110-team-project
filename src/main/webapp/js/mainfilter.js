$().ready(function(){
    var id = document.getElementById('memId').innerHTML;
    var sup = document.getElementById('sup').innerHTML;
    var busk = document.getElementById('busker').innerHTML;
    
    /* 인터셉터하기 이전 alert 안내 문구*/
    $('#blueMenuB').on('click',function(e){
        e.stopImmediatePropagation();
        if(busk.length > 0){
            swal("잠깐!","이미 버스커 회원입니다.","error");
        }
        if(sup.length > 0){
            swal("잠깐!","제공자회원은 버스커가 될 수 없습니다!","error");
        }
        if (id.length <= 0){
            swal("잠깐!","일반회원이 아닙니다!","error");
        }
        $('button.swal-button').on('click', function(){
            location.href="signup/busker/form";
        });
    });

    $('#blueMenuS').on('click',function(e){
        e.stopImmediatePropagation();
        if(busk.length > 0){
            swal("잠깐!","버스커회원은 제공자가 될 수 없습니다!","error");
        }
        if(sup.length > 0){
            swal("잠깐!","이미 제공자 회원입니다.","error");
        }
        if (id.length <= 0){
            swal("잠깐!","일반회원이 아닙니다!","error");
        }
        $('button.swal-button').on('click', function(){
            location.href="signup/supporter/form";
        });
    });

});