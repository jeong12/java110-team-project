package indiesker.java110.ms.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
import indiesker.java110.ms.domain.Paging;
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
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="9") int pageSize,
      Model model) {
    
    Paging paging1 = new Paging();
    
    paging1.setPageSize(9);

    paging1.setTotalCount(feedPhotoService.recentPhotList2(no));
    System.out.println("총 사진 갯수="+feedPhotoService.recentPhotList2(no));
    
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
    
    SimpleDateFormat scheformatdate = new SimpleDateFormat("EEE. d MMM", new Locale("en", "US"));
    for (Schedule ps : fplist) {
      ps.setFeeddate(scheformatdate.format(ps.getSdt()));
      System.out.println(ps.getFeeddate());
    }
    

    model.addAttribute("photo", paging1);
    model.addAttribute("schelist",fplist);
    model.addAttribute("busk",busker);
    model.addAttribute("recentlist",alist);
    model.addAttribute("recentplist",plist);
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
    int bno2=Integer.parseInt(bno);
    String urlid = url.substring(32,43);

    aviService.uploadAvi(bno2, title, content, urlid);

    return "redirect:enter?no="+bno2;
  }

  @ResponseBody
  @RequestMapping("insertcomment")
  public Avi insertcomt(String abno, String mno, String cont) {
    System.out.println(abno);
    System.out.println(mno);
    System.out.println(cont);
    int abno2 = Integer.parseInt(abno);
    int mno2 = Integer.parseInt(mno);

    aviService.insertComment(abno2, mno2, cont);
    //입력완료================================
    Avi feedavi = aviService.getfeedavibyAbno(abno2);
    List<Comment> comts=feedavi.getComments();
    for (Comment comment : comts) {
      comment.setStrcdt(comment.getCdt().toString());
    }

    return feedavi;
  }
  
  @ResponseBody
  @RequestMapping("insertphotcomment")
  public FeedPhoto insertphotcomt(String pbno, String mno, String cont) {
    int pbno2 = Integer.parseInt(pbno);
    int mno2 = Integer.parseInt(mno);

    int no = feedPhotoService.insertPhotComt(pbno2, mno2, cont);
    System.out.println(no);
    //입력완료================================
    FeedPhoto feedphoto = feedPhotoService.getfeedphotobyPbno(pbno2);
    List<Comment> comts=feedphoto.getComments();
    for (Comment comment : comts) {
      comment.setStrcdt(comment.getCdt().toString());
    }
    return feedphoto;
  }

  @ResponseBody
  @RequestMapping("revisecomment")
  public int revisecomt(String acno,  String cont) {
    int acno2 = Integer.parseInt(acno);
    int kk = aviService.reviseComment(cont, acno2);
    System.out.println(kk);
    return aviService.reviseComment(cont, acno2);
  }

  @ResponseBody
  @RequestMapping("revisephotcomment")
  public int revisephotcomt(String pcno,  String cont) {
    int pcno2 = Integer.parseInt(pcno);
    
    return feedPhotoService.revisePhotComment(cont, pcno2);
  }
  
  @ResponseBody
  @RequestMapping("removecomment")
  public Avi removecomt(String acno,String abno) {
    int acno2 = Integer.parseInt(acno);
    int abno2 = Integer.parseInt(abno);
    aviService.deleteComment(acno2);

    Avi feedavi=aviService.getfeedavibyAbno(abno2);

    List<Comment> comts=feedavi.getComments();
    for (Comment comment : comts) {
      comment.setStrcdt(comment.getCdt().toString());
    }
    
    return feedavi;
  }
  @ResponseBody
  @RequestMapping("removephotcomment")
  public FeedPhoto removephotcomt(String pcno,String pbno) {
    int pcno2 = Integer.parseInt(pcno);
    int pbno2 = Integer.parseInt(pbno);
    feedPhotoService.deletePhotComment(pcno2);

    FeedPhoto feedphoto=feedPhotoService.getfeedphotobyPbno(pbno2);

    List<Comment> comts=feedphoto.getComments();
    for (Comment comment : comts) {
      comment.setStrcdt(comment.getCdt().toString());
    }
    
    return feedphoto;
  }

  @GetMapping("deleteavi")
  public String deleteavi(int abno,int bno) throws Exception {
    aviService.delete(abno);
    return "redirect:enter?no="+bno;
  }

  @GetMapping("deletephoto")
  public String deletephoto(int pbno,int bno) throws Exception {
    feedPhotoService.delete(pbno);
    return "redirect:enter?no="+bno;
  }

  @GetMapping("updateavi")
  public String updateavi(int abno,int bno,String title,
      String url, String cont) throws Exception {
    aviService.reviseAvi(title, cont, url, abno);

    return "redirect:enter?no="+bno;
  }

  @RequestMapping("moreavi")
  public void moreavi(int no,  Model model, @RequestParam(defaultValue="0")int pageNo, Paging paging){
    paging.setPageNo(pageNo);
    paging.setPageSize(12);
    paging.setTotalCount(aviService.totList(no));
    Busker busker = buskerService.get(no);
    List<Avi> alist = aviService.morelist(no, paging);

    //영상 주소에 관한것
    for (Avi avi : alist) {
      String urlid = avi.getUrlid();
      avi.setThumbnail("https://i.ytimg.com/vi/"+urlid+"/hqdefault.jpg");
      avi.setUrl("https://www.youtube.com/embed/"+urlid);

      if(avi.getTitle().length()>30) {
        avi.setTitle(avi.getTitle().substring(0,31)+"...");
      }
    }

    model.addAttribute("busk",busker);
    model.addAttribute("recentlist",alist);
    model.addAttribute("paging",paging);

  }

  @PostMapping("updatephoto")
  public String updatephoto(String pbno, String cont, String bno, @RequestParam MultipartFile file1,
      @RequestParam MultipartFile file2, @RequestParam MultipartFile file3,
      @RequestParam(defaultValue="0") String fpno1, @RequestParam(defaultValue="0") String fpno2, @RequestParam(defaultValue="0") String fpno3
      ) throws IllegalStateException, IOException {
    int pbno2=Integer.parseInt(pbno);

    // 내용 업데이트
    feedPhotoService.updateFeedContent(cont, pbno2);

    // file1 처리
    if (file1.getSize() > 0) {
      int fpno11 = Integer.parseInt(fpno1);
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      feedPhotoService.updateFeedPhoto(filename, fpno11);
    } 
    // file2 처리
    if (file2.getSize() > 0) {
      if(fpno2.equals("0")) {
        String filename = UUID.randomUUID().toString();
        file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        feedPhotoService.insertOneFileUpload(filename, pbno2);
      }else {
        int fpno22 = Integer.parseInt(fpno2);
        String filename = UUID.randomUUID().toString();
        file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        feedPhotoService.updateFeedPhoto(filename, fpno22);
      }
    }
    // file3 처리
    if (file3.getSize() > 0) {
      if(fpno3.equals("0")) {
        String filename = UUID.randomUUID().toString();
        file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        feedPhotoService.insertOneFileUpload(filename, pbno2);
      }else {
        int fpno33 = Integer.parseInt(fpno2);
        String filename = UUID.randomUUID().toString();
        file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
        feedPhotoService.updateFeedPhoto(filename, fpno33);
      }
    }

    return "redirect:enter?no="+bno;
  }

  @ResponseBody
  @RequestMapping("photopaging")
  public Map<String,Object> photopaging(String pageno,String buskno) {
    int buskno2 = Integer.parseInt(buskno);
    int pageno2 = Integer.parseInt(pageno);
    Paging paging1 = new Paging();
    
    paging1.setPageSize(9);

    paging1.setTotalCount(feedPhotoService.recentPhotList2(buskno2));
    
    List<FeedPhoto> plist = feedPhotoService.recentPhotList(buskno2,pageno2,9);
    
    for (FeedPhoto f : plist) {
      System.out.println(f.getCdt());
      f.setStrcdt(f.getCdt().toString());
      }
    
    Map<String,Object> map = new HashMap<>();
    map.put("plist", plist);
    map.put("paging", paging1);
    
    
    return map;
  }
  
}




















