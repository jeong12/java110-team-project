package indiesker.java110.ms.web;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import indiesker.java110.ms.service.FindIdService;

@Controller
@RequestMapping("/member")
public class FindIdController {
    
    FindIdService findIdService;
    ServletContext sc;
    
    public FindIdController (
        FindIdService findIdService,
        ServletContext sc) {
      this.findIdService = findIdService;
      this.sc = sc;
    }
    
    @GetMapping("findId")
    public void findId() {
        
    }

}
