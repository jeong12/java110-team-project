$().ready(function(){
    var id = document.getElementById('memId').innerHTML;
    var sup = document.getElementById('sup').innerHTML;
    var busk = document.getElementById('busker').innerHTML;

    /* 인터셉터하기 이전 alert 안내 문구*/
    $('.btn-enroll').on('click',function(e){
        e.stopImmediatePropagation();

        if(busk.length > 0 ){
            location.href="../BuskerBoard/form";
        } else {
            swal("잠깐!","버스커회원만 등록 가능합니다!","error");
        }
    });
});