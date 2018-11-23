package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.ScheduleService;

@Controller
public class MainController {

  ScheduleService scheduleService;
  ServletContext sc;

  public MainController(ScheduleService scheduleService, ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }

  @GetMapping("main")
  public void main(Model model) {
    
    
  }

  @ResponseBody
  @PostMapping(value="main")
  public List<Schedule> mainpst() {
    return scheduleService.findTodaySchedule(); 
  }
  
  @ResponseBody
  @PostMapping(value="todaySear")
  public List<Schedule> todaySear(String city) {
    System.out.println(city);
    return scheduleService.findTodaySchedule(city); 
  }
}
