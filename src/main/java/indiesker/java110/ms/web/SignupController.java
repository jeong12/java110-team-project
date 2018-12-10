package indiesker.java110.ms.web;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
      @RequestParam MultipartFile file1, HttpSession session) throws Exception  {
    
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
      session.setAttribute("from", "busk");
      return "redirect:../busker/form";  
    }else if(type.equals("supporter")) {
      session.setAttribute("from", "sup");
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
    
    if(email.contains("@")) {
      return memberService.checkEmail(email);
    }
    return -1;
  }

  @ResponseBody
  @RequestMapping("member/checkNick")
  public int checkNickname(String nickname, Model model) throws Exception {
    return memberService.checkNickname(nickname);
  }


  @RequestMapping("busker/form")
  public void buskerform(HttpSession session) {
    if(session.getAttribute("loginUser") != null) {
      Member m = (Member)session.getAttribute("loginUser"); 
      bsuknsup.put("id", m.getId());
    }
  }

  @RequestMapping("busker/addavi")
  public void addavi(Busker b,  @RequestParam MultipartFile file1, HttpSession session) throws Exception {
    
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
  public void add(Busker b, @RequestParam String url1, @RequestParam String url2, Model model, HttpSession session) {
    Busker buskers = (Busker) bsuknsup.get("busker");
    String fileName = (String) bsuknsup.get("file");
    String id= (String) bsuknsup.get("id");
    System.out.println(id);
    int no = memberService.findNoById(id);
    
    String[]fid = url1.split("=");
    String[]sid = url2.split("=");

    buskers.setAvi1(fid[1]);
    buskers.setAvi2(sid[1]);
    
    buskers.setTeamPhoto(fileName);
    buskers.setNo(no);
    buskerService.add(buskers);
    session.removeAttribute("from");
  }
  
  
  @RequestMapping("supporter/form")
  public void supporterform(HttpSession session) {
    if(session.getAttribute("loginUser") != null) {
      Member m = (Member)session.getAttribute("loginUser"); 
      bsuknsup.put("id", m.getId());
    }
  }
  
  
  @ResponseBody
  @RequestMapping("supporter/checkName")
  public int checkName(String name) throws Exception {
    return supporterService.checkName(name);
  }
  
  
  @RequestMapping("supporter/add")
  public void add(Supporter s, StagePhoto sp, Model model, @RequestParam MultipartFile file1, 
      @RequestParam MultipartFile file2, @RequestParam MultipartFile file3, HttpSession session) throws Exception {
    
    String id= (String) bsuknsup.get("id");
    int no = memberService.findNoById(id);
    s.setNo(no);
    sp.setSno(no);
    List<StagePhoto> splist = new ArrayList<>();
    System.out.println(s);
    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      splist.add(0, sp);
    }
    
    if (file2.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      splist.add(1,sp);
    }
    if (file3.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      splist.add(2,sp);
    }
    s.setStagesphoto(splist);
    
    supporterService.insert(s);  
    session.removeAttribute("from");

  }
  
  @RequestMapping("busker/test")
  public void test() {
  }
  
  @RequestMapping("busker/test2")
  public String test2() {
    return "Redirect:../../../footer";
  }

}