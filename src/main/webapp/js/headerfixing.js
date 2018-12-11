$(function(){
            var top_bar= $('#headerfix').offset().top;
            win = window;
          $(win).on('scroll',
             function(){
                 var pos = $(window).scrollTop();
                 
               if(pos > 50){
                    $('#headerfix').addClass('fix');
               } 
                else{
                    $('#headerfix').removeClass('fix');
                }
          });                   
        });