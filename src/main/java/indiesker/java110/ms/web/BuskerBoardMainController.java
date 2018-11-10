package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.BuskerBoardMain;
import indiesker.java110.ms.service.BuskerBoardMainService;

@Controller
@RequestMapping("/BuskerBoardMain")
public class BuskerBoardMainController {
  
  BuskerBoardMainService buskerBoardMainService;
  ServletContext sc;
  
  public BuskerBoardMainController(BuskerBoardMainService buskerBoardMainService,ServletContext sc) {
    this.buskerBoardMainService = buskerBoardMainService;
    this.sc = sc;
  }
  
  @GetMapping("list")
  public void list( 
    @RequestParam(defaultValue="1") int pageNo,
    @RequestParam(defaultValue="3") int pageSize,
    Model model){
      
      if(pageNo<1)
        pageNo=1;
      
      if(pageSize < 3 || pageSize > 10)
        pageSize = 3;
      
      List<BuskerBoardMain> list = buskerBoardMainService.list(pageNo, pageSize);
      model.addAttribute("list",list);
    }
    
    
  }
  
  
  

