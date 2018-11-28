$().ready(function(){
    var id = document.getElementById('memId').innerHTML;
    var imgPath = document.getElementById('memPro').innerHTML;
    var login = document.getElementsByClassName('login');
    var logout = document.getElementsByClassName('logout');
    var profile_img = document.getElementsByClassName('prof');
    console.log(imgPath);
    if(id.length > 0){
        login[0].style.display = 'none';
        logout[0].style.display = 'inline';
        profile_img[0].style.display = 'inline';

        if(imgPath.length > 0){
            $('#pro_img').attr('src', 'http://localhost:8080/upload/'+imgPath);
        }
    } else {
        login[0].style.display = 'inline';
        logout[0].style.display = 'none';
        profile_img[0].style.display = 'none';
    }

    aviFilter(logout); //메인 동영상 필터

});

function aviFilter(logout){
    var folAvi = document.getElementsByClassName('fol_avi');
    var recAvi = document.getElementsByClassName('rec_avi');
    var chkFol = document.getElementById('chkFol');
    if(logout[0].style.display == 'inline' && chkFol.childNodes.length > 1){
        folAvi[0].style.display = 'inline';
        recAvi[0].style.display = 'none';
    } else {
        folAvi[0].style.display = 'none';
        recAvi[0].style.display = 'inline';
    }
}
