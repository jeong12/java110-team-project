package indiesker.java110.ms.web;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.service.BuskerBoardDetailService;

@Controller
@RequestMapping("/BuskerBoardDtail")
public class BuskerBoardDetilController {

  BuskerBoardDetailService buskerBoardDetailService;
  ServletContext sc;

  public BuskerBoardDetilController (BuskerBoardDetailService buskerBoardDetailService,
      ServletContext sc) {
    this.buskerBoardDetailService = buskerBoardDetailService;
    this.sc = sc;
  }

  @GetMapping("detail")
  public void detail(
      int bbno,
      Model model) {
    BuskerBoardDetail bd= buskerBoardDetailService.get(bbno);
    model.addAttribute("buskerBoardDetail", bd);
  }
}

