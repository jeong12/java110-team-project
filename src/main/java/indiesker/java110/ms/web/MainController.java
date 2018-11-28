package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.AviService;
import indiesker.java110.ms.service.ScheduleService;

@Controller
public class MainController {

  ScheduleService scheduleService;
  AviService aviService;
  ServletContext sc;

  public MainController(
      ScheduleService scheduleService, AviService aviService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.aviService=aviService;
    this.sc = sc;
  }

  @GetMapping("main")
  public void main(HttpSession session, Model model) {
    List<Avi> recentAvi = aviService.getAll();
    List<Avi> poppulAvi = aviService.getPop();
    model.addAttribute("avirec",recentAvi);
    model.addAttribute("avipop",poppulAvi);
    
    Member loginUser = (Member)session.getAttribute("loginUser");
    System.out.println(loginUser);
    if(loginUser != null) {
      List<Avi> folAvi = aviService.getFolAvi(loginUser.getNo());
      model.addAttribute("folavi", folAvi);
    }
    
  }

  @ResponseBody
  @PostMapping(value="main")
  public List<Schedule> mainpst() {
    return scheduleService.findTodaySchedule(); 
  }
  
  @ResponseBody
  @PostMapping(value="todaySear")
  public List<Schedule> todaySear(String city) {
    return scheduleService.findTodaySchedule(city); 
  }
}
