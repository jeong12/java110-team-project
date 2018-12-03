package indiesker.java110.ms.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.BuskerBoard;
import indiesker.java110.ms.service.BuskerBoardService;

@Controller
@RequestMapping("/BuskerBoard")
public class BuskerBoardController { 
    
    BuskerBoardService buskerBoardService;
    ServletContext sc;
    
    public BuskerBoardController(BuskerBoardService buskerBoardService,
        ServletContext sc) {
        this.buskerBoardService = buskerBoardService;
        this.sc = sc;
    }

    
    
    @GetMapping("form")
    public void form() {
      
    }
    
    
    @PostMapping("add")
    public String add(
            BuskerBoard buskerBoard,
            MultipartFile file1) throws Exception {
        System.out.println(buskerBoard);
        
        
        
        if (file1.getSize() > 0) {
          String filename = UUID.randomUUID().toString();
          file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
          buskerBoard.setPhot(filename);
        }
        
        
        buskerBoardService.add(buskerBoard);
        
        return "redirect:form";
    }
    
  
     
    
}
