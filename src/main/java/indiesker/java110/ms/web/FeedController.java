package indiesker.java110.ms.web;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.domain.FeedPhotoFile;
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
      Model model) {
    List<Avi> alist = aviService.recentList(7);
    List<FeedPhoto> plist = feedPhotoService.recentPhotList(1);
    List<FeedPhotoFile> lists = new ArrayList<>();
    
    for (FeedPhoto f : plist) {
      lists= f.getFeedphotoFile();
    }

    model.addAttribute("recentlist",alist);
    model.addAttribute("recentplist",lists);
  }
  
  
  
  
}
