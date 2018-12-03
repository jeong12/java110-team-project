
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
            $(".phototeamimgtb").empty();
            $(".content").empty();
            $(".likecount").empty();
            $(".list-unstyled.comtphoto").empty();
            $(".phototeamimgtbo").empty();

            $(".feedphoto1").append("<img src='../../upload/"+data.feedphotoFiles[0].filename+"' alt='첫번쨰사진' class='bigimg'>");
            $.each(data.feedphotoFiles,function(index,item){
                $(".feedphoto2").append("<td><button value='"+item.filename+"' ><img src='../../upload/"+item.filename+"' alt='....' class='smallimg'></button></td>")
            });
            if(data.teamPhoto == null){
                $(".phototeamimgtb").append(
                        "<tr>"+
                        "<td>"+
                        "<img id='teamphoto' src='img/phot1.png' alt='프로필사진'>"+
                        "</td>"+
                        "<td>"+data.teamname+"</td>"+
                        "<td>"+data.teamgenre+"</td>"+
                        "<td>"+data.city+"</td>"+
                        "</tr>"
                );
            }else{
                $(".phototeamimgtb").append(
                        "<tr>"+
                        "<td>"+
                        "<img id='teamphoto' src='../../upload/"+data.teamPhoto+"' alt='프로필사진'>"+
                        "</td>"+
                        "<td>"+data.teamname+"</td>"+
                        "<td>"+data.teamgenre+"</td>"+
                        "<td>"+data.city+"</td>"+
                        "</tr>"
                );
            }
            $(".content").append(
                    "<p>"+data.feedcont+"<p>"
            );
            $(".likecount").append(
                    "<p>"+data.lcnt+"</p>"
            ); 
            if(data.comtcount == 5){
                $.each(data.comments,function(index,item){
                    if(item.comtphot ==null){
                        var value = "<img id='teamphoto' src='/img/phot1.png' alt='프로필사진'>";
                    } else{
                        var value = "<img id='teamphoto' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                    }
                    $(".list-unstyled.comtphoto").append(
                            "<li style='height:65px;'>"+
                            "<div style='float:left; width:35%'>"+
                            "<div style='float:left'>"+
                            value+
                            "</div>"+
                            "<div style='float:right'>"+
                            "<table>"+
                            "<tr><td>"+item.comtname+"</td></tr>"+
                            "<tr><td>"+item.strcdt+"</td></tr>"+
                            "</table>"+
                            "</div>"+
                            "</div>"+
                            "<div style='margin-left:20px; width:65%'>"+
                            "<p>"+item.cont+"</p>"+
                            "</div>"+
                            "</li>"
                    );
                });
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
            $(".avimodal-header").empty();
            $(".aviteamimgtb").empty();
            $(".content").empty();
            $(".likecount").empty();
            $(".list-unstyled.comt").empty();
            $(".aviteamimgtb").empty();
            $(".comtinsert").empty();
            
            if(data.length != 0){
                $(".comtinsert").append(
                        "<form action='insertavicomt'>"+
                        "<div style='display: none'>"+
                            "<textarea name='abno' id='abno'>"+abno+"</textarea>"+
                            "<textarea name='no' id='no'>4</textarea>"+
                        "</div>"+
                        "<textarea rows='3' placeholder='댓글을 입력하세요!' style='resize:none; width:100%'"+
                        "name='cont' id='cont'></textarea>"+
                        "<button style='float:right' >입력</button>"+
                    "</form>"
                );
                $(".feedavi").append(
                        "<iframe src='https://www.youtube.com/embed/"+data.urlid+"?ecver=2'"+
                        "width='500' height='280px' frameborder='0'"+ 
                        "allow='autoplay; encrypted-media' allowfullscreen></iframe>"
                );
                $(".avimodal-header").append(
                        "<h2>"+data.title+"</h2>"
                );
                if(data.teamPhoto ==null){
                    var value = "<img id='teamphoto' src='img/phot1.png' alt='프로필사진'>";
                } else{
                    var value = "<img src='../../upload/"+data.teamPhoto+"' alt='프로필사진' id='teamphoto'>";
                }
                
                
                $(".aviteamimgtb").append(
                        "<tr>"+
                        "<td>"+
                        value+
                            "</td>"+
                         "<td>"+data.teamname+"</td>"+
                         "<td>"+data.teamgenre+"</td>"+
                         "<td>"+data.city+"</td>"+
                         "</tr>"
                );
                $(".content").append(
                        "<p>"+data.content+"<p>"
                );
                $(".likecount").append(
                        "<p>"+data.avilikecount+"</p>"
                ); 
                if(data.comtcount == 5){
                    $.each(data.comments,function(index,item){
                        if(item.comtphot ==null){
                            var value = "<img id='teamphoto' src='/img/phot1.png' alt='프로필사진'>";
                        } else{
                            var value = "<img id='teamphoto' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                        }
                        $(".list-unstyled.comt").append(
                                "<li style='height:65px;'>"+
                                "<div style='float:left; width:35%'>"+
                                "<div style='float:left'>"+
                                value+
                                "</div>"+
                                "<div style='float:right'>"+
                                "<table>"+
                                "<tr><td>"+item.comtname+"</td></tr>"+
                                "<tr><td>"+item.strcdt+"</td></tr>"+
                                "</table>"+
                                "</div>"+
                                "</div>"+
                                "<div style='margin-left:20px; width:65%'>"+
                                "<p>"+item.cont+"</p>"+
                                "</div>"+
                                "</li>"
                        );
                    })
                }
            }
        }
    })
});



