package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.StageList;
import indiesker.java110.ms.service.StageListService;

@Controller
@RequestMapping("/stagelist")
public class StageListController {

  StageListService stageListService;   
  ServletContext sc;


  public StageListController(StageListService stageListService, ServletContext sc) {
    this.stageListService = stageListService;
    this.sc = sc;
  }

  @GetMapping("list")
  public void list(
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 3;

    List<StageList> list = stageListService.list(pageNo, pageSize);
    model.addAttribute("list", list);

  }
  
  @GetMapping("name")
  public void name(@RequestParam String name, Model model) {
    List<StageList> names = stageListService.findByName(name);
    model.addAttribute("name",names);
  }
  
  @GetMapping("local")
  public void local(@RequestParam String local, Model model) {
    List<StageList> locals = stageListService.findByLocal(local);
    model.addAttribute("local",locals);
  }
}
