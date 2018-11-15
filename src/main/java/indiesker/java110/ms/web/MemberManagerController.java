package indiesker.java110.ms.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
          @RequestParam(defaultValue="10") int pageSize,
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
          @RequestParam(defaultValue="10") int pageSize,
          Model model) {

      if (pageNo < 1)
          pageNo = 1;

      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      List<MemberManager> select = memberManagerService.listSelect(flag ,pageNo, pageSize);
      
      model.addAttribute("select", select);
  }
  
  @ResponseBody
  @RequestMapping(value="dateselect")
  public List<MemberManager> dateSelect(String flag, String text,String cdt1, String cdt2,
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="10") int pageSize,
          Model model) throws ParseException {
        
/*    
    DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

    String ncdt1= sdFormat.format(cdt1);
    String ncdt2= sdFormat.format(cdt2);*/
    
/*    Date ncdt1 = Date.valueOf(cdt1);
    Date ncdt2 = Date.valueOf(cdt2);
         */
    
    
    System.out.println(flag);
    System.out.println(cdt1);
    System.out.println(cdt2);
    System.out.println(text);
      if (pageNo < 1)
          pageNo = 1;
      
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      
      
      List<MemberManager> list =memberManagerService.dateSelect(flag,text,cdt1,cdt2,pageNo, pageSize);
     
        
      DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

      for(MemberManager m:list) {
        m.setNcdt(format.format(m.getCdt()));
      }
      
      return list; 
  }
  

}
