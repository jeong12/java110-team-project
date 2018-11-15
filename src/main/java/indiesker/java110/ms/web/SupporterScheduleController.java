package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
      pageSize = 3;

    pageSize=9;
    List<Schedule> list = scheduleService.mysslist(pageNo, pageSize);

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(format.format(s.getEdt()));
    }
    
    
    
    model.addAttribute("list", list);
  }
  
  
}
