package indiesker.java110.ms.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.MemberService;

@RequestMapping("/signup/member")
@Controller //managerListContoller 라고 Spring이 자동으로 이름 지어줌
public class MemberController{ 

    MemberService memberService;   
    ServletContext sc;


    public MemberController(MemberService memberService, ServletContext sc) {
      this.memberService = memberService;
      this.sc = sc;
    }
 
    @RequestMapping("form")
    public void form() {
    }    
    
    @PostMapping("add")
    public String add(
            Member m,
            MultipartFile file1) throws Exception  {
        System.out.println(m.getGenre());
        if (file1.getSize() > 0) {
            String filename = UUID.randomUUID().toString();
            System.out.println(filename);
            file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
            m.setPhoto(filename);
        }
        
        System.out.println(m.getYn());
        System.out.println(m.getEmail());
        System.out.println(m.getPhoto());
        memberService.add(m);
    
        return "redirect:form";
    }
    
    @RequestMapping()
    public int checkId(String id) throws Exception {
      
      return 0;
    }
    
    
    
}







