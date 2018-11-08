package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.service.AviService;

@Controller
@RequestMapping("/avi")
public class AviController {

  AviService aviService;   
  ServletContext sc;

  public AviController(AviService aviService, ServletContext sc) {
    this.aviService = aviService;
    this.sc = sc;
  }

  @GetMapping("list")
  public void list(
      Model model) {


    List<Avi> list = aviService.list();
    model.addAttribute("list", list);

  }
  @RequestMapping("form")
  public void form() {
    
  }
  
  
  @PostMapping("add")
  public String add(
          Avi avi) throws Exception {
      
      aviService.add(avi);
      
      return "redirect:list";
  }
  
  
}
