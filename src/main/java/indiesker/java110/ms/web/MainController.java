package indiesker.java110.ms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.AviService;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.ScheduleService;
import indiesker.java110.ms.service.SupporterService;

@Controller
public class MainController {

  ScheduleService scheduleService;
  SupporterService supporterService;
  BuskerService buskerService;
  AviService aviService;
  ServletContext sc;

  public MainController(
      ScheduleService scheduleService, AviService aviService,
      SupporterService supporterService, BuskerService buskerService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.supporterService = supporterService;
    this.aviService=aviService;
    this.buskerService= buskerService;
    this.sc = sc;
  }

  @GetMapping("main")
  public void main(HttpSession session, Model model) {
    List<Avi> recentAvi = aviService.getAll();
    List<Avi> poppulAvi = aviService.getPop();
    model.addAttribute("avirec",recentAvi);
    model.addAttribute("avipop",poppulAvi);
    
    System.out.println(session.getAttribute("loginUser"));
    
    Member loginUser = (Member)session.getAttribute("loginUser");
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
  
  @ResponseBody
  @PostMapping(value="hotPlace")
  public List<Supporter> hotPlace() {
    return supporterService.getHot();
  }
  
  @ResponseBody
  @PostMapping(value="hotSear")
  public List<Supporter> hotSear(String city) {
    Map<String,Object> params = new HashMap<>();
    params.put("city", city);
    return supporterService.getHot(params);
  }
  
  @ResponseBody
  @PostMapping(value="supPhoto")
  public StagePhoto[] supPhoto(int no) {
    return supporterService.getPhoto(no);
  }
  
  @ResponseBody
  @PostMapping(value="bestBuskers")
  public List<Busker> bestBuskers() {
    return buskerService.getByBest();
  }
  
  @ResponseBody
  @PostMapping(value="bestSear")
  public List<Busker> bestSear(String city) {
    Map<String,Object> params = new HashMap<>();
    params.put("city", city);
    return buskerService.getByBest(params);
  }
  
  @ResponseBody
  @PostMapping(value="busDetail")
  public List<Busker> busDetail(int no) {
    return buskerService.getByBestDetail(no);
  }
  
}
