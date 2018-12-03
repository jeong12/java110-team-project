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
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.GradleMember;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.domain.Supporter;
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
          @RequestParam(defaultValue="15") int pageSize,
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
        
      if (pageNo < 1)
          pageNo = 1;
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<MemberManager> list =memberManagerService.dateSelect(flag,text,cdt1,cdt2,pageNo, pageSize);
      DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

      for(MemberManager m:list) {
        m.setNcdt(format.format(m.getCdt()));
        if(m.getMemo()==null) {
          m.setMemo("메모없음");
        }
      }
      return list; 
  }
  
  @ResponseBody
  @RequestMapping(value="memberListDetail")
  public Member memberListDetail(String nik) {
    Member mno = memberManagerService.memListDetail(nik);
    return mno;
    
    
  }
  
  @ResponseBody
  @RequestMapping(value="buskListDetail")
  public Busker buskerListDetail(String nik) {
    Busker bno = memberManagerService.buskListDetail(nik);
    return bno;
  }
  
  @ResponseBody
  @RequestMapping(value="supListDetail")
  public Supporter supListDetail(String nik) {
    Supporter sno = memberManagerService.supListDetail(nik);
    System.out.println(sno);
    return sno;
  }
 /////////////////////////////////////////////////////////////// 
  @ResponseBody
  @RequestMapping(value="update")
  public int update(String memo,String nik, Model medel) {
  
  int rno = memberManagerService.update(memo, nik);
    System.out.println(rno);
  return rno;
}
  
  @RequestMapping("gradle")
  public void listSelect(
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="5") int pageSize,
          Model model) {
      if (pageNo < 1)
          pageNo = 1;
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      List<GradleMember> gradleBusker = memberManagerService.gradleBusker(pageNo, pageSize);
      List<GradleMember> gradleSupporter = memberManagerService.gradleSupporter(pageNo, pageSize);
      model.addAttribute("list",gradleBusker);
      model.addAttribute("sup", gradleSupporter);
  }
  
  @ResponseBody
  @RequestMapping(value="gradleAjaxBusker")
  public List<GradleMember> gradleAjaxBusker(
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="10") int pageSize,
          Model model) throws ParseException {
        
      if (pageNo < 1)
          pageNo = 1;
      
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<GradleMember> list =memberManagerService.gradleAjaxBusker(pageNo, pageSize);

      return list; 
  }
  @ResponseBody
  @RequestMapping(value="gradleAjaxSupporter")
  public List<GradleMember> gradleAjaxSupporter(
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="10") int pageSize,
          Model model) throws ParseException {
        
      if (pageNo < 1)
          pageNo = 1;
      
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<GradleMember> list =memberManagerService.gradleAjaxSupporter(pageNo, pageSize);

      return list; 
  }
  
  @ResponseBody
  @RequestMapping(value="gradleAjaxBuskerSelect")
  public List<GradleMember> gradleAjaxBuskerSelect(String sflag, String text,
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="10") int pageSize,
          Model model) throws ParseException {
        
      if (pageNo < 1)
          pageNo = 1;
      
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<GradleMember> list =memberManagerService.gradleAjaxBuskerSelect(sflag, text, pageNo, pageSize);

      for (GradleMember gradleMember : list) {
        System.out.println(gradleMember.getEmail());
      }
      
      return list; 
  }
  
  @ResponseBody
  @RequestMapping(value="gradleAjaxSupporterSelect")
  public List<GradleMember> gradleAjaxSupporterSelect(String sflag, String text,
          @RequestParam(defaultValue="1") int pageNo,
          @RequestParam(defaultValue="10") int pageSize,
          Model model) throws ParseException {
        
      if (pageNo < 1)
          pageNo = 1;
      
      if (pageSize < 3 || pageSize > 10)
          pageSize = 3;
      
      List<GradleMember> list =memberManagerService.gradleAjaxSupporterSelect(sflag, text, pageNo, pageSize);
     

      return list; 
  }
  
  @ResponseBody
  @RequestMapping(value="supdetail")
  public Supporter supDetail(int no, Model model) {
    Supporter s  = memberManagerService.supGet(no);
    System.out.println(s);
    return s;
  } 
  
  @ResponseBody
  @RequestMapping(value="buskdetail")
  public Busker buskDetail(int no, Model model) {
    Busker b  = memberManagerService.buskGet(no);
    return b;
  } 
  
  @ResponseBody
  @RequestMapping(value="gradlebuskupdate")
  public int gradleBuskUpdate(int no, Model medel) {
  
  int bno = memberManagerService.gradleBuskUpdate(no);
    System.out.println(bno);
  return bno;
}
  
  @ResponseBody
  @RequestMapping(value="gradlesupupdate")
  public int gradleSupUpdate(int no, Model medel) {
  
  int sno = memberManagerService.gradleSupUpdate(no);
    System.out.println(sno);
  return sno;
}
  
  @ResponseBody
  @RequestMapping(value="getMemo", produces = "application/text; charset=utf8")
  public String getMemo(String nik) {
    String memo = memberManagerService.getMemo(nik);
    return memo;
    
  }
  
  
  
/*  @ResponseBody
  @RequestMapping(value="detailMember")
  public MemberManager Memberdetail(String nik,Model model) {
    
    
      MemberManager rno = memberManagerService.getMember(nik);
    
    return rno;
  }
  @ResponseBody
  @RequestMapping(value="detailBusker")
  public Busker Buskerdetai(String nik,Model model) {
    
    
    Busker rno = memberManagerService.getBusker(nik);
    
    return rno;
  }
  @ResponseBody
  @RequestMapping(value="detailSupporter")
  public Supporter detailSupporter(String nik,Model model) {
    
    
    Supporter rno = memberManagerService.getSupporter(nik);
    
    return rno;
  }*/
  

  
  
  
}
