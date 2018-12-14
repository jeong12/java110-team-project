
/* 사진 모달 처리 */
$(".col-md-4.photo button").on('click', function() {
    var sessionno=$('#sessionno').html();
    console.log("sessionNO:"+sessionno);
    
    var buskno=$('#buskno').html();  
    console.log("buskerNo:"+buskno);
    
    var pbno=$(this).val();
    console.log("photoBoardNO:"+pbno);
    
    var vvv = $("#memId").text().length;
    
    $.ajax({
        type:"GET",
        url:"showphoto",
        data:{"pbno" : pbno},
        success: function(data){
            console.log(data);
            $(".feedphoto1").empty();
            $(".feedphoto2").empty();
            $(".pinfocontent").empty();
            $(".pinsertcontent").empty();
            $(".pcomtlist").empty();
            $("#delrevbtn").empty();
            
            if(sessionno == buskno){
            $("#delrevbtn").append(
                    '<button type="button" onclick="photorevise()" id="photorevise" class="btn btns-outline-warning" style="margin-top: -3%;">수정</button>'+
                    "<button id='photoreviseend' onclick='photoreviseend()' style='display:none;margin-top: -3%;' class='btn btns-outline-warning'>수정완료</button>"+
                    '<button onclick="photoremove()" id="photodelete" class="btn btns-outline-warning" style="margin-top: -3%;">삭제</button>'+
                    '<button style="display:none"; id="photoboardnumber" value="'+pbno+'">'+pbno+'</button>'
                    );
            }
            $(".feedphoto1").append("<img src='../../upload/"+data.feedphotoFiles[0].filename+"' alt='첫번쨰사진' class='bigimg'>");
            $.each(data.feedphotoFiles,function(index,item){
                $(".feedphoto2").append(
                        "<td><button id='photonumber"+index+"' value='"+data.feedphotoFiles[index].fpno+"' style='display:none;'></button><button class='photofakeclass' style='display:none;' id='photofake"+index+"' value='"+item.filename+"'></button><button value='"+item.filename+"' ><img src='../../upload/"+item.filename+"' alt='....' class='smallimg'></button></td>"
                );
            });
            
            // 팀 정보!!
            if(data.teamPhoto ==null){
                var value = "<img id='teamphoto' src='img/phot1.png' style='width:100%;height: 100%;' alt='프로필사진'>";
            } else{
                var value = "<img src='../../upload/"+data.teamPhoto+"' style='width:100%;height: 100%;' alt='프로필사진' id='teamphoto'>";
            }
            if(data.likeOX == 0){
                var ox = '<i class="far fa-heart modallike" id="photoheartbefore" style="margin-right: 30px;"></i>'+
                '<i class="fas fa-heart modallike" id="photoheartafter" style="margin-right: 30px;display: none;"></i>'
            }else{
                var ox = '<i class="far fa-heart modallike" id="photoheartbefore" style="margin-right: 30px;display: none;"></i>'+
                '<i class="fas fa-heart modallike" id="photoheartafter" style="margin-right: 30px;"></i>'
            }
            $(".pinfocontent").append(
                    '<div id="pbnoval" value="'+pbno+'" ></div>'+
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
                  '<textarea id="revphotcont" readonly="readonly" disabled style="resize:none;width:100%;'+ 
                  ' font-size:20px;background-color:white;border: 0;border-radius:0.25rem;" rows="3">'+data.feedcont+'</textarea>'+
                  '</div>'+
                  '<div class="bot">'+
                      ox+
                    '<div id="photolikecnt"><i id="photolikecount">'+data.returnlikecount+'</i></div>'+
                  '</div>'
            );
            
            if(vvv==0){
                //댓글
                $(".pinsertcontent").append(
                        '<textarea name="pcomtcont" id="pcomtcont" readonly="readonly" disabled style="resize:none;width:100%;" rows="2" placeholder="로그인 해주세요.">'+
                        '</textarea>'+
                        '<br>'+
                         '<button id="pbnovaluebtn" style="display:none;" value="'+pbno+'"></button>'+
                        '<button id="photocomtsendbtn" disabled style="float:right;" class="btn btns-outline-m">입력</button>'
                );
            } else{
                //댓글
                $(".pinsertcontent").append(
                        '<textarea name="pcomtcont" id="pcomtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                        '</textarea>'+
                        '<br>'+
                         '<button id="pbnovaluebtn" style="display:none;" value="'+pbno+'"></button>'+
                        '<button id="photocomtsendbtn" style="float:right;" class="btn btns-outline-m">입력</button>'
                );
            }
            if(data.comtcount == 5){
                $.each(data.comments,function(index,item){
                    if(item.comtphot ==null){
                        var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                    } else{
                        var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                    }
                    if(item.mno == sessionno){
                        var comtrevise = 
                            '<div class="revdelpcomt" value="'+item.pcno+'">'+
                            '<i class="fas fa-pen revpcomtend" style="display:none;"></i>'+
                            '<i class="fas fa-pen revpcomt"></i>'+
                            '<i class="fas fa-trash-alt delpcomt"></i></div>'
                    }else{
                        var comtrevise = ''
                    }
                    $(".pcomtlist").append(
                            '<div class="comtwrap">'+
                            '<div class="comttop">'+
                                '<div class="comtimg">'+
                                value+
                                '</div>'+
                                '<div class="comtcont">'+
                                '<textarea class="pcomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                                '</div>'+
                            '</div>'+
                            '<div class="comtbottom">'+
                                '<div class="comtname">'+item.comtname+'</div>'+
                                '<div class="comtdate">'+item.strcdt+'</div>'+
                            '</div>'+
                            comtrevise+
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
/*위는 사진 밑은 영상=================================================================================*/
/* 영상 모달처리 */
$('.col-md-4.avi button').on('click', function() {
    var sessionno=$('#sessionno').html();
    console.log("sessionNO:"+sessionno);
    var buskno=$('#buskno').html();  
    console.log("buskerNo:"+buskno);
    var abno=$(this).val();
    console.log("AVIBOARDNO:"+abno);
    var vvv = $("#memId").text().length;
    
    $.ajax({
        type:"GET",
        url:"showavi",
        data:{"abno" : abno},
        success: function(data){
            console.log("abnotest:"+abno);
            $(".feedavi").empty();
            $(".modal-header.avi").empty();
            $(".ainfocontent").empty();
            $(".ainsertcontent").empty();
            $(".acomtlist").empty();
            
            if(data.length != 0){
               if(sessionno == buskno){
                    $(".modal-header.avi").append(
                            '<div id="delcomtval" value="'+abno+'" ></div>'+
                            "<textarea id='avititlerev' readonly='readonly' disabled rows='1' style='width:75%;resize:none;border-radius:0.25rem;" +
                            "background-color: transparent;border: 0;'>"+data.title+"</textarea>"+
                            "<h4 style='display:none;' id=avinumber>"+abno+"</h4>"+
                            "<button type='button' class='close' data-dismiss='modal'"+
                            "aria-label='Close' style='padding-right: 10px;'>"+
                            "<p>×</p>"+
                            "</button>"+
                            "<button id='avirevise' onclick='avirevise()' class='btn btns-outline-warning'>수정</button>"+
                            "<button id='avireviseend' onclick='avireviseend()' style='display:none;' class='btn btns-outline-warning'>수정완료</button>"+
                            "<button id='avidelete' onclick='aviremove()' class='btn btns-outline-warning'>삭제</button>"
                    );
                }else{
                    $(".modal-header.avi").append(
                            '<div id="delcomtval" value="'+abno+'" ></div>'+
                            data.title+
                            "<button type='button' class='close' data-dismiss='modal'"+
                            "aria-label='Close' style='padding-right: 10px;'>"+
                            "<p>×</p>"+
                            "</button>"
                    );
                }
                $(".feedavi").append(
                        "<iframe src='https://www.youtube.com/embed/"+data.urlid+"?ecver=2'"+
                        "width='500px' height='280px' frameborder='0'"+ 
                        "allow='autoplay; encrypted-media' allowfullscreen id='aviframe'></iframe>"+
                        
                        '<table id="avithumbnail" style="width: 100%;display:none;">'+
                        '<tr>'+
                          '<td><img style="height:250px; width:auto; margin:0;"'+
                            'id="uploadavirev" src="https://i.ytimg.com/vi/'+data.urlid+'/hqdefault.jpg"'+
                            'alt="기본이미지">'+
                        '</tr>'+
                        '<tr>'+
                          '<td style="width: 86%;"><input style="border-radius: 0.25rem; width: 98%; margin-right: 10px;"'+
                            'type="text" name="revurl" id="revurl" value="https://www.youtube.com/watch?v='+data.urlid+'" '+
                            'placeholder="URL 입력"/></td>'+
                          '<td><button type="button" onclick="urlchkrev()" class="btn btns-outline-dark urlchkrev">확인</button></td>'+
                        '</tr>'+
                      '</table>'
                );
                
                // 팀 정보!!
                if(data.teamPhoto ==null){
                    var value = "<img id='teamphoto' src='img/phot1.png' style='width:100%;height: 100%;' alt='프로필사진'>";
                } else{
                    var value = "<img src='../../upload/"+data.teamPhoto+"' style='width:100%;height: 100%;' alt='프로필사진' id='teamphoto'>";
                }
                if(data.likeOX == 0){
                    console.log('0');
                    var ox = '<i class="far fa-heart modallike" id="aviheartbefore" style="margin-right: 30px;"></i>'+
                    '<i class="fas fa-heart modallike" id="aviheartafter" style="margin-right: 30px;display: none;"></i>'
                }else{
                    console.log('1');
                    var ox = '<i class="far fa-heart modallike" id="aviheartbefore" style="margin-right: 30px;display: none;"></i>'+
                    '<i class="fas fa-heart modallike" id="aviheartafter" style="margin-right: 30px;"></i>'
                }
                $(".ainfocontent").append(
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
                        '<textarea id="revavicontent" readonly="readonly" disabled style="resize:none;width:100%;'+ 
                      ' font-size:20px;background-color:white;border: 0;border-radius:0.25rem" rows="3">'+data.content+'</textarea>'+
                      '</div>'+
                      '<div class="bot">'+
                          ox+
                      '<div id="avilikecnt"><i id="avilikecount">'+data.returnlikecount+'</i></div>'+
                      '</div>'
                );
                
                if(vvv==0){
                    //댓글입력
                    $(".ainsertcontent").append(
                            '<textarea name="acomtcont" id="acomtcont" readonly="readonly" disabled style="resize:none;width:100%;" rows="2" placeholder="로그인 해주세요.">'+
                            '</textarea>'+
                            '<br>'+
                            '<button id="abnovaluebtn" style="display:none;" value="'+abno+'"></button>'+
                            '<button id="avicomtsendbtn" style="float:right;" disabled class="btn btns-outline-m">입력</button>'
                    );
                }else{
                    //댓글입력
                    $(".ainsertcontent").append(
                            '<textarea name="acomtcont" id="acomtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                            '</textarea>'+
                            '<br>'+
                            '<button id="abnovaluebtn" style="display:none;" value="'+abno+'"></button>'+
                            '<button id="avicomtsendbtn" style="float:right;" class="btn btns-outline-m">입력</button>'
                    );
                }

                //댓글 리스트
                if(data.comtcount == 5){
                    $.each(data.comments,function(index,item){
                        if(item.comtphot ==null){
                            var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                        } else{
                            var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                        }
                        if(item.mno == sessionno){
                            var comtrevise = 
                            '<div class="revdelacomt" value="'+item.acno+'">'+
                            '<i class="fas fa-pen revacomtend" style="display:none;" ></i>'+
                            '<i class="fas fa-pen revacomt"></i>'+
                            '<i class="fas fa-trash-alt delacomt"></i></div>'
                        }else{
                            var comtrevise = ''
                        }
                        $(".acomtlist").append(
                                '<div class="comtwrap">'+
                                '<div class="comttop">'+
                                    '<div class="comtimg">'+
                                    value+
                                    '</div>'+
                                    '<div class="comtcont">'+
                                    '<textarea class="acomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                                    '</div>'+
                                '</div>'+
                                '<div class="comtbottom">'+
                                    '<div class="comtname">'+item.comtname+'</div>'+
                                    '<div class="comtdate">'+item.strcdt+'</div>'+
                                '</div>'+
                                comtrevise+
                            '</div>'
                        );
                    })
                }
            }
        }
    })
});

//사진댓글입력
$(document).on("click","#photocomtsendbtn",function(){
    var sessionno=$("#memId").text();
    console.log("sessionNO:"+sessionno);
    var pbno=$("#pbnoval").attr('value');
    console.log(pbno);
    var content=$("#pcomtcont").val();
    console.log(content);
    
    $.ajax({
        url:'insertphotcomment',
        type:'GET',
        dataType:'json',
        data:{
            "mno":sessionno,
            "pbno":pbno,
            "cont":content
        },
        success:function(data){
            $(".pinsertcontent").empty();
            $(".pcomtlist").empty();
            
            //댓글
            $(".pinsertcontent").append(
                    '<textarea name="pcomtcont" id="pcomtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                    '</textarea>'+
                    '<br>'+
                    '<button id="pbnovaluebtn" style="display:none;" value="'+pbno+'"></button>'+
                    '<button id="photocomtsendbtn" style="float:right;" class="btn btns-outline-m">입력</button>'
            );
                $.each(data.comments,function(index,item){
                    if(item.comtphot ==null){
                        var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                    } else{
                        var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                    }
                    if(item.mno == sessionno){
                        var comtrevise = 
                            '<div class="revdelpcomt" value="'+item.pcno+'">'+
                            '<i class="fas fa-pen revpcomtend" style="display:none;"></i>'+
                            '<i class="fas fa-pen revpcomt"></i>'+
                            '<i class="fas fa-trash-alt delpcomt"></i></div>'
                    }else{
                        var comtrevise = ''
                    }
                    $(".pcomtlist").append(
                            '<div class="comtwrap">'+
                            '<div class="comttop">'+
                                '<div class="comtimg">'+
                                value+
                                '</div>'+
                                '<div class="comtcont">'+
                                '<textarea class="pcomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                                '</div>'+
                            '</div>'+
                            '<div class="comtbottom">'+
                                '<div class="comtname">'+item.comtname+'</div>'+
                                '<div class="comtdate">'+item.strcdt+'</div>'+
                            '</div>'+
                            comtrevise+
                        '</div>'
                    );
                })
            
        }
        
        
    });
});
//사진댓글수정
$(document).on("click",".revpcomt",function(){
    $(this).parent().parent().find(".pcomtcontlist").removeAttr("readonly").removeAttr("disabled").addClass("revrev");
    $(this).siblings(".revpcomtend").css("display","");
    $(this).css("display","none");
 });
//사진댓글수정완료
$(document).on("click",".revpcomtend",function(){
    var pcno = $(this).parent().attr('value');
    var content = $(this).parent().parent().find(".pcomtcontlist").val();
    console.log("pcno:"+pcno);
    console.log("cont:"+content);
    
    console.log("수정완료버튼펑션먹나??")
    
    $.ajax({
        url:'revisephotcomment',
        type:'GET',
        dataType:'json',
        data:{
            "pcno":pcno,
            "cont":content
        },
        success:function(data){
            swal("댓글 수정","이 완료되었습니다.","success");
            }
        });
    
   $(this).parent().parent().find(".pcomtcontlist").attr("readonly","readonly").removeClass("revrev");
   $(this).parent().parent().find(".pcomtcontlist").attr("disabled",true);
   $(this).siblings(".revpcomt").css("display","");
   $(this).css("display","none");
});
//사진댓글삭제
$(document).on("click",".delpcomt",function(){
    var sessionno=$('#sessionno').html();
    var pbno=$("#pbnoval").attr('value');
    var pcno = $(this).parent().attr('value');
    
    $.ajax({
        url:'removephotcomment',
        type:'GET',
        dataType:'json',
        data:{
            "pcno":pcno,
            "pbno":pbno
        },
        success:function(data){
            swal("댓글 삭제","가 완료되었습니다.","success");
            $(".pcomtlist").empty();
            
            if(data.comtcount == 5){
            $.each(data.comments,function(index,item){
                if(item.comtphot ==null){
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                } else{
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                }
                if(item.mno == sessionno){
                    var comtrevise = 
                        '<div class="revdelpcomt" value="'+item.pcno+'">'+
                        '<i class="fas fa-pen revpcomtend" style="display:none;"></i>'+
                        '<i class="fas fa-pen revpcomt"></i>'+
                        '<i class="fas fa-trash-alt delpcomt"></i></div>'
                }else{
                    var comtrevise = ''
                }
                $(".pcomtlist").append(
                        '<div class="comtwrap">'+
                        '<div class="comttop">'+
                            '<div class="comtimg">'+
                            value+
                            '</div>'+
                            '<div class="comtcont">'+
                            '<textarea class="pcomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                            '</div>'+
                        '</div>'+
                        '<div class="comtbottom">'+
                            '<div class="comtname">'+item.comtname+'</div>'+
                            '<div class="comtdate">'+item.strcdt+'</div>'+
                        '</div>'+
                        comtrevise+
                    '</div>'
                );
            })
            }
        }
        });
    
});


// 영상댓글입력
$(document).on("click","#avicomtsendbtn",function(){
    var sessionno=$("#memId").text();
    console.log("sessionNO:"+sessionno);
    var abno=$("#delcomtval").attr('value');
    console.log(abno);
    var content=$("#acomtcont").val();
    console.log(content);
    
    $.ajax({
        url:'insertcomment',
        type:'GET',
        dataType:'json',
        data:{
            "mno":sessionno,
            "abno":abno,
            "cont":content
        },
        success:function(data){
            $(".ainsertcontent").empty();
            $(".acomtlist").empty();
            
            //댓글입력
            $(".ainsertcontent").append(
                    '<textarea name="acomtcont" id="acomtcont" style="resize:none;width:100%;" rows="2" placeholder="댓글을 입력해주세요.">'+
                    '</textarea>'+
                    '<br>'+
                    '<button id="abnovaluebtn" style="display:none;" value="'+abno+'"></button>'+
                    '<button id="avicomtsendbtn" style="float:right;" class="btn btns-outline-m">입력</button>'
            );
            
            $.each(data.comments,function(index,item){
                if(item.comtphot ==null){
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                } else{
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                }
                if(item.mno == sessionno){
                    var comtrevise = 
                        '<div class="revdelacomt" value="'+item.acno+'">'+
                        '<i class="fas fa-pen revacomtend" style="display:none;"></i>'+
                        '<i class="fas fa-pen revacomt"></i>'+
                        '<i class="fas fa-trash-alt delacomt"></i></div>'
                }else{
                    var comtrevise = ''
                }
                $(".acomtlist").append(
                        '<div class="comtwrap">'+
                        '<div class="comttop">'+
                            '<div class="comtimg">'+
                            value+
                            '</div>'+
                            '<div class="comtcont">'+
                            '<textarea class="acomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                            '</div>'+
                        '</div>'+
                        '<div class="comtbottom">'+
                            '<div class="comtname">'+item.comtname+'</div>'+
                            '<div class="comtdate">'+item.strcdt+'</div>'+
                        '</div>'+
                        comtrevise+
                    '</div>'
                );
            })
        }
        
        
    });
});
// 영상댓글수정
$(document).on("click",".revacomt",function(){
   $(this).parent().parent().find(".acomtcontlist").removeAttr("readonly").removeAttr("disabled").addClass("revrev");
   $(this).siblings(".revacomtend").css("display","");
   $(this).css("display","none");
   
});

//영상댓글수정 완료
$(document).on("click",".revacomtend",function(){
    var acno = $(this).parent().attr('value');
    var content = $(this).parent().parent().find(".acomtcontlist").val();
    console.log("acno:"+acno);
    console.log("cont:"+content);
    
    $.ajax({
        url:'revisecomment',
        type:'GET',
        dataType:'json',
        data:{
            "acno":acno,
            "cont":content
        },
        success:function(data){
            swal("댓글 수정","이 완료되었습니다.","success");
            }
        });
    
   $(this).parent().parent().find(".acomtcontlist").attr("readonly","readonly").removeClass("revrev");
   $(this).parent().parent().find(".acomtcontlist").attr("disabled",true);
   $(this).siblings(".revacomtend").css("display","none");
   $(this).css("display","");
});
// 영상댓글 삭제
$(document).on("click",".delacomt",function(){
    var sessionno=$('#sessionno').html();
    var abno=$("#delcomtval").attr('value');
    var acno = $(this).parent().attr('value');
    
    $.ajax({
        url:'removecomment',
        type:'GET',
        dataType:'json',
        data:{
            "acno":acno,
            "abno":abno
        },
        success:function(data){
            swal("댓글 삭제","가 완료되었습니다.","success");
            $(".acomtlist").empty();
            
            if(data.comtcount == 5){
            $.each(data.comments,function(index,item){
                if(item.comtphot ==null){
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' src='/img/phot1.png' alt='프로필사진'>";
                } else{
                    var value = "<img class='teamphoto' style='width:100%;height: 100%;' alt='없넹' src='../../upload/"+item.comtphot+"'>";
                }
                if(item.mno == sessionno){
                    var comtrevise = 
                        '<div class="revdelacomt" value="'+item.acno+'">'+
                        '<i class="fas fa-pen revacomtend" style="display:none;"></i>'+
                        '<i class="fas fa-pen revacomt"></i>'+
                        '<i class="fas fa-trash-alt delacomt"></i></div>'
                }else{
                    var comtrevise = ''
                }
                $(".acomtlist").append(
                        '<div class="comtwrap">'+
                        '<div class="comttop">'+
                            '<div class="comtimg">'+
                            value+
                            '</div>'+
                            '<div class="comtcont">'+
                            '<textarea class="acomtcontlist" readonly="readonly" disabled style="resize:none;width:100%;" rows="2">'+item.cont+'</textarea>'+
                            '</div>'+
                        '</div>'+
                        '<div class="comtbottom">'+
                            '<div class="comtname">'+item.comtname+'</div>'+
                            '<div class="comtdate">'+item.strcdt+'</div>'+
                        '</div>'+
                        comtrevise+
                    '</div>'
                );
            })
            }
        }
        });
    
});
//영상수정에서 url재입력 시
function urlchkrev(){
    var urlid=$("#revurl").val().substring(32,43);
    console.log(urlid);
    
    $("#uploadavirev").attr("src","https://i.ytimg.com/vi/"+urlid+"/hqdefault.jpg");
}
//영상게시글 수정완료버튼 눌렀을때
function avireviseend(){
    var avititlerev=$("#avititlerev").val();
    var revurl=$("#revurl").val().substring(32,43);
    var revavicontent=$("#revavicontent").val();
    var abno=$('#avinumber').html(); 
    var buskno=$('#buskno').html();  
    
    console.log(buskno);
    console.log(abno);
    console.log(avititlerev);
    console.log(revurl);
    console.log(revavicontent);
    
    location.href="updateavi?abno="+abno+"&bno="+buskno+"&title="+avititlerev+"&url="+revurl+"&cont="+revavicontent;
}
// 영상게시글 수정버튼 눌렀을때
function avirevise(){
    $("#avirevise").css("display","none");
    $("#avireviseend").css("display","");
    $("#revavicontent").removeAttr("disabled");
    $("#revavicontent").removeAttr("readonly");
    $("#revavicontent").css("border","1px solid #80808066");
    
    $("#aviframe").css("display","none");
    $("#avithumbnail").css("display","");
    $("#avititlerev").removeAttr("readonly");
    $("#avititlerev").removeAttr("disabled");
    $("#avititlerev").css("background-color","white");
    $("#avititlerev").css("color","black");
}
// 영상게시글삭제
function aviremove(){
    var buskno=$('#buskno').html();  
    console.log(buskno);
    var abno=$('#avinumber').html(); 
    console.log("abno: "+abno);
    
    location.href = 'deleteavi?abno='+abno+'&bno='+buskno;
        console("deletetest:"+abno);
}

//사진게시글삭제
function photoremove(){
    var buskno=$('#buskno').html();  
    console.log("buskno"+buskno);
    var pbno=$('#photoboardnumber').html(); 
    console.log("pbno: "+pbno);
    
    location.href = 'deletephoto?pbno='+pbno+'&bno='+buskno;
}
//사진게시글 수정버튼 눌렀을때
function photorevise(){
    $("#photorevise").css("display","none");
    $("#photoreviseend").css("display","");
    
    $("#revphotcont").removeAttr("disabled");
    $("#revphotcont").removeAttr("readonly");
    $("#revphotcont").css("border","1px solid #80808066");
    
    var photoboardnumber = $("#photoboardnumber").val();
    var contentt = $("#revphotcont").val();
    var buskno=$('#buskno').html();  
    
    var photolength = $(".photofakeclass").length;
    console.log(photolength);
    
    var photono = new Array();
    var arr = new Array();
    if(photolength == 3){
        arr.push($("#photofake0").val());
        photono.push($("#photonumber0").val());
        arr.push($("#photofake1").val());
        photono.push($("#photonumber1").val());
        arr.push($("#photofake2").val());
        photono.push($("#photonumber2").val());
    } else if(photolength == 2){
        arr.push($("#photofake0").val());
        photono.push($("#photonumber0").val());
        arr.push($("#photofake1").val());
        photono.push($("#photonumber1").val());
    } else{
        arr.push($("#photofake0").val());
        photono.push($("#photonumber0").val());
    }
    
    console.log("arr:"+arr);
    console.log("photono:"+photono);
    
    $(".feedphoto").empty();
    
    if(photolength == 3){//이전에 사진이 3장일때
        console.log("사진3장");
        $(".feedphoto").append(
                "<form class='invisiblesubmit' action='updatephoto' method='post' enctype='multipart/form-data'>"+
                '<table id="imgtable">'+
                '<tr>'+
                '<td style="display:none;">'+
                "<input  type='text' name='pbno' id='pbno' value='"+photoboardnumber+"'/>"+
                "<input  type='text' name='cont' id='cont' value='"+contentt+"'/>"+
                "<input  type='text' name='bno' id='bno' value='"+buskno+"'/>"+
                '</td>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                '<img id="revupload1" src="/upload/'+arr[0]+'" alt="기본이미지"></td>'+
                '<td style="padding:95px 0 0 10px;"><label for="rev_img1" style="font-size: 20px;">파일업로드</label>'+ 
                '<input style="height: 0; width: 150px; opacity: 0;" '+
                 '   type="file" name="file1" id="rev_img1" onchange="readrevURL1(this);" />'+
                 '<input style="display:none;" type="text" name="fpno1" id="fpno1" value="'+photono[0]+'"/></td>'+
                 '</tr>'+
                 '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload2" src="/upload/'+arr[1]+'" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img2" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;"'+
                  '  type="file" name="file2" id="rev_img2" onchange="readrevURL2(this);" />'+
                  '<input style="display:none;" type="text" name="fpno2" id="fpno2" value="'+photono[1]+'"/></td>'+
                  '</tr>'+
                  '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload3" src="/upload/'+arr[2]+'" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img3" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;" '+
                  '    type="file" name="file3" id="rev_img3" onchange="readrevURL3(this);" />'+
                  '<input style="display:none;" type="text" name="fpno3" id="fpno3" value="'+photono[2]+'"/></td>'+
                '</tr>'+
              '</table>'+
              "</form>"
        );

    }else if(photolength == 2){//이전에 사진이 2장일때
        console.log("사진2장");
        $(".feedphoto").append(
                "<form class='invisiblesubmit' action='updatephoto' method='post' enctype='multipart/form-data'>"+
                '<table id="imgtable">'+
                '<tr>'+
                '<td style="display:none;">'+
                "<input type='text' name='pbno' id='pbno' value='"+photoboardnumber+"'/>"+
                "<input  type='text' name='cont' id='cont' value='"+contentt+"'/>"+
                "<input  type='text' name='bno' id='bno' value='"+buskno+"'/>"+
                '</td>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                '<img id="revupload1" src="/upload/'+arr[0]+'" alt="기본이미지"></td>'+
                '<td style="padding:95px 0 0 10px;"><label for="rev_img1" style="font-size: 20px;">파일업로드</label>'+ 
                '<input style="height: 0; width: 150px; opacity: 0;" '+
                 '   type="file" name="file1" id="rev_img1" onchange="readrevURL1(this);" />'+
                 '<input style="display:none;" type="text" name="fpno1" id="fpno1" value="'+photono[0]+'"/></td>'+
                 '</tr>'+
                 '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload2" src="/upload/'+arr[1]+'" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img2" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;"'+
                  '  type="file" name="file2" id="rev_img2" onchange="readrevURL2(this);" />'+
                  '<input style="display:none;" type="text" name="fpno2" id="fpno2" value="'+photono[1]+'"/></td>'+
                  '</tr>'+
                  '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload3" src="/img/default_image.png" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img3" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;" '+
                  '    type="file" name="file3" id="rev_img3" onchange="readrevURL3(this);" /></td>'+
                '</tr>'+
              '</table>'+
              "</form>"
        );

    }else{
        console.log("사진1장");
        $(".feedphoto").append(
                "<form class='invisiblesubmit' action='updatephoto' method='post' enctype='multipart/form-data'>"+
                '<table id="imgtable">'+
                '<tr>'+
                '<td style="display:none;">'+
                "<input  type='text' name='pbno' id='pbno' value='"+photoboardnumber+"'/>"+
                "<input  type='text' name='cont' id='cont' value='"+contentt+"'/>"+
                "<input type='text' name='bno' id='bno' value='"+buskno+"'/>"+
                '</td>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                '<img id="revupload1" src="/upload/'+arr[0]+'" alt="기본이미지"></td>'+
                '<td style="padding:95px 0 0 10px;"><label for="rev_img1" style="font-size: 20px;">파일업로드</label>'+ 
                '<input style="height: 0; width: 150px; opacity: 0;" type="file" name="file1" id="rev_img1" onchange="readrevURL1(this);" />'+
                '<input style="display:none;" type="text" name="fpno1" id="fpno1" value="'+photono[0]+'"/></td>'+
                 '</tr>'+
                 '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload2" src="/img/default_image.png" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img2" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;" type="file" name="file2" id="rev_img2" onchange="readrevURL2(this);" /></td>'+
                  '</tr>'+
                  '<tr>'+
                  '<td style="padding:0 5px 0 5px;width: 45%;">'+
                  '<img id="revupload3" src="/img/default_image.png" alt="기본이미지"></td>'+
                  '<td style="padding:95px 0 0 10px;"><label for="rev_img3" style="font-size: 20px;">파일업로드</label> '+
                  '<input style="height: 0; width: 150px; opacity: 0;" type="file" name="file3" id="rev_img3" onchange="readrevURL3(this);" /></td>'+
                '</tr>'+
              '</table>'+
                "</form>"
        );


    }

}

function readrevURL1(input) { 
    var chkImg = document.getElementById('rev_img1').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        alert("이미지 파일만 올려주세요");
        $('#revupload1').attr('src', "/img/default_image.png");}
    
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#revupload1').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
    }
};
function readrevURL2(input) { 
    var chkImg = document.getElementById('rev_img2').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();

    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile2=0;
        alert("이미지 파일만 올려주세요");
        $('#revupload2').attr('src', "/img/default_image.png");}
    
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#revupload2').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 

    }
};
function readrevURL3(input) { 
    var chkImg = document.getElementById('rev_img3').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();

    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile3=0;
        alert("이미지 파일만 올려주세요");
        $('#revupload3').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#revupload3').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
    }
};
//사진게시글 수정완료버튼 눌렀을때
function photoreviseend(){
    var contcont = $("#revphotcont").val();
    $("#cont").val(contcont);
    
    $(".invisiblesubmit").submit();
}

// 사진게시글 좋아요========================================================================

/* 하얀하트누를때 */
$(document).on("click","#photoheartbefore",function(){
    // 게시글번호
    var photono = $("#pbnoval").attr("value");
    console.log("photono:"+photono);
    // 로그인했나
    var vvv = $("#memId").text().length;
     if( vvv == 0){
        swal({
              title: "로그인 해주세요.", 
            /* text: "로그인 해주세요!", */
            icon: "warning",
            buttons:{
                catch: {
                    text: "확인",
                    value: "ok",
                  }
            }
      }).then((value)=>{
           return;
      })
        
    } else{
        // 로그인 했다면 로그인넘버를 알아와~
        var loginno = $("#memId").text();
        $(this).css("display","none");
        $("#photoheartafter").css("display","");
        
         $.ajax({
             type:"GET",
             url:"likeme",
             data:{
                 "loginno":loginno,
                 "feedbuskno":photono,
                 "flag":2
             },
             success:function(data){
                 $("#photolikecnt").empty();
                 
                 $("#photolikecnt").append(
                         '<i id="photolikecount">'+data.returnlikecount+'</i>'
                 );
             }
        });
    }
});
/* 검은하트누를때 */
 $(document).on("click","#photoheartafter",function(){
     // 게시글번호
     var photono = $("#pbnoval").attr("value");
     // 로그인했나
     var vvv = $("#memId").text().length;
      if( vvv == 0){
          
      }else{
          // 로그인 했다면 로그인넘버를 알아와~
          var loginno = $("#memId").text();
          $(this).css("display","none");
          $("#photoheartbefore").css("display","");
          
           $.ajax({
               type:"GET",
               url:"nonelike",
               data:{
                   "loginno":loginno,
                   "feedbuskno":photono,
                   "flag":2
               },
               success:function(data){
                   $("#photolikecnt").empty();
                   
                   $("#photolikecnt").append(
                           '<i id="photolikecount">'+data.returnlikecount+'</i>'
                   );
               }
          });
      }
    
}); 
 
 // 동영상게시글 좋아요
 
 /* 하얀하트누를때 */
 $(document).on("click","#aviheartbefore",function(){
     // 게시글번호
     var avino = $("#delcomtval").attr("value");
     // 로그인했나
     var vvv = $("#memId").text().length;
      if( vvv == 0){
         swal({
               title: "로그인 해주세요.", 
             /* text: "로그인 해주세요!", */
             icon: "warning",
             buttons:{
                 catch: {
                     text: "확인",
                     value: "ok",
                   }
             }
       }).then((value)=>{
            return;
       })
         
     } else{
         // 로그인 했다면 로그인넘버를 알아와~
         var loginno = $("#memId").text();
         $(this).css("display","none");
         $("#aviheartafter").css("display","");
         
          $.ajax({
              type:"GET",
              url:"likeme",
              data:{
                  "loginno":loginno,
                  "feedbuskno":avino,
                  "flag":3
              },
              success:function(data){
                  $("#avilikecnt").empty();
                  
                  $("#avilikecnt").append(
                          '<i id="avilikecount">'+data.returnlikecount+'</i>'
                  );
              }
         });
     }
 });
 /* 검은하트누를때 */
  $(document).on("click","#aviheartafter",function(){
      // 게시글번호
      var avino = $("#delcomtval").attr("value");
      // 로그인했나
      var vvv = $("#memId").text().length;
       if( vvv == 0){
           
       }else{
           // 로그인 했다면 로그인넘버를 알아와~
           var loginno = $("#memId").text();
           $(this).css("display","none");
           $("#aviheartbefore").css("display","");
           
            $.ajax({
                type:"GET",
                url:"nonelike",
                data:{
                    "loginno":loginno,
                    "feedbuskno":avino,
                    "flag":3
                },
                success:function(data){
                    $("#avilikecnt").empty();
                    
                    $("#avilikecnt").append(
                            '<i id="avilikecount">'+data.returnlikecount+'</i>'
                    );
                }
           });
       }
     
 }); 






