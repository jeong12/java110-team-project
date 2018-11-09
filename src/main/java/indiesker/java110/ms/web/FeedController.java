package indiesker.java110.ms.web;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.service.BuskerService;

@Controller
@RequestMapping("/buskerfeed")
public class FeedController {
  BuskerService buskerService;
  
  ServletContext sc;

  public FeedController(BuskerService buskerService, ServletContext sc) {
    this.buskerService = buskerService;
    this.sc = sc;
  }
  
/*  @GetMapping("enter")
  public void list(
      Model model) {


    List<Avi> list = buskerService.get();
    model.addAttribute("list", list);

  }*/
  
  
  
  
}
