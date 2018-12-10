package indiesker.java110.ms.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Comment;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.AviService;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.FeedPhotoService;
import indiesker.java110.ms.service.MemberService;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/buskerfeed")
public class FeedController {

  AviService aviService;
  ScheduleService sheduleService;
  FeedPhotoService feedPhotoService;
  BuskerService buskerService;
  MemberService memberService;
  ServletContext sc;

  public FeedController(AviService aviService, ScheduleService sheduleService,
      FeedPhotoService feedPhotoService, BuskerService buskerService, MemberService memberService,
      ServletContext sc) {
    super();
    this.aviService = aviService;
    this.sheduleService = sheduleService;
    this.feedPhotoService = feedPhotoService;
    this.buskerService = buskerService;
    this.memberService = memberService;
    this.sc = sc;
  }

  
  @GetMapping("enter")
  public void list(
      int no,
      @RequestParam(defaultValue="0") int pageNo,
      @RequestParam(defaultValue="9") int pageSize,
      Model model) {
    // 버스커말고 다른 회원이 접근할때!
/*    boolean checkbusk = memberService.isBusker(no);
    System.out.println(checkbusk);
    
    if(checkbusk == false) {
      goback();
      
    }*/
    
    /*int photocount = feedPhotoService.recentPhotList2(no);*/
    
    
    List<Schedule> fplist = sheduleService.findFeedPerSchedule(no);//스케줄 now()이후 날짜부터 출력!
    List<Schedule> fflist = sheduleService.findFeedFixSchedule(no);
    Busker busker = buskerService.get(no);
    List<Avi> alist = aviService.recentList(no);
    List<FeedPhoto> plist = feedPhotoService.recentPhotList(no,pageNo,pageSize);

    for (Schedule sche : fflist) {
      sche.setAddr(sche.getSupporter().getBaseaddr()+sche.getSupporter().getDetailaddr());
      sche.setShopname(sche.getSupporter().getName());
    }
    
    fplist.addAll(fflist);
    //영상 주소에 관한것
    for (Avi avi : alist) {
      String urlid = avi.getUrlid();
      avi.setThumbnail("https://i.ytimg.com/vi/"+urlid+"/hqdefault.jpg");
      avi.setUrl("https://www.youtube.com/embed/"+urlid);
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
    
    
    model.addAttribute("schelist",fplist);
    model.addAttribute("busk",busker);
    model.addAttribute("recentlist",alist);
    model.addAttribute("recentplist",plist);
    System.out.println(alist);
  }

  @ResponseBody
  @RequestMapping("showavi")
  public Avi getAviNo(
      String abno, Model model) {   
    int abno2 = Integer.parseInt(abno);
    Avi feedavi=aviService.getfeedavibyAbno(abno2);

    if(feedavi == null) {
      feedavi = aviService.getfeedavibyAbnoNoComt(abno2);
      feedavi.setComtcount(0);
      return feedavi;
    }else {
      feedavi.setComtcount(5);
      List<Comment> comts=feedavi.getComments();
      for (Comment comment : comts) {
        comment.setStrcdt(comment.getCdt().toString());
      }
      return feedavi;
    }
  }

  @ResponseBody
  @RequestMapping("showphoto")
  public FeedPhoto getPhotoNo(
      String pbno, Model model) {   
    int pbno2 = Integer.parseInt(pbno);
    FeedPhoto feedphoto=feedPhotoService.getfeedphotobyPbno(pbno2);

    if(feedphoto == null) {
      feedphoto = feedPhotoService.getfeedphotobyPbnoNoComt(pbno2);
      feedphoto.setComtcount(0);
      return feedphoto;
    }else {
      feedphoto.setComtcount(5);
      List<Comment> comts=feedphoto.getComments();
      for (Comment comment : comts) {
        comment.setStrcdt(comment.getCdt().toString());
      }
      return feedphoto;
    }
  }

  @RequestMapping("form")
  public void addform() {
  }

  @PostMapping("addphoto")
  public String addphoto(@RequestParam String bno,@RequestParam String content, @RequestParam MultipartFile file1,
      @RequestParam MultipartFile file2, @RequestParam MultipartFile file3
      ) throws IllegalStateException, IOException {
    int bno2=Integer.parseInt(bno);
    
    List<String> files = new ArrayList<>();

    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      files.add(filename);
    }

    if (file2.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      files.add(filename);
    }
    if (file3.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      files.add(filename);
    }
    feedPhotoService.feedPhotoAndFileUpload(bno2, content, files);
    return "redirect:enter?no="+bno2;
  }

  @PostMapping("addavi")
  public String addavi(@RequestParam String bno, String title, String content, String url) {
    System.out.println(bno);
    int bno2=Integer.parseInt(bno);
    String urlid = url.substring(32,43);

    aviService.uploadAvi(bno2, title, content, urlid);

    return "redirect:enter?no="+bno2;
  }
  
  @RequestMapping("insertavicomt")
  public void insertcomt(int abno, int no, String cont) {
    System.out.println(abno+"//"+no+"//"+cont);
    
    aviService.insertComment(abno, no, cont);
    
  }
  
  @RequestMapping("moreavi")
  public void moreavi(int bno) {
    
    
  }
  

}





















