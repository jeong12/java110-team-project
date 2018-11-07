package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.BuskerList;
import indiesker.java110.ms.service.BuskerListService;

@Controller
@RequestMapping("/BuskerList")
public class BuskerListController {

  BuskerListService buskerlistService;   
  ServletContext sc;


  public BuskerListController(BuskerListService buskerlistService, ServletContext sc) {
    this.buskerlistService = buskerlistService;
    this.sc = sc;
  }

  @GetMapping("list")
  public void list(
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue=  "3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 3;

    List<BuskerList> list = buskerlistService.list(pageNo, pageSize);
    model.addAttribute("list", list);

  }
}
