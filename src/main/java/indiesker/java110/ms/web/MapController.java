package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    List<Schedule> list = scheduleService.findAllSchedule();//test용
    //List<Schedule> list = scheduleService.findTodayAllSchedule();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (Schedule l : list) {
      l.setNsdt(format.format(l.getSdt()));
      l.setNedt(hformat.format(l.getEdt()));
      l.setNcdt(dformat.format(l.getCdt()));
      String naddr=l.getAddr().substring(l.getAddr().indexOf(" ")+1,l.getAddr().length());
      int startindex=l.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      l.setSimpleaddr(l.getAddr().substring(0,endindex));
    }
    
    
    model.addAttribute("list", list);
    
    
  }
  
  @ResponseBody
  @RequestMapping(value="SearchByTag")
  public List<Schedule> getTodaySchedule(
      String sido,
      String sigungu) {
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    
    String keyword1=sido+" "+sigungu.substring(0, sigungu.length()-1);
    String keyword2=sido+" "+sigungu.substring(0, sigungu.length()-1);
    
    if(sido.length()==4) {
      keyword2=sido.substring(0, 1)+sido.substring(2, 3)+" "+sigungu.substring(0, sigungu.length()-1);
    }else {
      keyword2=sido.substring(0, 2)+" "+sigungu.substring(0, sigungu.length()-1);
    }
    if(sigungu.length()==2) {
      keyword1=sido+" "+sigungu;
      keyword2=sido+" "+sigungu;
    }
    System.out.println(keyword1);
    System.out.println(keyword2);

    List<Schedule> list = scheduleService.findSearchAllSchedule(keyword1, keyword2);
    
    for (Schedule l : list) {
      l.setNsdt(format.format(l.getSdt()));
      l.setNedt(hformat.format(l.getEdt()));
      l.setNcdt(dformat.format(l.getCdt()));
      String naddr=l.getAddr().substring(l.getAddr().indexOf(" ")+1,l.getAddr().length());
      int startindex=l.getAddr().indexOf(" ")+1;
      int endindex=naddr.indexOf(" ")+startindex;
      l.setSimpleaddr(l.getAddr().substring(0,endindex));
    }
    return list;

  }
  
  
  @ResponseBody
  @RequestMapping(value="SearchByWord")
  public List<Schedule> getDateSchedule(
      String keyword) {
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    

    List<Schedule> list = scheduleService.findbywordSearchAllSchedule(keyword);
    
    for (Schedule l : list) {
      l.setNsdt(format.format(l.getSdt()));
      l.setNedt(hformat.format(l.getEdt()));
      l.setNcdt(dformat.format(l.getCdt()));
    }

    return list;

  }

}
