package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/myss")
public class SupporterScheduleController {

  ScheduleService scheduleService;
  ServletContext sc;


  public SupporterScheduleController(ScheduleService scheduleService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }


  @GetMapping("main")
  public void main(
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 9;

    List<Schedule> list = scheduleService.mysslist(pageNo, pageSize);
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<Supporter> sup = new ArrayList<>();
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(format.format(s.getEdt()));
      s.setNcdt(format.format(s.getCdt()));
    }    
    model.addAttribute("list", list);
  }
  
  
  @ResponseBody
  @RequestMapping("chkFlag")
  public List<Schedule> findSuggestsbyflag(
      String flag, @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="9")int pageSize, Model model) {
    
    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 9;
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    if(flag.equals("1")||flag.equals("2")) {
      List<Schedule> flist = scheduleService.findSuggestsbyflag(flag, pageNo, pageSize);
        for (Schedule ps : flist) {
          ps.setNsdt(format.format(ps.getSdt()));
          ps.setNedt(format.format(ps.getEdt()));
          ps.setNcdt(format.format(ps.getCdt()));
        }
      return flist;    
    }else{
      List<Schedule> flist = scheduleService.mysslist(pageNo, pageSize);
      for (Schedule fs : flist) {
        fs.setNsdt(format.format(fs.getSdt()));
        fs.setNedt(format.format(fs.getEdt()));
        fs.setNcdt(format.format(fs.getCdt()));
      }
      return flist;
    }
  }
  
  @ResponseBody
  @RequestMapping("showDate")
  public List<Schedule> findunableSchedule(String date,Model model){
    
    int no = 2;
    
    List<Schedule> slist = scheduleService.findunableSchedule(date, no);
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    for (Schedule ps : slist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }
    System.out.println("showDate in Controller");
    System.out.println(slist);
    return slist;
  }
  
}
