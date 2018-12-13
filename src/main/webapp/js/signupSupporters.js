var chkName=0;
var chkDetAddr=0;
var chkCapa=0;
var chkTel=0;
var chkFile1=0;
var chkFile2=0;
var chkFile3=0;
function checkName(){
    var names=$('#name').val(); 
    $.ajax({
        data : {
            name : names
        },
        url : "checkName",
        success : function(data) {
            if(names.length<=0 && data=='0') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#nameMsg").html("상호명을 입력해주세요.").css('color','red');
                chkName = 0;
            } else if (data == '0') {
                $("#nameMsg").html("사용 가능한 상호명입니다.").css('color','black');
                chkName = 1;
                if(chkName==1 && chkDetAddr ==1&& chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
                    $(".signupbtn").prop("disabled", false);
                    $(".signupbtn").css("background-color", "#4CAF50");
                } 
            } else if (data >= '1') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#nameMsg").html("이미 존재하는 상호명입니다.").css('color','red');
                chkName = 0;
            } 
        }
    });
}

$('chkFlag button').click(function(){
});

function checkDetailAddr(){ 
    var baddr=$('#baseaddr').val();
    var detaddr=$('#detailaddr').val();
    if(detaddr.length<=0 || baddr.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#daMsg").html("주소를 입력해주세요.").css('color','red');
        chkDetAddr = 0;
    }else if (detaddr.length>0 && baddr.length>0) {
    	$("#daMsg").html(" ");
        chkDetAddr = 1;
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");

        }
    }
};

function checkCapa(){  
    var capacity=$('#capa').val();
    if(capacity.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#capaMsg").html("수용인원을 입력해주세요.").css('color','red');
        chkCapa = 0;
    } else if (capacity.length>0) {
        chkCapa = 1;
        $("#capaMsg").html(" ");
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function checkTel(){
    var tele=$('#tel').val();
    if(tele.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#telMsg").html("전화번호를 입력해주세요.").css('color','red');
        chkTel = 0;
    }else if (/(\d{2}).*(\d{3}).*(\d{4})/.test($('#tel').val())) {
        chkTel = 1;
        $("#telMsg").html("등록 가능한 연락처입니다.").css('color','black');
    
    }else{
    	$("#telMsg").html("올바르지 않은 연락처입니다.").css('color','red');
    }if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    } 
};

function readURL1(input) { 
    var chkImg = document.getElementById('input_img1').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile1=0;
        $(".signupbtn").prop("disabled", true);
        swal("잠깐!","이미지 파일만 올려주세요.","warning");
        $('#upload1').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload1').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile1 = 1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL2(input) { 
    var chkImg = document.getElementById('input_img2').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile2=0;
        $(".signupbtn").prop("disabled", true);
        swal("잠깐!","이미지 파일만 올려주세요.","warning");
        $('#upload2').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload2').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile2=1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL3(input) { 
    var chkImg = document.getElementById('input_img3').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile3=0;
        $(".signupbtn").prop("disabled", true);
        swal("잠깐!","이미지 파일만 올려주세요.","warning");
        $('#upload3').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload3').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile3= 1;
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function goDaum(){
	$('#baseaddr').val("");
	searchAddr();
}
