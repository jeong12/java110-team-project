// carousel acitve
$('#carousel-example-generic').ready(function(){
       
        var firstImg = document.getElementsByClassName('item');
        $(firstImg[0]).addClass('active');
    });

function SignBusker(){
    location.href = "../signup/busker/form";
}

function SignSupporter(){
    location.href = "../signup/supporter/form";
}

function EditMem(){
    location.href = "member/form";
}

function EditBus(){
    location.href = "busker/form";
}

function EditSup(){
    location.href = "supporter/form";
}