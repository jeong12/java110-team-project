package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.domain.Comment;
import indiesker.java110.ms.service.BuskerBoardDetailService;

@Controller
@RequestMapping("/BuskerBoardDtail")
public class BuskerBoardDetailController {

  BuskerBoardDetailService buskerBoardDetailService;
  ServletContext sc;

  public BuskerBoardDetailController (BuskerBoardDetailService buskerBoardDetailService,
      ServletContext sc) {
    this.buskerBoardDetailService = buskerBoardDetailService;
    this.sc = sc;
  }

  @GetMapping("detail")
  public void detail(
      int bbno,
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {
    BuskerBoardDetail bd= buskerBoardDetailService.get(bbno);
    List<Comment> commentList = buskerBoardDetailService.comtList(bbno,pageNo, pageSize);
    model.addAttribute("buskerBoardDetail", bd);
    model.addAttribute("comment", commentList);
  }
  
}

