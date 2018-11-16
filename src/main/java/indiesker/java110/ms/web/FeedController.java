package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.AviService;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.FeedPhotoService;

@Controller
@RequestMapping("/buskerfeed")
public class FeedController {
  
  AviService aviService;
  FeedPhotoService feedPhotoService;
  BuskerService buskerService;
  ServletContext sc;
  

  public FeedController(AviService aviService, FeedPhotoService feedPhotoService,
      BuskerService buskerService, ServletContext sc) {
    super();
    this.aviService = aviService;
    this.feedPhotoService = feedPhotoService;
    this.buskerService = buskerService;
    this.sc = sc;
  }


  @RequestMapping("enter")
  public void list(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="9") int pageSize,
      Model model) {
    if (pageNo < 1)
      pageNo = 1;
  
  if (pageSize < 9 || pageSize > 10)
      pageSize = 9;
    
    
    List<Avi> alist = aviService.recentList(1);
    List<FeedPhoto> plist = feedPhotoService.recentPhotList(1,pageNo, pageSize);
    
    model.addAttribute("recentlist",alist);
    model.addAttribute("recentplist",plist);
  }
  
  @ResponseBody
  @RequestMapping(value="clikeImage")
  public List<Schedule> getImageNo(
      @RequestParam(value="no") String no, Model model) {
      System.out.println(no);

    return null;
  }
  
  
}
