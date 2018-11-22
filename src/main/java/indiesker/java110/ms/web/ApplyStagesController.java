package indiesker.java110.ms.web;

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
import indiesker.java110.ms.service.ScheduleService;
import indiesker.java110.ms.service.SupporterService;

@Controller
@RequestMapping("/applystages")
public class ApplyStagesController {

  SupporterService supporterService;
  ScheduleService scheduleService;
  ServletContext sc;

  public ApplyStagesController(SupporterService supporterService, ScheduleService scheduleService,
      ServletContext sc) {
    super();
    this.supporterService = supporterService;
    this.scheduleService = scheduleService;
    this.sc = sc;
  }



  @GetMapping("main")
  public void main(Model model) {
    int no = 121;
    Supporter supporter = supporterService.findInfo(no);
    List<StagePhoto> arr = new ArrayList<>();
    
    for(int i=0;i<3;i++) {
      StagePhoto sp = new StagePhoto();
      sp.setPhoto(supporter.getStagephotos().get(i).getPhoto());
      arr.add(sp);
    }
    model.addAttribute("lists",arr);
    model.addAttribute("list",supporter); 
    
  }

/*  @ResponseBody
  @RequestMapping("chkDates")
  public List<Schedule> chkDates(String date){
    int no = 2;
    return null;
  }
*/

}
