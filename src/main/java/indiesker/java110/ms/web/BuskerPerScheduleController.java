package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/mybs")
public class BuskerPerScheduleController {

  ScheduleService scheduleService;
  ServletContext sc;


  public BuskerPerScheduleController(ScheduleService scheduleService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }

  @PostMapping("add")
  public String add(Schedule schedule, HttpSession session) {
    Member member = (Member)session.getAttribute("loginUser");
    int bno = member.getNo();
    

    schedule.setNsdt(schedule.getNsdt().toString());
    schedule.setNedt(schedule.getNsdt().substring(0, 10)+' '+schedule.getNedt().toString());
    schedule.setBno(Integer.toString(bno));
    System.out.println(schedule.getAddr());
    System.out.println(schedule.getNsdt());
    System.out.println(schedule.getNedt());
    System.out.println(schedule.getShopname());
    System.out.println(schedule.getX());
    System.out.println(schedule.getY());

    scheduleService.addSchedule(schedule);

    return "redirect:main";
  }

  @GetMapping("main")
  public void main(
      @RequestParam(defaultValue="1")int pageNo,
      @RequestParam(defaultValue="10")int pageSize,
      HttpSession session,
      Model model) {
    
    Member member = (Member)session.getAttribute("loginUser");
    int bno = member.getNo();

    Paging paging1 = new Paging();
    Paging paging2 = new Paging();
    Paging paging3 = new Paging();
    Paging paging4 = new Paging();
    
    paging1.setPageSize(10);
    paging2.setPageSize(10);
    paging3.setPageSize(10);
    paging4.setPageSize(10);
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    
    List<Schedule> list = scheduleService.findMyAllSchedule(bno, pageNo, pageSize); // 요청건
    List<Schedule> plist = scheduleService.myperlist(bno, pageNo, pageSize); // 개인스케줄
    List<Schedule> inglist = scheduleService.mybslistbyflag(1, bno, pageNo, pageSize);
    List<Schedule> edlist = scheduleService.mybslistbyflag(2, bno, pageNo, pageSize);

    //list.addAll(plist);//요청 + 개인스케줄 

    
    // 전체스케줄  list
    for(Schedule l:list) {
      l.setLongsdt(l.getSdt().getTime());
    }
    // 전체스케줄 list 시간순으로 정렬
    Collections.sort(list, new Comparator<Schedule>(){
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
 // 리스트별 사이즈로 page에 출력될 갯수 설정
    paging1.setTotalCount(scheduleService.findMyAllScheduleCnt(bno));
    System.out.println("총 스케줄 갯수="+scheduleService.findMyAllScheduleCnt(bno));
    // 전체스케줄 list 데이터 형식 수정
    for (Schedule ll : list) {
      ll.setNsdt(format.format(ll.getSdt()));
      ll.setNedt(hformat.format(ll.getEdt()));
      ll.setNcdt(dformat.format(ll.getCdt()));
      String naddr=ll.getAddr().substring(ll.getAddr().indexOf(" ")+1,ll.getAddr().length());
      int startindex=ll.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ll.setAddr(ll.getAddr().substring(0,endindex));
    }
    
    
    // 개인스케줄 plist
    for(Schedule p:plist) {
      p.setLongsdt(p.getSdt().getTime());
    }
    //개인스케줄 list 시간순으로 정렬
    Collections.sort(plist, new Comparator<Schedule>(){
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
    
    paging2.setTotalCount(scheduleService.buskperscheduleCnt(bno));
    System.out.println("개인 스케줄 갯수="+scheduleService.buskperscheduleCnt(bno));
    // 개인스케줄 list 데이터 형식 수정
    for (Schedule pl : plist) {
      pl.setNsdt(format.format(pl.getSdt()));
      pl.setNedt(hformat.format(pl.getEdt()));
      pl.setNcdt(dformat.format(pl.getCdt()));
      String naddr=pl.getAddr().substring(pl.getAddr().indexOf(" ")+1,pl.getAddr().length());
      int startindex=pl.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      pl.setAddr(pl.getAddr().substring(0,endindex));
    }
    
    // 진행중스케줄  inglist
    for(Schedule ing:inglist) {
      ing.setLongsdt(ing.getSdt().getTime());
    }
    // 진행중스케줄 inglist 시간순으로 정렬
    Collections.sort(inglist, new Comparator<Schedule>(){
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
    
    paging3.setTotalCount(scheduleService.buskbyflagscheduleCnt(1, bno));
    System.out.println("진행중 스케줄 갯수="+scheduleService.buskbyflagscheduleCnt(1, bno));
    // 진행스케줄 inglist 데이터 형식 수정
    for (Schedule ing : inglist) {
      ing.setNsdt(format.format(ing.getSdt()));
      ing.setNedt(hformat.format(ing.getEdt()));
      ing.setNcdt(dformat.format(ing.getCdt()));
      String naddr=ing.getAddr().substring(ing.getAddr().indexOf(" ")+1,ing.getAddr().length());
      int startindex=ing.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ing.setAddr(ing.getAddr().substring(0,endindex));
    }
    
    // 완료스케줄  edlist
    for(Schedule ed:edlist) {
      ed.setLongsdt(ed.getSdt().getTime());
    }
    // 완료스케줄 edlist 시간순으로 정렬
    Collections.sort(edlist, new Comparator<Schedule>(){
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
    
    paging4.setTotalCount(scheduleService.buskbyflagscheduleCnt(2, bno));
    System.out.println("완료 스케줄 갯수="+scheduleService.buskbyflagscheduleCnt(2, bno));
    // 완료스케줄 edlist 데이터 형식 수정
    for (Schedule ed : edlist) {
      ed.setNsdt(format.format(ed.getSdt()));
      ed.setNedt(hformat.format(ed.getEdt()));
      ed.setNcdt(dformat.format(ed.getCdt()));
      String naddr=ed.getAddr().substring(ed.getAddr().indexOf(" ")+1,ed.getAddr().length());
      int startindex=ed.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ed.setAddr(ed.getAddr().substring(0,endindex));
    }

    
    model.addAttribute("list", list);
    model.addAttribute("plist", plist);
    model.addAttribute("inglist", inglist);
    model.addAttribute("edlist", edlist);
    model.addAttribute("listpaging", paging1);
    model.addAttribute("plistpaging", paging2);
    model.addAttribute("inglistpaging", paging3);
    model.addAttribute("edlistpaging", paging4);
  }


  @ResponseBody
  @RequestMapping(value="clikeDate")
  public List<Schedule> getDateSchedule(
      HttpSession session,
      @RequestParam(value="date")String date, Model model) {
    
    Member member = (Member)session.getAttribute("loginUser");
    int bno = member.getNo();
    
    List<Schedule> clist = scheduleService.findbydate(bno, date);

    for (Schedule s : clist) {
      System.out.println(s.getNedt());
    }

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat eformat = new SimpleDateFormat("HH:mm");
    for (Schedule ps : clist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(eformat.format(ps.getEdt()));
    }


    return clist;

  }


  @ResponseBody
  @RequestMapping(value="clikedetail")
  public Schedule detailSchedule(String fakeflag) {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String flag=fakeflag.substring(0,1);
    int no=Integer.parseInt(fakeflag.substring(1, fakeflag.length()));  
    Schedule detailschedule= null;
    System.out.println(flag);
    System.out.println(no);
    if(flag.equals("a")) {
      detailschedule= scheduleService.myreqdetail(no);
      Supporter s= detailschedule.getSupporter();
      if(s.getMessage()==null) {
        s.setMessage("해당 메시지가 없습니다.");
      }
    }else {
      detailschedule= scheduleService.myperdetail(no);
      System.out.println(detailschedule.getShopname());
    }

    detailschedule.setNsdt(format.format(detailschedule.getSdt()).replaceAll("-", "/"));
    detailschedule.setNedt(format.format(detailschedule.getEdt()).replaceAll("-", "/"));
    detailschedule.setNcdt(format.format(detailschedule.getCdt()).replaceAll("-", "/"));
    System.out.println(detailschedule.getNsdt());
    System.out.println(detailschedule.getNedt());
    return detailschedule;

  }

  @ResponseBody
  @RequestMapping("deleteschedule")
  public int reqdelete(String fakeflag) throws Exception{
    System.out.println(fakeflag);
    String flag=fakeflag.substring(0,1);
    int no=Integer.parseInt(fakeflag.substring(1, fakeflag.length()));
    System.out.println(flag);
    System.out.println(no);
    if(flag.equals("a")) {
      return scheduleService.deleteReqSchedule(no);
    }else {
      return scheduleService.deletePerSchedule(no);
    }
  }

  @ResponseBody
  @RequestMapping("checkschedule")
  public int checkschedule( String sdt, 
                            String edt, 
                            int no) throws Exception{
    edt = sdt.substring(0, 10)+" "+edt;
    sdt=sdt.replaceAll("/", "-");
    edt=edt.replaceAll("/", "-");
    System.out.println(sdt);
    System.out.println(edt);
    int total=scheduleService.checkperschedule(sdt, edt, no);
    total+=scheduleService.checkreqschedule(sdt, edt, no);
    System.out.println("======================");
    System.out.println(total);
    return total; 
    
  }
  
  @ResponseBody
  @PostMapping("editperschedule")
  public int editperschedule(Schedule schedule) {
    
    schedule.setNsdt(schedule.getNsdt().toString());
    schedule.setNedt(schedule.getNsdt().substring(0, 10)+' '+schedule.getNedt().toString());

    return scheduleService.editperschedule(schedule);

  }
  
  @ResponseBody
  @RequestMapping("editcheckschedule")
  public int checkeditschedule( String sdt,
                            String edt,
                            String nsdt, 
                            String nedt, 
                            int no) throws Exception{
    edt = sdt.substring(0, 10)+" "+edt;
    sdt=sdt.replaceAll("/", "-");
    edt=edt.replaceAll("/", "-");
    
    nedt = nsdt.substring(0, 10)+" "+nedt;
    nsdt=nsdt.replaceAll("/", "-");
    nedt=nedt.replaceAll("/", "-");
    
    int total=scheduleService.checkeditperschedule(sdt, edt, nsdt, nedt, no);
    total+=scheduleService.checkeditreqschedule(sdt, edt, nsdt, nedt, no);
    System.out.println("======================");
    System.out.println(total);
    return total;
    
  }
  
//paging 처리
  @ResponseBody
  @RequestMapping("page")
  public List<Schedule> paging(String type,String pageNo, HttpSession session){
    
    Member member = (Member)session.getAttribute("loginUser");
    int bno = member.getNo();
    int pageSize=10;
    int pageNoo=Integer.parseInt(pageNo);
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    
    List<Schedule> list;

    if(type.equals("list")) {
      list = scheduleService.findMyAllSchedule(bno, pageNoo, pageSize);
    }else if(type.equals("inglist")) {
      list = scheduleService.mybslistbyflag(1, bno, pageNoo, pageSize);
    }else if(type.equals("edlist")) {
      list = scheduleService.mybslistbyflag(2, bno, pageNoo, pageSize);
    }else{
      list = scheduleService.myperlist(bno, pageNoo, pageSize);
    }
    
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
      String naddr=s.getAddr().substring(s.getAddr().indexOf(" ")+1,s.getAddr().length());
      int startindex=s.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      s.setAddr(s.getAddr().substring(0,endindex));
    }   
    
    for(Schedule s:list) {
      s.setLongsdt(s.getSdt().getTime());
    }
    Collections.sort(list, new Comparator<Schedule>(){
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
    return list;
  }

}

