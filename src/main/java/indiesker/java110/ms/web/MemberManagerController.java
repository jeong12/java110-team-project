package indiesker.java110.ms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.service.MemberManagerService;

@Controller
@RequestMapping("/membermanager")
public class MemberManagerController {

  MemberManagerService memberManagerService;
  ServletContext sc;
  
  public MemberManagerController(MemberManagerService memberManagerService, ServletContext sc) {
    this.memberManagerService = memberManagerService;
    this.sc = sc;
  }
  
  @GetMapping("list")
  public void list(
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="3") int pageSize,
          Model model) {

      if (pageNo < 1)
          pageNo = 1;

      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<MemberManager> list = memberManagerService.listAll(pageNo, pageSize);
      model.addAttribute("list", list);
  }
  
  @GetMapping("select")
  public void listSelect(char flag,
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="3") int pageSize,
          Model model) {

      if (pageNo < 1)
          pageNo = 1;

      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<MemberManager> select = memberManagerService.listSelect(flag ,pageNo, pageSize);
      for (MemberManager m : select) {
        
      }
      model.addAttribute("select", select);
  }
  

}
