package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {

  ScheduleService scheduleService;
  ServletContext sc;

  public ScheduleController(ScheduleService scheduleService, ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }

  @GetMapping("main")
  public void main(Model model) {
    List<Schedule> list = scheduleService.showScedule();
    SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
    }
    
    model.addAttribute("list",list);
    
  }
}
