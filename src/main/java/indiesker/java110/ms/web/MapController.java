package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/map")
public class MapController {
  
  ScheduleService scheduleService;
  ServletContext sc;
  
  public MapController(ScheduleService scheduleService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }
  
  @GetMapping("main")
  public void main(Model model) {
    List<Schedule> list = scheduleService.findAllSchedule();
    
    
    model.addAttribute("list", list);
    
    
  }
  
  
  

}
