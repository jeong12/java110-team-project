
    var chkId=0;
    var chkPwd=0;
    var chkEmail=0;
    var chkNick=0;
    var chkGenre=0;
    var chkFile=1;
        
    function ChkCount(obj){
        console.log(chkFile);
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
                console.log("chk"+chkCnt);
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        }else if(chkCnt>3){
            alert("최대 3개까지만 선택하실 수 있습니다.");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);          
        }
    }
    
    function sendMsg(){
        alert($('#checknickname').val() + '님 환영합니다!')
        }
    
    function checkId(){
        console.log(chkFile);
        var inputed = $('#checkid').val();
        $.ajax({
            data : {
                date : inputed
            },
            url : "checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkid").css("background-color", "#FFCECE");
                    $("#idMsg").html("아이디를 입력해주세요.")
                    chkId = 0;
                } else if (data == '0') {
                    $("#checkid").css("background-color", "#B0F6AC");
                    $("#idMsg").html("사용 가능한 아이디입니다.")
                    chkId = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkid").css("background-color", "#FFCECE");
                    $("#idMsg").html("이미 존재하는 아이디입니다.")
                    chkId = 0;
                } 
            }
        });
    }
    
    function checkPwd() {
        console.log(chkFile);
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
            
        if(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(inputed)){
            $('#pwd').css("background-color", "#B0F6AC");
            $('#pwdMsg').html("사용가능한 비밀번호입니다.")
        }else{
            $("#pwd").css("background-color", "#FFCECE");
            $('#pwdMsg').html("8자 이상 영어,숫자,특수문자를 포함해주세요 ")
            $(".signupbtn").prop("disabled", true);
        }
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $("#rePassword").html("위와 같은 비밀먼호를 입력해주세요")
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#B0F6AC");
                $("#rePassword").html("비밀번호가 일치합니다.")
            chkPwd = 1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick==1 && chkGenre==1 && chkFile==1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        } else if (inputed != reinputed) {
            $("#rePassword").html("비밀번호가 일치하지않습니다.")
            chkPwd = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
            
        }
    }
    
    function checkEmail(){
        console.log(chkFile);
        var inserted =$('#checkemail').val();
        $.ajax({
            data : {
                email : inserted
            },
            url : "checkEmail",
            success : function(data) {
                if(inserted=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkemail").css("background-color", "#FFCECE");
                    $("#emailMsg").html("이메일을 입력해주세요.")
                    chkEmail = 0;
                } else if (data == '0') {
                    $("#checkemail").css("background-color", "#B0F6AC");
                    $("#emailMsg").html("사용 가능한 이메일입니다.")
                    chkEmail = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#emailMsg").html("이미 존재하는 이메일입니다.")
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkemail").css("background-color", "#FFCECE");
                    chkEmail = 0;
                } 
            }
        });
    }
    
    function checkNickname(){
        var nick =$('#checknickname').val();
        $.ajax({
            data : {
                nickname : nick
            },
            url : "checkNick",
            success : function(data) {
                if(nick=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checknickname").css("background-color", "#FFCECE");
                    $("#nickMsg").html("닉네임을 입력해주세요.")
                    chkNick = 0;
                } else if (data == '0') {
                    $("#checknickname").css("background-color", "#B0F6AC");
                    $("#nickMsg").html("사용 가능한 닉네임입니다.")
                    chkNick = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#nickMsg").html("이미 존재하는 닉네임입니다.")
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checknickname").css("background-color", "#FFCECE");
                    chkNick = 0;
                } 
            }
        });
    }

    function readURL(input) { 
    
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
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
    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    } 
    }
    }
    function ChkCount(obj){
        console.log(chkFile);
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
                console.log("chk"+chkCnt);
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        }else if(chkCnt>3){
            alert("최대 3개까지만 선택하실 수 있습니다.");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);          
        }
    }
    