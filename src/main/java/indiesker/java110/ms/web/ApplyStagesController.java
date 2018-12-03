package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.ScheduleService;
import indiesker.java110.ms.service.SupporterService;

@Controller
@RequestMapping("/applystages")
public class ApplyStagesController {

  SupporterService supporterService;
  ScheduleService scheduleService;
  BuskerService buskerService;
  ServletContext sc;

  public ApplyStagesController(SupporterService supporterService, ScheduleService scheduleService,
      ServletContext sc) {
    super();
    this.supporterService = supporterService;
    this.scheduleService = scheduleService;
    this.sc = sc;
  }


  @GetMapping("page")
  public void main(Model model, int sno) {
    Supporter supporter = supporterService.findInfo(sno);
    List<StagePhoto> arr = new ArrayList<>();
    
    for(int i=0;i<3;i++) {
      StagePhoto sp = new StagePhoto();
      sp.setPhoto(supporter.getStagephotos().get(i).getPhoto());
      arr.add(sp);
    }
    model.addAttribute("lists",arr);
    model.addAttribute("list",supporter); 
    
  }

  @ResponseBody
  @RequestMapping("chkDates")
  public List<Schedule> chkDates(String date){
    int no = 2;
    List<Schedule> slist = scheduleService.findPossibleStages(no, date);

    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    for (Schedule s : slist) {
      s.setNsdt(hformat.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
    }
    return slist;
  }
  
  @ResponseBody
  @RequestMapping("applyStage")
  public int applyStage(String[] ssno, String cont, String count){
    
    int bno = 5;
    ArrayList<Integer> list = new ArrayList<>();
    for(int i=0;i<ssno.length;i++) {
      list.add(Integer.parseInt(ssno[i]));
    }
    return scheduleService.ApplyStages(bno, cont, count,list);
  }
  
  
  


}
