$(function(){
            var top_bar= $('#headerfix').offset().top;
            win = window;
          $(win).on('scroll',
             function(){
                 var pos = $(this).scrollTop();
               $('#pos').attr('value', pos);
//               console.log('body= '+ pos, ' #pos= '+top_bar);
               if(pos > top_bar){
                    $('#headerfix').addClass('fix');
               } 
                else{
                    $('#headerfix').removeClass('fix');
                }
          });                   
        });