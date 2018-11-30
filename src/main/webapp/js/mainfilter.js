$().ready(function(){
    var id = document.getElementById('memId').innerHTML;
    var sup = document.getElementById('sup').innerHTML;
    var busk = document.getElementById('busker').innerHTML;
    
    $('.blueMenuF').on('click',function(e){
        e.stopImmediatePropagation();
        
        if(busk.length > 0){
            swal("이미 버스커 회원입니다.");
        }
        //location.href="signup/busker/form";
    });
});