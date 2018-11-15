package indiesker.java110.ms.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.MemberService;

@Controller
@RequestMapping("/editprofile")
public class EditProController{

  MemberService memberService;
  ServletContext sc;
  
  public EditProController(MemberService memberService, ServletContext sc) {
    this.memberService=memberService;
    this.sc=sc;
  }

  @GetMapping("form")
  public void edit(HttpSession session,Model model) {

    Member member;
    member = (Member)session.getAttribute("loginUser");
    System.out.println(member.toString());
    model.addAttribute("id", member.getId());
    model.addAttribute("nick",member.getNickname());
  }

  @PostMapping("edit")
  public String add(Member m, HttpSession session, MultipartFile file1) throws Exception{

    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      m.setPhoto(filename);
    }
    
    Member mem = (Member)session.getAttribute("loginUser");
    m.setNo(mem.getNo());
    memberService.modiMem(m);
    
    return "redirect:../promotion/list";
  }

  @ResponseBody
  @RequestMapping("checkEmail")
  public int checkEmail(String email, Model model) throws Exception {
    return memberService.checkEmail(email);
  }

}