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
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.BuskerService;
import indiesker.java110.ms.service.MemberService;
import indiesker.java110.ms.service.SupporterService;

@Controller
@RequestMapping("/editprofile")
public class EditProController{

  MemberService memberService;
  BuskerService buskerService;
  SupporterService supporterService;
  ServletContext sc;

  public EditProController(MemberService memberService,
      BuskerService buskerService, SupporterService supporterService, ServletContext sc) {
    this.memberService=memberService;
    this.buskerService=buskerService;
    this.supporterService=supporterService;
    this.sc=sc;
  }

  @GetMapping("prosel")
  public void MyProfile(HttpSession session, Model model) {
    
    Member mem = (Member)session.getAttribute("loginUser");
    
    model.addAttribute("mem",memberService.getMember(mem.getNo()));
    
    if(buskerService.get(mem.getNo()) != null) {
      model.addAttribute("bus",buskerService.get(mem.getNo()));
    } else if(supporterService.get(mem.getNo()) != null) {
      System.out.println(supporterService.findInfo(mem.getNo()));
      model.addAttribute("sup",supporterService.findInfo(mem.getNo()));
    }
  }
  
  @GetMapping("member/form")
  public void edit(HttpSession session,Model model) {

    Member member;
    member = (Member)session.getAttribute("loginUser");
    System.out.println(member.toString());
    model.addAttribute("id", member.getId());
    model.addAttribute("nick",member.getNickname());
    model.addAttribute("photo",member.getPhoto());
  }

  @PostMapping("member/edit")
  public String modi(Member m, HttpSession session, MultipartFile file1) throws Exception{

    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      m.setPhoto(filename);
    }

    Member mem = (Member)session.getAttribute("loginUser");
    m.setNo(mem.getNo());
    memberService.modiMem(m);

    return "redirect:../../promotion/list";
  }

  @ResponseBody
  @RequestMapping("member/checkEmail")
  public int checkEmail(String email, Model model) throws Exception {
    return memberService.checkEmail(email);
  }

  @GetMapping("busker/form")
  public void editBusker(HttpSession session, Model model) {
    Member mem = (Member)session.getAttribute("loginUser");
    Busker b = buskerService.get(mem.getNo());
    System.out.println(b.toString());
    model.addAttribute("busker",b);
  }

  @PostMapping("busker/editB")
  public String modiB(Busker b, HttpSession session, MultipartFile file1) throws Exception{

    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      b.setTeamPhoto(filename);
    }

    Member bus = (Member)session.getAttribute("loginUser");
    b.setNo(bus.getNo());
    System.out.println(b.toString());
    buskerService.modiBusk(b);

    return "redirect:../../promotion/list";
  }

  @GetMapping("supporter/form")
  public void editSupporter(HttpSession session, Model model) {
    Member mem = (Member)session.getAttribute("loginUser");
    StagePhoto[] sp = supporterService.getPhoto(mem.getNo());
    model.addAttribute("sPhoto1",sp[0].getPhoto());
    model.addAttribute("sPhoto2",sp[1].getPhoto());
    model.addAttribute("sPhoto3",sp[2].getPhoto());
  }

  @PostMapping("supporter/editS")
  public String modiS(Supporter s, HttpSession session,
      MultipartFile file1, MultipartFile file2, MultipartFile file3) throws Exception{

    StagePhoto sp = new StagePhoto();
    Member sup = (Member)session.getAttribute("loginUser");
    s.setNo(sup.getNo());
    sp.setSno(s.getNo());
    
    int photNo[] = supporterService.getSpno(s.getNo());
    
    if (file1.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file1.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      sp.setSpno(photNo[0]);
      supporterService.modiSupPho(sp);
    }
    
    
    if (file2.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file2.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      sp.setSpno(photNo[1]);
      supporterService.modiSupPho(sp);
    }
    
    if (file3.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      file3.transferTo(new File(sc.getRealPath("/upload/" + filename)));
      sp.setPhoto(filename);
      sp.setSpno(photNo[2]);
      supporterService.modiSupPho(sp);
    }
    
    supporterService.modiSup(s);

    return "redirect:../../promotion/list";
  }

  @ResponseBody
  @RequestMapping("supporter/checkName")
  public int checkName(String name) throws Exception {
    return supporterService.checkName(name);
  }


}