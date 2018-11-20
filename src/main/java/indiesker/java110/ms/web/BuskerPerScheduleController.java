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
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 3;
    
    pageSize=9;
    List<Schedule> list = scheduleService.mybslist(pageNo, pageSize); // 요청건
    List<Schedule> plist = scheduleService.myperlist(pageNo, pageSize); // 개인스케줄
    
    list.addAll(plist);
    
    for(Schedule p:list) {
      p.setLongsdt(p.getSdt().getTime());
    }
    
  //fplist 시간순으로 정렬
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
    
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    /*for (Schedule pl : plist) {
      pl.setNsdt(format.format(pl.getSdt()));
      pl.setNedt(format.format(pl.getEdt()));
      String naddr=pl.getAddr().substring(pl.getAddr().indexOf(" ")+1,pl.getAddr().length());
      int startindex=pl.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      pl.setAddr(pl.getAddr().substring(0,endindex));
    }*/

    for (Schedule ps : list) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
      String naddr=ps.getAddr().substring(ps.getAddr().indexOf(" ")+1,ps.getAddr().length());
      int startindex=ps.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ps.setAddr(ps.getAddr().substring(0,endindex));
    }
   
    model.addAttribute("list", list);
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

}
