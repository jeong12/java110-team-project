package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Comment;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.domain.FeedPhotoFile;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.AviService;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.FeedPhotoService;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/buskerfeed")
public class FeedController {
  
  AviService aviService;
  ScheduleService sheduleService;
  FeedPhotoService feedPhotoService;
  BuskerService buskerService;
  ServletContext sc;
  

  public FeedController(AviService aviService, ScheduleService sheduleService,
      FeedPhotoService feedPhotoService, BuskerService buskerService, ServletContext sc) {
    this.aviService = aviService;
    this.sheduleService = sheduleService;
    this.feedPhotoService = feedPhotoService;
    this.buskerService = buskerService;
    this.sc = sc;
  }

  @RequestMapping("enter")
  public void list(
      /*int buskno,*/
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="9") int pageSize,
      Model model) {
    if (pageNo < 1)
      pageNo = 1;
  
  if (pageSize < 9 || pageSize > 10)
      pageSize = 9;
    int buskno=1;//임의값
    int buskno2=5;//임의값
  
    List<Schedule> fplist = sheduleService.findFeedPerSchedule(buskno2);//스케줄 now()이후 날짜부터 출력!
    List<Schedule> fflist = sheduleService.findFeedFixSchedule(buskno2);
    fplist.addAll(fflist);
    Busker busker = buskerService.get(buskno);
    List<Avi> alist = aviService.recentList(buskno);
    List<FeedPhoto> plist = feedPhotoService.recentPhotList(buskno,pageNo, pageSize);
    
    //영상 주소에 관한것
    for (Avi avi : alist) {
      String urlid = avi.getUrlid();
      avi.setThumbnail("https://i.ytimg.com/vi/"+urlid+"/hqdefault.jpg");
      avi.setUrl("https://www.youtube.com/embed/"+urlid);
      System.out.println(avi.getUrlid());
      System.out.println(avi.getUrl());
      System.out.println(avi.getThumbnail());
    }
    for(Schedule ppp:fplist) {
      ppp.setLongsdt(ppp.getSdt().getTime());
    }
    
    //fplist 시간순으로 정렬
    Collections.sort(fplist, new Comparator<Schedule>(){
      @Override
      public int compare(Schedule o1, Schedule o2) {
        if(o1.getLongsdt() > o2.getLongsdt()) {
          return 1;
        }else if(o1.getLongsdt() < o2.getLongsdt()) {
          return -1;
        }else {
          return 0;
        }
      }
    });
    SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formatsdt = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formatedt = new SimpleDateFormat("HH:mm");
    for (Schedule ps : fplist) {
      ps.setDate(formatdate.format(ps.getSdt()));
      ps.setNsdt(formatsdt.format(ps.getSdt()));
      ps.setNedt(formatedt.format(ps.getEdt()));
    }
    for (Schedule ss : fplist) {
      System.out.println(ss);
    }
    
    model.addAttribute("schelist",fplist);
    model.addAttribute("busk",busker);
    model.addAttribute("recentlist",alist);
    model.addAttribute("recentplist",plist);
  }
  
  @ResponseBody
  @RequestMapping("showavi")
  public Avi getImageNo(
      String abno, Model model) {   
      int abno2 = Integer.parseInt(abno);
      
      Avi feedavi=aviService.getfeedavibyAbno(abno2);
      List<Comment> comt=feedavi.getComments();
      
      for (Comment comment : comt) {
        System.out.println(comment.getCdt());
        comment.setStrcdt(comment.getCdt().toString());
      }
      
    return feedavi;
  }
  
  @ResponseBody
  @RequestMapping("showphoto")
  public FeedPhoto getPhotoNo(
      String pbno, Model model) {   
    int abno2 = Integer.parseInt(pbno);
    System.out.println(abno2);
    
    FeedPhoto feedphoto=feedPhotoService.getfeedphotobyPbno(abno2);
    
    System.out.println(feedphoto);
    List<Comment> comt=feedphoto.getComments();
    
    for (Comment comment : comt) {
      System.out.println(comment.getCdt());
      comment.setStrcdt(comment.getCdt().toString());
    }
    
    return feedphoto;
  }
  
  @PostMapping("addphoto")
  public String addphoto(FeedPhoto feedphot,FeedPhotoFile photfile,
      @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3
      ) {
    
    
    
    
    return "redirect:enter";
  }
  
  
  

}
