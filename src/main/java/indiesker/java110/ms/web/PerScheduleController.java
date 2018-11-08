package indiesker.java110.ms.web;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.BuskerSchedule;
import indiesker.java110.ms.domain.PerSchedule;
import indiesker.java110.ms.service.BuskerScheduleService;
import indiesker.java110.ms.service.PerScheduleService;

@Controller
@RequestMapping("/mybs")
public class PerScheduleController {

  BuskerScheduleService buskerscheduleService;
  PerScheduleService perscheduleService;
  ServletContext sc;


  public PerScheduleController(BuskerScheduleService buskerscheduleService,
                               PerScheduleService perscheduleService,
                               ServletContext sc) {
    this.buskerscheduleService = buskerscheduleService;
    this.perscheduleService = perscheduleService;
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

    
    List<BuskerSchedule> list = buskerscheduleService.list(pageNo, pageSize);
    List<PerSchedule> plist = perscheduleService.list(pageNo, pageSize);
    
    /*for (PerSchedule p : plist) {
      //p.setSdt(sdt);
       List<LocalDate> newcdt=p.getCdt().toLocalDate();
    }
    plist.add(newcdt);*/
    model.addAttribute("list", list);
    model.addAttribute("plist", plist);

  }
}
