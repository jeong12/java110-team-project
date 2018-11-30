function todayTime(){
    var today = new Date();
    var mm = today.getMonth()+1;
    var dd = today.getDate();
    var day = today.getDay(); // 0~6

    if(mm<10){
        mm = '0'+mm;
    }

    if( dd < 10){
        dd = '0'+dd;
    }

    if(day == 1){
        day = 'Mon';
    } else if(day == 2){
        day = 'Tue';
    } else if(day == 3){
        day ='Wed';
    } else if(day == 4){
        day ='Thu';
    } else if(day == 5){
        day ='Fri';
    } else if(day == 6){
        day ='Sat';
    } else if(day == 7){
        day ='Sun';
    }

    day = mm+'.'+dd+day;
    $('#today').text(day);
}