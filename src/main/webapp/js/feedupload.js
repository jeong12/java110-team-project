/* 사진 업로드 처리 */
function readURL1(input) { 
    var chkImg = document.getElementById('input_img1').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    var chkFile1 = 0;
    var chkFile2 = 0;
    var chkFile3 = 0;
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile1=0;
        $(".uploadbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload1').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload1').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile1 = 1;

        if(chkFile1==1 || chkFile2==1 || chkFile3==1) {
            $(".uploadbtn").prop("disabled", false);
            $(".uploadbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL2(input) { 
    var chkImg = document.getElementById('input_img2').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    var chkFile1 = 0;
    var chkFile2 = 0;
    var chkFile3 = 0;
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile2=0;
        $(".uploadbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload2').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload2').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile2=1;

        if(chkFile1==1 || chkFile2==1 || chkFile3==1) {
            $(".uploadbtn").prop("disabled", false);
            $(".uploadbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL3(input) { 
    var chkImg = document.getElementById('input_img3').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    var chkFile1 = 0;
    var chkFile2 = 0;
    var chkFile3 = 0;
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile3=0;
        $(".uploadbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload3').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload3').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile3= 1;
        if(chkFile1==1 || chkFile2==1 || chkFile3==1) {
            $(".uploadbtn").prop("disabled", false);
            $(".uploadbtn").css("background-color", "#4CAF50");
        }
    }
};

/* 영상 업로드 처리 */
$(".urlchk").on('click', function() {
    var url=document.getElementById('url').value;
    console.log(url.length);
    var fronturl = url.substring(0,32);

    if(fronturl != 'https://www.youtube.com/watch?v='){
        alert('똑바로 유튜브 위의 url을 써주세요!!');
    }else if(url.length != 43){
        alert('똑바로 유튜브 위의 url을 써주세요!!');
    }
    else{
        var thumbnail="https://i.ytimg.com/vi/"+url.substring(32,43)+"/hqdefault.jpg";
         $("#uploadavi").attr("src",thumbnail);
         $(".uploadbtn").prop("disabled", false);
         $(".uploadbtn").css("background-color", "#4CAF50");
    }
});














