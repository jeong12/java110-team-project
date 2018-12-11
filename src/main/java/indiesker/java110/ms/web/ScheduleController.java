package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
  
  
  Map<String,Object> search = new HashMap<>();

  @GetMapping("list")
  public void main(Paging paging, Model model, String pageNo) {
   paging.setPageSize(13);
   paging.setTotalCount(scheduleService.totSchedule());
   
   List<Schedule> list = scheduleService.showScedule(paging);
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
  
  @ResponseBody
  @RequestMapping("detail")
  public Busker detail(int bno) {
    Busker b = buskerService.findInfo(bno);
 System.out.println(b);
    return b;
  }
  
  
  
  @RequestMapping("search")
  public void search(@RequestParam String type, @RequestParam String keyword, String date, Model model) {

    search.put("type", type);
    search.put("keyword", keyword);
    search.put("date", date);
    
  Paging paging = new Paging();
  paging.setPageSize(13);
  paging.setTotalCount(scheduleService.totsearchScehdule(type, keyword, date));
  List<Schedule> list = scheduleService.searchScehdule(type, keyword, date, paging);
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
  
  @ResponseBody
  @RequestMapping("searchPaging")
  public Map<String,Object> searchPaging(int pageNo){
    
    String keyword = (String)search.get("keyword");
    String type = (String)search.get("type");
    String date = (String)search.get("date");
    
    Paging paging = new Paging();
    paging.setPageSize(13);
    paging.setPageNo(pageNo);
    paging.setTotalCount(scheduleService.totsearchScehdule(type, keyword, date));
    
    List<Schedule> list = scheduleService.searchScehdule(type, keyword, date, paging);
   
    SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    
    for (Schedule s : list) {
      s.setNcdt(format.format(s.getSdt()));
      s.setNsdt(hformat.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
    }
    
    
    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    
    return map;
  }
  
  
  
  
}
