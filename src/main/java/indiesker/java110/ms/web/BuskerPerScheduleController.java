package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
  public String add(Schedule schedule) {

    schedule.setNsdt(schedule.getNsdt().toString());
    schedule.setNedt(schedule.getNsdt().substring(0, 10)+' '+schedule.getNedt().toString());

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
      @RequestParam(defaultValue="5")int bno,
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 3;
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    pageSize=9;
    List<Schedule> list = scheduleService.mybslist(pageNo, pageSize); // 요청건
    List<Schedule> plist = scheduleService.myperlist(pageNo, pageSize); // 개인스케줄
    List<Schedule> inglist = scheduleService.mybslistbyflag(1, bno, pageNo, pageSize);
    List<Schedule> edlist = scheduleService.mybslistbyflag(2, bno, pageNo, pageSize);

    list.addAll(plist);

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
    
    // 전체스케줄 list 데이터 형식 수정
    for (Schedule ll : list) {
      ll.setNsdt(format.format(ll.getSdt()));
      ll.setNedt(format.format(ll.getEdt()));
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
    
    // 개인스케줄 list 데이터 형식 수정
    for (Schedule pl : plist) {
      pl.setNsdt(format.format(pl.getSdt()));
      pl.setNedt(format.format(pl.getEdt()));
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
    
    // 진행스케줄 inglist 데이터 형식 수정
    for (Schedule ing : inglist) {
      ing.setNsdt(format.format(ing.getSdt()));
      ing.setNedt(format.format(ing.getEdt()));
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
    
    // 완료스케줄 edlist 데이터 형식 수정
    for (Schedule ed : edlist) {
      ed.setNsdt(format.format(ed.getSdt()));
      ed.setNedt(format.format(ed.getEdt()));
      String naddr=ed.getAddr().substring(ed.getAddr().indexOf(" ")+1,ed.getAddr().length());
      int startindex=ed.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ed.setAddr(ed.getAddr().substring(0,endindex));
    }

    
    model.addAttribute("list", list);
    model.addAttribute("plist", plist);
    model.addAttribute("inglist", inglist);
    model.addAttribute("edlist", edlist);
  }


  @ResponseBody
  @RequestMapping(value="clikeDate")
  public List<Schedule> getDateSchedule(
      @RequestParam(value="no") String no,
      @RequestParam(value="date")String date, Model model) {
    System.out.println(no);
    System.out.println(date);
    List<Schedule> clist = scheduleService.findbydate(no, date);

    for (Schedule s : clist) {
      System.out.println(s.getNedt());
    }

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    for (Schedule ps : clist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }


    return clist;

  }

  @ResponseBody
  @RequestMapping(value="clikeFlag")
  public List<Schedule> getFlagSchedule(
      /*@RequestParam(value="flag")*/ String flag,
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="9")int pageSize,  Model model) {

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    if(flag.equals("1")||flag.equals("2")) {
      System.out.println(flag+"플래그 넘어감");
      List<Schedule> flist = scheduleService.findbyflag(flag,pageNo,pageSize);
      for (Schedule ps : flist) {
        ps.setNsdt(format.format(ps.getSdt()));
        ps.setNedt(format.format(ps.getEdt()));
        ps.setNcdt(format.format(ps.getCdt()));
      }
      return flist;


    }else  {
      List<Schedule> plist = scheduleService.myperlist(pageNo, pageSize);

      for (Schedule ps : plist) {
        ps.setNsdt(format.format(ps.getSdt()));
        ps.setNedt(format.format(ps.getEdt()));
        ps.setNcdt(format.format(ps.getCdt()));
      }
      return plist;
    }



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

    detailschedule.setNsdt(format.format(detailschedule.getSdt()));
    detailschedule.setNedt(format.format(detailschedule.getEdt()));
    detailschedule.setNcdt(format.format(detailschedule.getCdt()));
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
  
  @PostMapping("editperschedule")
  public String editperschedule(Schedule schedule) {
    
    System.out.println(schedule);
    
    schedule.setNsdt(schedule.getNsdt().toString());
    schedule.setNedt(schedule.getNsdt().substring(0, 10)+' '+schedule.getNedt().toString());

    System.out.println(schedule.getAddr());
    System.out.println(schedule.getNsdt());
    System.out.println(schedule.getNedt());
    System.out.println(schedule.getShopname());
    System.out.println(schedule.getX());
    System.out.println(schedule.getY());
    scheduleService.editperschedule(schedule);
    return "good"; 

  }


}

