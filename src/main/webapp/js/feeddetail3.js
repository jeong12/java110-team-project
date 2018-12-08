
/* 사진 모달 처리 */
$(".col-md-4.photo button").on('click', function() {
    var pbno=$(this).val();
    console.log(pbno);
    $.ajax({
        type:"GET",
        url:"showphoto",
        data:{"pbno" : pbno},
        success: function(data){
            console.log(data);
            $(".feedphoto1").empty();
            $(".feedphoto2").empty();
            $(".infocontent").empty();
            $(".insertcontent").empty();
            $(".comtlist").empty();

            $(".feedphoto1").append("<img src='../../upload/"+data.feedphotoFiles[0].filename+"' alt='첫번쨰사진' class='bigimg'>");
            $.each(data.feedphotoFiles,function(index,item){
                $(".feedphoto2").append("<td><button value='"+item.filename+"' ><img src='../../upload/"+item.filename+"' alt='....' class='smallimg'></button></td>")
            });
            
            // 팀 정보!!
            if(data.teamPhoto ==null){
                var value = "<img id='teamphoto' src='img/phot1.png' style='width:100%;height: 100%;' alt='프로필사진'>";
            } else{
                var value = "<img src='../../upload/"+data.teamPhoto+"' style='width:100%;height: 100%;' alt='프로필사진' id='teamphoto'>";
            }
            $(".infocontent").append(
                    '<div class="top">'+
                    '<div class="infoimg">'+
                    value+
                    '</div>'+
                    '<div class="infodata">'+
                    '<table>'+
                        '<tr><td style="font-weight: 1000;"}>'+data.teamname+'</td></tr>'+
                        '<tr><td id="modalgenre">'+data.teamgenre+' / </td><td id="modalcity"> '+data.city+'</td></tr>'+
                    '</table>'+
                    '</div>'+
                  '</div>'+
                  '<div class="mid">'+
                    '<textarea readonly="readonly" disabled style="resize:none;width:100%;'+ 
                  ' font-size:20px;background-color:white;border: 0;"  rows="3">'+data.feedcont+'</textarea>'+
                  '</div>'+
                  '<div class="bot">'+
                    '<i class="far fa-heart modallike" style="margin-right: 30px;"></i>'+
                    data.lcnt+
                  '</div>'
            );
            
            //댓글
            $(".insertcontent").append(
                    '<form action="insertphotocomt">'+
                    '<textarea name="comtcont" id="comtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                    '</textarea>'+
                    '<br>'+
                    '<button style="float:right;" class="btn btns-outline-m">입력</button>'+
                    '</form>'
            );
            if(data.comtcount == 5){
                $.each(data.comments,function(index,item){
                    if(item.comtphot ==null){
                        var value = "<img id='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                    } else{
                        var value = "<img id='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                    }
                    $(".comtlist").append(
                            '<div class="comtwrap">'+
                            '<div class="comttop">'+
                                '<div class="comtimg">'+
                                value+
                                '</div>'+
                                '<div class="comtcont">'+
                                '<textarea readonly="readonly" disabled id="comtcont" style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                                '</div>'+
                            '</div>'+
                            '<div class="comtbottom">'+
                                '<div class="comtname">'+item.comtname+'</div>'+
                                '<div class="comtdate">'+item.strcdt+'</div>'+
                            '</div>'+
                        '</div>'
                    );
                })
            }

            $(".feedphoto2 button").on('click',function(){
                var src=$(this).val();
                console.log(src);
                $(".feedphoto1").empty();
                $(".feedphoto1").append("<img src='../../upload/"+src+"' alt='첫번쨰사진' class='bigimg'>");
            });
        }
    });
});

/* 영상 모달처리 */
$('.col-md-4.avi button').on('click', function() {
    var abno=$(this).val();
    console.log(abno);
    $.ajax({
        type:"GET",
        url:"showavi",
        data:{"abno" : abno},
        success: function(data){
            $(".feedavi").empty();
            $(".modal-header.avi").empty();
            $(".infocontent").empty();
            $(".insertcontent").empty();
            $(".comtlist").empty();
            
            if(data.length != 0){
                $(".modal-header.avi").append(
                        data.title+
                        "<button type='button' class='close' data-dismiss='modal'"+
                        "aria-label='Close' style='padding-right: 10px;'>"+
                        "<p>×</p>"+
                        "</button>"
                );
                $(".feedavi").append(
                        "<iframe src='https://www.youtube.com/embed/"+data.urlid+"?ecver=2'"+
                        "width='500px' height='280px' frameborder='0'"+ 
                        "allow='autoplay; encrypted-media' allowfullscreen></iframe>"
                );
                
                // 팀 정보!!
                if(data.teamPhoto ==null){
                    var value = "<img id='teamphoto' src='img/phot1.png' style='width:100%;height: 100%;' alt='프로필사진'>";
                } else{
                    var value = "<img src='../../upload/"+data.teamPhoto+"' style='width:100%;height: 100%;' alt='프로필사진' id='teamphoto'>";
                }
                $(".infocontent").append(
                        '<div class="top">'+
                        '<div class="infoimg">'+
                        value+
                        '</div>'+
                        '<div class="infodata">'+
                        '<table>'+
                            '<tr><td style="font-weight: 1000;"}>'+data.teamname+'</td></tr>'+
                            '<tr><td id="modalgenre">'+data.teamgenre+' / </td><td id="modalcity"> '+data.city+'</td></tr>'+
                        '</table>'+
                        '</div>'+
                      '</div>'+
                      '<div class="mid">'+
                        '<textarea readonly="readonly" disabled style="resize:none;width:100%;'+ 
                      ' font-size:20px;background-color:white;border: 0;"  rows="3">'+data.content+'</textarea>'+
                      '</div>'+
                      '<div class="bot">'+
                        '<i class="far fa-heart modallike" style="margin-right: 30px;"></i>'+
                        data.avilikecount+
                      '</div>'
                );
                $(".insertcontent").append(
                        '<form action="insertavicomt">'+
                        '<textarea name="comtcont" id="comtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                        '</textarea>'+
                        '<br>'+
                        '<button style="float:right;" class="btn btns-outline-m">입력</button>'+
                        '</form>'
                );
                
                if(data.comtcount == 5){
                    $.each(data.comments,function(index,item){
                        if(item.comtphot ==null){
                            var value = "<img id='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                        } else{
                            var value = "<img id='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                        }
                        $(".comtlist").append(
                                '<div class="comtwrap">'+
                                '<div class="comttop">'+
                                    '<div class="comtimg">'+
                                    value+
                                    '</div>'+
                                    '<div class="comtcont">'+
                                    '<textarea readonly="readonly" disabled id="comtcont" style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                                    '</div>'+
                                '</div>'+
                                '<div class="comtbottom">'+
                                    '<div class="comtname">'+item.comtname+'</div>'+
                                    '<div class="comtdate">'+item.strcdt+'</div>'+
                                '</div>'+
                            '</div>'
                        );
                    })
                }
            }
        }
    })
});



