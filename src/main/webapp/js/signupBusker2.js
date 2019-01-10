var chkName=0;
var chkCity=0;
var chkTel=0;
var chkFile=0;

function checkName(){
    var names=$('#teamname').val();
    if(names.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $("#nameMsg").html("팀명을 입력해주세요.").css('color','red');
        chkName = 0;
    }else if (names.length>0) {
        chkName = 1;
        $("#nameMsg").html("사용 가능한 팀명입니다.").css('color','black');
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");

    } 
};
function checkCity(){
    if($('#city').val()=="") {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#cityMsg").html("도시를 입력해주세요.").css('color','red');
        chkCity = 0;
    } else if($('#city').val()!="") {
    	$("#cityMsg").html("").css('color','');
        chkCity = 1;
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    }
};

function checkTel(){
    if($('#tel').val()=="") {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#telMsg").html("연락처를 입력해주세요.").css('color','red');
        chkTel = 0;
    } else if (/(\d{2}).*(\d{3}).*(\d{4})/.test($('#tel').val())) {
        chkTel = 1;
        $("#telMsg").html("등록 가능한 연락처입니다.").css('color','black');
    } else {
        $("#telMsg").html("올바르지 않은 연락처입니다.").css('color','red');
    }
    if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    } 
};


function readURL(input) { 
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile=0;
        $(".signupbtn").prop("disabled", true);
        swal("잠깐!","이미지 파일만 올려주세요.","warning");
        $('#upload').attr('src', "/img/anonymous.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile = 1;
    }
    if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    }
}

$('#teamInfo').on('keyup',function(){
	var cont = $('#teamInfo').val();
	var contl = cont.length;
	$('.txtsize').empty();
	$('.txtsize').append("("+contl+"/250)");
	if(contl >= 250){
		$('.txtsize').empty();
		$('.txtsize').append("(250/250)");
		$('#teamInfo').val(cont.substring(0,250));
	}
});
