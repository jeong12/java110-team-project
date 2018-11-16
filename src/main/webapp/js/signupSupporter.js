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
                $("#name").css("background-color", "#FFCECE");
                $("#nameMsg").html("상호명을 입력해주세요.")
                chkName = 0;
            } else if (data == '0') {
                $("#name").css("background-color", "#B0F6AC");
                $("#nameMsg").html("사용 가능한 상호명입니다.")
                chkName = 1;
                if(chkName==1 && chkDetAddr ==1&& chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
                    $(".signupbtn").prop("disabled", false);
                    $(".signupbtn").css("background-color", "#4CAF50");
                } 
            } else if (data >= '1') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#name").css("background-color", "#FFCECE");
                $("#nameMsg").html("이미 존재하는 상호명입니다.")
                chkName = 0;
            } 
        }
    });
}

$('chkFlag button').click(function(){
    alert("::::::::");
});

function checkDetailAddr(){ 
    var baddr=$('#baseaddr').val();
    var detaddr=$('#detailaddr').val();
    if(detaddr.length<=0 || baddr.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#detailaddr").css("background-color", "#FFCECE");
        $("#daMsg").html("주소를 입력해주세요.")
        chkDetAddr = 0;
    }else if (detaddr.length>0 && baddr.length>0) {
        $("#detailaddr").css("background-color", "#B0F6AC");
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
        $("#capa").css("background-color", "#FFCECE");
        $("#capaMsg").html("수용인원을 입력해주세요.")
        chkCapa = 0;
    } else if (capacity.length>0) {
        $("#capa").css("background-color", "#B0F6AC");
        chkCapa = 1;

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
        $("#tel").css("background-color", "#FFCECE");
        $("#capaMsg").html("수용인원을 입력해주세요.")
        chkTel = 0;
    } else if (tele.length>0) {
        $("#tel").css("background-color", "#B0F6AC");
        chkTel = 1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    } 
};


function readURL1(input) { 
    var chkImg = document.getElementById('input_img1').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile1=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
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
        alert("이미지 파일만 올려주세요");
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
        alert("이미지 파일만 올려주세요");
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
