package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
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
    List<Schedule> list = scheduleService.mybslist(pageNo, pageSize);
    List<Schedule> plist = scheduleService.myperlist(pageNo, pageSize);


    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    for (Schedule pl : plist) {
      pl.setNsdt(format.format(pl.getSdt()));
      pl.setNedt(format.format(pl.getEdt()));
      String naddr=pl.getAddr().substring(pl.getAddr().indexOf(" ")+1,pl.getAddr().length());
      int startindex=pl.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      pl.setAddr(pl.getAddr().substring(0,endindex));
    }

    for (Schedule ps : list) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
      String naddr=ps.getAddr().substring(ps.getAddr().indexOf(" ")+1,ps.getAddr().length());
      int startindex=ps.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      ps.setAddr(ps.getAddr().substring(0,endindex));
    }
    
    


    model.addAttribute("list", list);
    model.addAttribute("plist", plist);
  }


  @ResponseBody
  @RequestMapping(value="clikeDate")
  public List<Schedule> getDateSchedule(
      @RequestParam(value="no") String no,@RequestParam(value="date")String date, Model model) {


    List<Schedule> clist = scheduleService.findbydate(no, date);

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
      @RequestParam(value="flag") String flag,@RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="9")int pageSize,  Model model) {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    System.out.println(flag);
    

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




}
