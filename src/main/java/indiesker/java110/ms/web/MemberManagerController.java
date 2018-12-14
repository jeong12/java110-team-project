package indiesker.java110.ms.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.GradleMember;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.domain.Paging;
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

  
  // list의 전체 목록 뿌리는 메서드
  @GetMapping("list") 
  public void list(Paging paging, Model model, String pageNo) {

    paging.setTotalCount(memberManagerService.totlist());
     paging.setPageSize(15);
     
     List<MemberManager> list = memberManagerService.listAll(paging);
     
     SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
     for (MemberManager mm : list) {
      mm.setNcdt(dformat.format(mm.getCdt()));
    }
     
      model.addAttribute("paging",paging);
      model.addAttribute("list", list);
  }

  
  //gradle 검색
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
      for (MemberManager mm : select) {
        if(mm.getMemo() == null) {
          mm.setMemo("해당 데이터가 없습니다.");
        }
      }
      
      model.addAttribute("select", select);
  }

  
  
  @ResponseBody
  @RequestMapping(value="dateselect")
  public Map<String,Object> dateSelect(String flag, String text,String cdt1, String cdt2,
      @RequestParam(defaultValue="0") int pageNo, Model model) throws ParseException {
    
    Map<String,Object> map = new HashMap<>();
    Paging paging = new Paging();
    paging.setPageNo(pageNo);
    paging.setPageSize(20);
    paging.setTotalCount(memberManagerService.totdateSelect(flag, text, cdt1, cdt2));
        
      List<MemberManager> list =memberManagerService.dateSelect(flag,text,cdt1,cdt2,paging);
      DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

      for(MemberManager m:list) {
        m.setNcdt(format.format(m.getCdt()));
        if(m.getMemo()==null) {
          m.setMemo("메모없음");
        }
      }
      map.put("list", list);
      map.put("paging", paging);
      return map;
  }

  
  // List의 상세보기(회원)
  @ResponseBody
  @RequestMapping(value = "memberListDetail")
  public Member memberListDetail(String nik) {
    Member mno = memberManagerService.memListDetail(nik);
    if (mno.getMemo() == null) {
      mno.setMemo("메모없음");
    }
    return mno;


  }

  // List의 상세보기(버스커)
  @ResponseBody
  @RequestMapping(value = "buskListDetail")
  public Busker buskerListDetail(String nik) {
    Busker bno = memberManagerService.buskListDetail(nik);

    if (bno.getMemo() == null) {
      bno.setMemo("메모없음");
    }

    return bno;
  }

  // List의 상세보기(제공자)
  @ResponseBody
  @RequestMapping(value = "supListDetail")
  public Supporter supListDetail(String nik) {
    Supporter sno = memberManagerService.supListDetail(nik);

    if (sno.getMemo() == null) {
      sno.setMemo("메모없음");
    }
    return sno;
  }

  ///////////////////////////////////////////////////////////////
  @ResponseBody
  @RequestMapping(value = "update")
  public int update(String memo, String nik, Model medel) {

    int rno = memberManagerService.update(memo, nik);
    return rno;
  }

  // gradle 전체 보기
  @RequestMapping("gradle")
  public void listSelect(Model model) {
    Paging paging = new Paging();
    paging.setPageSize(15);
    paging.setTotalCount(memberManagerService.totgradle());
    List<GradleMember> list = memberManagerService.gradleList(paging);
    
    for (GradleMember gm : list) {
      if(gm.getFlag() == '2') gm.setType("버스커");
      else if(gm.getFlag() == '3') gm.setType("제공자");
    }
    model.addAttribute("list", list);
    model.addAttribute("paging",paging);
  }
  
  @ResponseBody
  @RequestMapping(value = "gradleAjaxBusker")
  public Map<String,Object> gradleAjaxBusker(int flag, @RequestParam(defaultValue="0") int pageNo) throws ParseException {
    
    Paging paging = new Paging();
    paging.setTotalCount(memberManagerService.totgradleAjaxBusker());
    paging.setPageNo(pageNo);

    List<GradleMember> list = memberManagerService.gradleAjaxBusker(paging);
    
    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    System.out.println(list);
    return map;
  }

  @ResponseBody
  @RequestMapping(value = "gradleAjaxSupporter")
  public Map<String,Object> gradleAjaxSupporter(int flag, @RequestParam(defaultValue="0") int pageNo) throws ParseException {
    System.out.println(flag);
    Paging paging = new Paging();
    paging.setTotalCount(memberManagerService.totgradleAjaxSupporter());
    paging.setPageNo(pageNo);
   
    List<GradleMember> list = memberManagerService.gradleAjaxSupporter(paging);

    Map<String,Object> map = new HashMap<>();
    map.put("list", list);
    map.put("paging", paging);
    return map;
  }

 
  @ResponseBody
  @RequestMapping("graleSearch")
  public Map<String,Object> gradleSearch(String text, String flag){
    Map<String,Object> map = new HashMap<>();
    int type = memberManagerService.fingFlag(flag, text);
    if(type <= 0) {
      map.put("tail", 0 );
    }else{
      List<GradleMember> list = memberManagerService.gradleSelect(flag, text, type);
      System.out.println(list);
      for (GradleMember gm : list) {
        if(gm.getFlag() == '2' && gm.getYn() == 'N') {
          map.put("tail", 2);
          gm.setType("버스커");
        }
        else if(gm.getFlag() == '3' && gm.getYn() == 'N') {
          map.put("tail", 2);
          gm.setType("제공자");
        }else {
          map.put("tail", 1);
        }
      }
      map.put("list", list);
    }
    return map;
  }

  
  // gradle 상세보기
  @ResponseBody
  @RequestMapping("supdetail")
  public Supporter supDetail(int no) {
    Supporter s = memberManagerService.supGet(no);
    System.out.println(s);
    return s;
  }

  // gradle 상세보기
  @ResponseBody
  @RequestMapping(value = "buskdetail")
  public Busker buskDetail(int no, Model model) {
    Busker b = memberManagerService.buskGet(no);
    if(b.getMessage() == null)
    b.setMessage("팀소개 글이 없습니다.");
    return b;
  }

  // gradle update
  @ResponseBody
  @RequestMapping(value = "gradlebuskupdate")
  public Map<String,Object> gradleBuskUpdate(int no, Model medel) {

    int result = memberManagerService.gradleBuskUpdate(no);
    HashMap<String,Object> params = new HashMap<>();
    params.put("result", result);
    return params;
  }

  // gradle update
  @ResponseBody
  @RequestMapping(value = "gradlesupupdate")
  public Map<String,Object> gradleSupUpdate(int no) {

    int result = memberManagerService.gradleSupUpdate(no);
    HashMap<String,Object> params = new HashMap<>();
    params.put("result", result);
    return params;
  }

  // list memo
  @ResponseBody
  @RequestMapping(value = "getMemo", produces = "application/text; charset=utf8")
  public String getMemo(String nik) {
    String memo = memberManagerService.getMemo(nik);
    return memo;

  }



  /*
   * @ResponseBody
   * 
   * @RequestMapping(value="detailMember") public MemberManager Memberdetail(String nik,Model model)
   * {
   * 
   * 
   * MemberManager rno = memberManagerService.getMember(nik);
   * 
   * return rno; }
   * 
   * @ResponseBody
   * 
   * @RequestMapping(value="detailBusker") public Busker Buskerdetai(String nik,Model model) {
   * 
   * 
   * Busker rno = memberManagerService.getBusker(nik);
   * 
   * return rno; }
   * 
   * @ResponseBody
   * 
   * @RequestMapping(value="detailSupporter") public Supporter detailSupporter(String nik,Model
   * model) {
   * 
   * 
   * Supporter rno = memberManagerService.getSupporter(nik);
   * 
   * return rno; }
   */

  
  // list tab1
  @ResponseBody
  @RequestMapping(value="showList")
  public Map<String,Object>showList(String flag, String pageNo, Paging paging) throws ParseException {
    paging.setTotalCount(memberManagerService.totlist());
    paging.setPageSize(15);
    if(pageNo != null) {
      paging.setPageNo(Integer.parseInt(pageNo));
    }else if(pageNo == null) {
      paging.setPageNo(0);
    }

    List<MemberManager> list = memberManagerService.listAll(paging);
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");

    for (MemberManager mm : list) {
        if(mm.getFlag() == 1) {
          mm.setNcdt(dformat.format(mm.getCdt()));
          mm.setType("회원");
        }else if(mm.getFlag() == 2) {
          mm.setNcdt(dformat.format(mm.getCdt()));
          mm.setType("버스커");
        }else if(mm.getFlag() == 3) {
          mm.setNcdt(dformat.format(mm.getCdt()));
          mm.setType("제공자");
        }else {
          mm.setNcdt(dformat.format(mm.getCdt()));
          mm.setType("정지회원");
        }
      }
      Map<String,Object> map = new HashMap<>();
       map.put("list", list);
       map.put("paging", paging);
       return map;
  }


  // list tab1
  @ResponseBody
  @RequestMapping(value="showMemb")
  public Map<String,Object> showMemb(String flag, String pageNo) throws ParseException {
    Paging paging = new Paging();
    paging.setPageSize(15);
    if(paging.getStartPageNo() == 0) {
        paging.setStartPageNo(1);
    }
    if(pageNo != null) {
      paging.setPageNo(Integer.parseInt(pageNo));
    }else if(pageNo == null) {
      paging.setPageNo(0);
    }
    paging.setTotalCount(memberManagerService.totlistFlag(Integer.parseInt(flag)));
    
    List<MemberManager>  list = memberManagerService.memberAjax(Integer.parseInt(flag),paging);
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (MemberManager mm : list) {
      mm.setNcdt(dformat.format(mm.getCdt()));
      System.out.println(mm.getFlag());
    }    
    
    Map<String,Object> map = new HashMap<>(); 
    map.put("list", list);
    map.put("paging", paging);
    
    return map;
  }

  @ResponseBody
  @RequestMapping(value="showBusk")
  public Map<String,Object> showBusk(int flag,String pageNo) throws ParseException {
    Paging paging = new Paging();
    if(pageNo != null) {
      paging.setPageNo(Integer.parseInt(pageNo));
    }else if(pageNo == null) {
      paging.setPageNo(0);
    }
    flag = 2;
    paging.setPageSize(15);
    paging.setTotalCount(memberManagerService.totlistFlag(flag));
    
    List<MemberManager>  list = memberManagerService.memberAjax(flag,paging);
    
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (MemberManager mm : list) {
      mm.setNcdt(dformat.format(mm.getCdt()));
    }  
    
    Map<String,Object> map = new HashMap<>(); 
    map.put("list", list);
    map.put("paging", paging);
    
    return map;
  }

  @ResponseBody
  @RequestMapping(value="showSup")
  public Map<String,Object> showSup(int flag,String pageNo) throws ParseException {
    Paging paging = new Paging();
    flag = 3;
    if(pageNo != null) {
      paging.setPageNo(Integer.parseInt(pageNo));
    }else if(pageNo == null) {
      paging.setPageNo(0);
    }
    paging.setPageSize(15);
    paging.setTotalCount(memberManagerService.totlistFlag(flag));
    
    List<MemberManager>  list = memberManagerService.memberAjax(flag,paging);
    
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (MemberManager mm : list) {
      mm.setNcdt(dformat.format(mm.getCdt()));
    }  
    
    Map<String,Object> map = new HashMap<>(); 
    map.put("list", list);
    map.put("paging", paging);
    return map;
  }
  @ResponseBody
  @RequestMapping(value="showStop")
  public Map<String,Object> showStop(int flag,String pageNo, Paging paging) throws ParseException {
    flag = 10;
    if(pageNo != null) {
      paging.setPageNo(Integer.parseInt(pageNo));
    }else if(pageNo == null) {
      paging.setPageNo(0);
    }
    paging.setPageSize(15);

    paging.setTotalCount(memberManagerService.totlistFlag(flag));
    
    System.out.println(paging.getTotalCount());
    List<MemberManager>  list = memberManagerService.memberAjax(flag,paging);
    
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (MemberManager mm : list) {
      mm.setNcdt(dformat.format(mm.getCdt()));
    }
    
    
    Map<String,Object> map = new HashMap<>(); 
    map.put("list", list);
    map.put("paging", paging);
    return map;
  }

  @ResponseBody
  @PostMapping(value = "stopMem")
  public void MemStop(String id, int flag) {
    System.out.println(flag);
    memberManagerService.stopMem(id, flag);
  }

  
  
  @ResponseBody
  @RequestMapping("gradleListPagination")
  public Map<String,Object> gradlePagination(int PageNo) {
    Paging paging = new Paging();
    paging.setPageSize(15);
    paging.setTotalCount(memberManagerService.totgradle());
    paging.setPageNo(PageNo);
    List<GradleMember> list = memberManagerService.gradleList(paging);
    
    for (GradleMember gm : list) {
      if(gm.getFlag() == '2') gm.setType("버스커");
      else if(gm.getFlag() == '3') gm.setType("제공자");
    }
    
    Map<String,Object> params = new HashMap<>();
    params.put("list", list);
    params.put("paging", paging);
    return params;
  }
  
}
