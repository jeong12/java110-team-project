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
});
