package indiesker.java110.ms.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.ScheduleTime;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/myss")
public class SupporterScheduleController {

  @Autowired ScheduleService scheduleService;
  @Autowired ServletContext sc;

  public SupporterScheduleController(ScheduleService scheduleService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }


  @GetMapping("main")
  public void main (Model model,HttpSession session) throws ParseException {
    
/*    Member member = (Member)session.getAttribute("loginUser");
    int sno = member.getNo();*/
    
    int sno = 2;
    int flag=1;
    Paging paging1 = new Paging();
    Paging paging2 = new Paging();
    Paging paging3 = new Paging();
    Paging paging4 = new Paging();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat cformat = new SimpleDateFormat("yyyyMMdd");
    
    int today = Integer.parseInt(cformat.format(new Date()));
    paging1.setPageSize(10);
    paging2.setPageSize(10);
    paging3.setPageSize(10);
    paging4.setPageSize(10);

    // 전체
    paging1.setTotalCount(scheduleService.totFindreqschedule(sno));
    List<Schedule> list = scheduleService.mysslist(sno,paging1);
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
      if(today >=Integer.parseInt(cformat.format(s.getSdt())) ) {
        if(s.getFlag() == '1') s.setFlag('3');
      }
    } 
    model.addAttribute("list", list);
    model.addAttribute("listpaging",paging1);
    
    // 신청중
    paging2.setTotalCount(scheduleService.totfindSuggestsbyflag(sno, flag));
    List<Schedule> flist = scheduleService.findSuggestsbyflag(sno, flag, paging2);
    for (Schedule s : flist) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
      if(today >=Integer.parseInt(cformat.format(s.getSdt())) ) {
        if(s.getFlag() == '1') s.setFlag('3');
      }
    }
    model.addAttribute("flist", flist);
    model.addAttribute("flistpaging", paging2);
    
    // 기한 만료
    paging3.setTotalCount(scheduleService.totfindoverdue(sno));
    List<Schedule> tlist = scheduleService.findoverdue(sno, paging3);
    for (Schedule s : tlist) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
      s.setFlag('3');
    } 
    model.addAttribute("tlist", tlist);
    model.addAttribute("tlistpaging",paging3);
    
    
    // 완료
    flag = 2;
    paging4.setTotalCount(scheduleService.totfindSuggestsbyflag(sno, flag));
    List<Schedule> slist = scheduleService.findSuggestsbyflag(sno, flag, paging4);
    for (Schedule s : slist) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
    } 
    model.addAttribute("slist",slist);
    model.addAttribute("slistpaging",paging4);
  }


  // 삭제 가능한 시간
  @ResponseBody
  @RequestMapping("showDate")
  public List<Schedule> findunableSchedule(String date,Model model, HttpSession session){

    /*    Member member = (Member)session.getAttribute("loginUser");
    int no = member.getNo();*/
    
    int no = 2;
    List<Schedule> slist = scheduleService.findunableSchedule(date, no);
    SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    for (Schedule ps : slist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }
    return slist;
  }


  // 신청 가능한 시간
  @ResponseBody
  @RequestMapping("showPossibleDate")
  public List<String> findableSchedule(String date,Model model, HttpSession session){

    /*    Member member = (Member)session.getAttribute("loginUser");
    int no = member.getNo();*/
    
    int no = 2;
    List<String> list = new ArrayList<>();
    List<Schedule> slist = scheduleService.findunableSchedule(date, no);

    // String 으로 포맷 바꿔줌
    SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    for (Schedule ps : slist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }

    // 일단 24개 다 넣음
    for(int i=0;i<24;i++) {
      if(i<9) 
        list.add("0"+Integer.toString(i)+":00 ~ 0"+Integer.toString(i+1)+":00");
      else if(i==9)
        list.add("0"+Integer.toString(i)+":00 ~ "+Integer.toString(i+1)+":00");
      else if(i==23)
        list.add(Integer.toString(i)+":00 ~ " + "00:00");
      else 
        list.add(Integer.toString(i)+":00 ~ " + Integer.toString(i+1)+":00");
    }    

    // 데이터 값을 삭제
    for(int i=0;i<list.size();i++) {
      for(Schedule ps : slist) {
        if(list.get(i).substring(0,5).equals(ps.getNsdt())) {
          list.remove(i);
        }
      }
    }
    return list;
  }



  @ResponseBody
  @RequestMapping("removeDate")
  public int removeStageDate(String[] stagedate, Model model){
    
    ArrayList<String> arr = new ArrayList<>();

    for(int i=0;i<stagedate.length;i++) {
      arr.add(stagedate[i]);
    }

    return scheduleService.removeStageDates(arr);
  }



  @ResponseBody
  @RequestMapping("insertDate")
  public int insertStageDate(String[] insertDate, String day, Model model, HttpSession session){
    int size = insertDate.length;
    List<Schedule> rlist = new ArrayList<>();
    
    /*    Member member = (Member)session.getAttribute("loginUser");
    int sno = member.getNo();*/
    
    int no=2;

    for(int i=0;i<size;i++) {
      Schedule sche = new Schedule();
      Supporter sup = new Supporter();
      sche.setNsdt(day+" "+insertDate[i].substring(0,5));
      sche.setNedt(day+" "+insertDate[i].substring(8));
      sup.setNo(no);
      sche.setSupporter(sup);
      rlist.add(sche);
    }    
    return scheduleService.insertStageDates(rlist);
  }


  @ResponseBody
  @RequestMapping("showInfo")
  public Schedule showDetail(String brno, Model model)throws Exception{
    int no = Integer.parseInt(brno);
    Schedule slist = scheduleService.showDatail(no);
     SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
     SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
     SimpleDateFormat cformat = new SimpleDateFormat("yyyyMMdd");
     List<ScheduleTime> stlist = new ArrayList<>();
     
     int today = Integer.parseInt(cformat.format(new Date()));
     

      for(int i=0;i<slist.getScheduletime().size();i++) {
        ScheduleTime st = new ScheduleTime();
        st.setSnsdt(format.format(slist.getScheduletime().get(i).getSsdt()));
        st.setSnedt(hformat.format(slist.getScheduletime().get(i).getSedt()));
        st.setSssno(slist.getScheduletime().get(i).getSssno());
        st.setFlag(slist.getFlag());
        if(slist.getFlag() == '1') {
          if(today>=Integer.parseInt(cformat.format(slist.getScheduletime().get(i).getSsdt()))) {
            slist.setFlag('3');
          }
        }
        stlist.add(st);
      }
      slist.setScheduletime(stlist);
      return slist;  
  }


  @RequestMapping("consent")
  public String applyReqs(String[] reqdates, String brno){

    List<Integer> ssnos = scheduleService.showSsnos(Integer.parseInt(brno));
    List<Integer> todelete = new ArrayList<>();
    ArrayList<Integer> reqs = new ArrayList<>();
    
    for(int i=0;i<reqdates.length;i++) {
      reqs.add(Integer.parseInt(reqdates[i]));
    }
    scheduleService.consentapply(reqs);
    
    for(int i=0;i<ssnos.size();i++) {
      for(int j=0;j<reqdates.length;j++) {
        if(ssnos.get(i) != Integer.parseInt(reqdates[j])) 
          todelete.add(ssnos.get(i));
        }
      }
    
    ArrayList<Integer> td = new ArrayList<Integer>();
    for (int i = 0; i < todelete.size(); i++) {
        if (!td.contains(todelete.get(i))) {
          td.add(todelete.get(i));
        }
    }

    scheduleService.refuseapply(td);
    return "redirect:main";
  }

  
  //paging 처리
  @ResponseBody
  @RequestMapping("page")
  public List<Schedule> paging(String type,String pageNo, Paging paging, HttpSession session){
    
    /*    Member member = (Member)session.getAttribute("loginUser");
    int sno = member.getNo();*/
    int sno = 2;
    paging.setPageNo(Integer.parseInt(pageNo));
    paging.setPageSize(10);
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat cformat = new SimpleDateFormat("yyyyMMdd");
    
    int today = Integer.parseInt(cformat.format(new Date()));

    if(type.equals("list")) {
      paging.setTotalCount(scheduleService.totFindreqschedule(sno));
      List<Schedule> list = scheduleService.mysslist(sno,paging);
      for (Schedule s : list) {
        s.setNsdt(format.format(s.getSdt()));
        s.setNedt(hformat.format(s.getEdt()));
        s.setNcdt(dformat.format(s.getCdt()));
        if(today >=Integer.parseInt(cformat.format(s.getSdt())) ) {
          if(s.getFlag() == '1') s.setFlag('3');
        }
      }   
      return list;
    }else if(type.equals("flist")) {
      int flag = 1;
      paging.setTotalCount(scheduleService.totfindSuggestsbyflag(sno, flag));
      List<Schedule> flist = scheduleService.findSuggestsbyflag(sno, flag, paging);
      return flist;
    }else if(type.equals("slist")) {
      int flag = 2;
      paging.setTotalCount(scheduleService.totfindSuggestsbyflag(sno, flag));
      List<Schedule> slist = scheduleService.findSuggestsbyflag(sno, flag, paging);
      for (Schedule s : slist) {
        s.setNsdt(format.format(s.getSdt()));
        s.setNedt(hformat.format(s.getEdt()));
        s.setNcdt(dformat.format(s.getCdt()));
      }
      return slist;
    }else if(type.equals("tlist")) {
      paging.setTotalCount(scheduleService.totfindoverdue(sno));
      List<Schedule> tlist = scheduleService.findoverdue(sno, paging);
      for (Schedule s : tlist) {
        s.setNsdt(format.format(s.getSdt()));
        s.setNedt(hformat.format(s.getEdt()));
        s.setNcdt(dformat.format(s.getCdt()));
        s.setFlag('3');
      }
      return tlist;
    }
    return null;
  }



}
