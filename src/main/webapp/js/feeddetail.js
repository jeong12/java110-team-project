
    /* 사진 모달 처리 */
        $(".col-md-4.photo button").on('click', function() {
            $.ajax({
                type:"GET",
                url:"showphoto",
                data:{"abno" : abno},
                success: function(data){

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
                if(data.length != 0){
                    $(".feedavi").append(
                            "<iframe src='https://www.youtube.com/embed/"+data.urlid+"?ecver=2'"+
                                    "width='500' height='280px' frameborder='0'"+ 
                                    "allow='autoplay; encrypted-media' allowfullscreen></iframe>"
                            );
                    $(".avimodal-header").append(
                            "<h2>"+data.title+"</h2>"
                            );
                    $(".aviteamimgtb").append(
                            "<tr>"+
                            "<td>"+
                              "<img id='teamphoto' src='"+data.teamPhoto+"' alt='프로필사진'>"+
                            "</td>"+
                            "<td>"+data.teamname+"</td>"+
                            "<td>"+data.teamgenre+"</td>"+
                            "<td>"+data.teamcity+"</td>"+
                          "</tr>"
                            );
                     $(".content").append(
                             "<p>"+data.content+"<p>"
                            );
                    $(".likecount").append(
                            "<p>"+data.avilikecount+"</p>"
                            ); 
                    $.each(data.comments,function(index,item){
                        $(".list-unstyled.comt").append(
                                "<li style='height:65px;'>"+
                                "<div style='float:left; width:35%'>"+
                                    "<div style='float:left'>"+
                                        "<img alt='없넹' src='"+item.comtphot+"'>"+
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
            })
    });
    
    
    
    
    
