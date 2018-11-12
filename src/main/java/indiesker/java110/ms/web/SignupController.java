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
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.MemberService;

@RequestMapping("/signup")
@Controller
public class SignupController{

  HashMap<String,Object> busk = new HashMap<>();
  BuskerService buskerService; 
  MemberService memberService;
  ServletContext sc;

  public SignupController(BuskerService buskerService, MemberService memberService,
      ServletContext sc) {
    this.buskerService = buskerService;
    this.memberService = memberService;
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
    m.setId(id);
    busk.put("id", id);
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
  public void buskerform(Busker b) {

  }

  @RequestMapping("busker/addavi")
  public void addavi(Busker b,  @RequestParam MultipartFile file1) throws Exception {
    String filename=null;
    if (file1.getSize() > 0) {
      filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      b.setTeamPhoto(filename);
    }
    busk.put("busker", b);
    busk.put("file", filename);
  }

  @RequestMapping("busker/add")
  public void add(Busker b, @RequestParam String url1, @RequestParam String url2, Model model) {
    
    Busker buskers = (Busker) busk.get("busker");
    String fileName = (String) busk.get("file");
    String id= (String) busk.get("id");
    Member m = memberService.findNoById(id);
    buskers.setNo(m.getNo());
    buskers.setAvi1(url1);
    buskers.setAvi2(url2);
    buskers.setTeamPhoto(fileName);
    buskerService.add(buskers);
  }
  
  @RequestMapping("supporter/form")
  public void supporterform() {
  }



}