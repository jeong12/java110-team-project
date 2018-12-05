package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {

  ScheduleService scheduleService;
  BuskerService buskerService;
  ServletContext sc;

  
  public ScheduleController(ScheduleService scheduleService, BuskerService buskerService,
      ServletContext sc) {
    super();
    this.scheduleService = scheduleService;
    this.buskerService = buskerService;
    this.sc = sc;
  }

  @GetMapping("list")
  public void main(Paging paging, Model model, String pageNo) {
   paging.setPageSize(13);
   paging.setTotalCount(scheduleService.totSchedule());
   
   List<Schedule> list = scheduleService.showScedule(paging);
   System.out.println(list);
   SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
   SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    
    for (Schedule s : list) {
      s.setNcdt(format.format(s.getSdt()));
      s.setNsdt(hformat.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
    }
    model.addAttribute("list",list);
    model.addAttribute("paging", paging);
    
  }
  
  @RequestMapping("search")
  public void search(@RequestParam String type, @RequestParam String keyword, String date, Model model) {
  List<Schedule> list = scheduleService.searchScehdule(type, keyword, date);
  SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
  SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
  
  for (Schedule s : list) {
    s.setNcdt(format.format(s.getSdt()));
    s.setNsdt(hformat.format(s.getSdt()));
    s.setNedt(hformat.format(s.getEdt()));
  }
  model.addAttribute("list",list);
  
  }
  
}
