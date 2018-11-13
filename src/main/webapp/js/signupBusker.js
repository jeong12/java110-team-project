var chkName=0;
var chkCity=0;
var chkTel=0;
var chkFile=0;

function checkName(){
    var names=$('#teamname').val();
    console.log(names);
    console.log(names.length);
    if(names.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#teamname").css("background-color", "#FFCECE");
        $("#nameMsg").html("팀명을 입력해주세요.")
        chkName = 0;
    }else if (names.length>0) {
        chkName = 1;
        $("#teamname").css("background-color", "#B0F6AC");
        $("#nameMsg").html("사용 가능한 팀명입니다.")
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
        $("#city").css("background-color", "#FFCECE");
        $("#cityMsg").html("도시를 입력해주세요.")
        chkCity = 0;
    } else if($('#city').val()!="") {
        $("#city").css("background-color", "#B0F6AC");
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
        $("#tel").css("background-color", "#FFCECE");
        $("#telMsg").html("연락처를 입력해주세요.")
        chkTel = 0;
    } else if ($('#tel').val()!="") {
        $("#tel").css("background-color", "#B0F6AC");
        chkTel = 1;
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
        alert("이미지 파일만 올려주세요");
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
