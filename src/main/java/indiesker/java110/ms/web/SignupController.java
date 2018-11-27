package indiesker.java110.ms.web;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.MemberService;
import indiesker.java110.ms.service.SupporterService;

@RequestMapping("/signup")
@Controller
public class SignupController{

  HashMap<String,Object> bsuknsup = new HashMap<>();
  BuskerService buskerService; 
  MemberService memberService;
  SupporterService supporterService;

  ServletContext sc;

  public SignupController(HashMap<String, Object> busk, BuskerService buskerService,
      MemberService memberService, SupporterService supporterService, ServletContext sc) {
    super();
    this.bsuknsup = busk;
    this.buskerService = buskerService;
    this.memberService = memberService;
    this.supporterService = supporterService;
    this.sc = sc;
  }

  @RequestMapping("member/form")
  public void memberform() {
  }

  @PostMapping("member/add")
  public String add(@RequestParam String type,
      Member m,@RequestParam String id,
      @RequestParam MultipartFile file1) throws Exception  {
    
    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      m.setPhoto(filename);
    }
    
    bsuknsup.put("id", id);
    memberService.add(m);
    if(type.equals("fan")) {
      return "redirect:form";         
    }else if(type.equals("busker")) {
      return "redirect:../busker/form";  
    }else if(type.equals("supporter")) {
      return "redirect:../supporter/form";   
    }else {
      return "redirect:form";  
    }
  }

  @ResponseBody
  @RequestMapping("member/checkId")
  public int checkId(String id, Model model) throws Exception {
    return memberService.checkId(id);
  }

  @ResponseBody
  @RequestMapping("member/checkEmail")
  public int checkEmail(String email, Model model) throws Exception {
    return memberService.checkEmail(email);
  }

  @ResponseBody
  @RequestMapping("member/checkNick")
  public int checkNickname(String nickname, Model model) throws Exception {
    return memberService.checkNickname(nickname);
  }


  @RequestMapping("busker/form")
  public void buskerform() {
  }

  @RequestMapping("busker/addavi")
  public void addavi(Busker b,  @RequestParam MultipartFile file1) throws Exception {
    String filename=null;
    if (file1.getSize() > 0) {
      filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      b.setTeamPhoto(filename);
    }
    bsuknsup.put("busker", b);
    bsuknsup.put("file", filename);
  }

  @RequestMapping("busker/add")
  public void add(Busker b, @RequestParam String url1, @RequestParam String url2, Model model) {
    Busker buskers = (Busker) bsuknsup.get("busker");
    String fileName = (String) bsuknsup.get("file");
    String id= (String) bsuknsup.get("id");
    int no = memberService.findNoById(id);
    buskers.setAvi1(url1);
    buskers.setAvi2(url2);
    buskers.setTeamPhoto(fileName);
    buskers.setNo(no);
    System.out.println(buskers);
    buskerService.add(buskers);
  }
  
  
  @RequestMapping("supporter/form")
  public void supporterform() {
  }
  
  
  @ResponseBody
  @RequestMapping("supporter/checkName")
  public int checkName(String name) throws Exception {
    return supporterService.checkName(name);
  }
  
  
  @RequestMapping("supporter/add")
  public void add(Supporter s, StagePhoto sp, Model model, @RequestParam MultipartFile file1, 
      @RequestParam MultipartFile file2, @RequestParam MultipartFile file3) throws Exception {
    String id= (String) bsuknsup.get("id");
    System.out.println(id);
    int no = memberService.findNoById(id);
    s.setNo(no);
    sp.setSno(no);
    supporterService.add(s);
    
    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
    }
    supporterService.insert(sp);
    if (file2.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
    }
    supporterService.insert(sp);
    if (file3.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
    }
    supporterService.insert(sp);   

  }

}