package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.domain.ScheduleTime;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.ScheduleService;

@Controller
@RequestMapping("/myss")
public class SupporterScheduleController {

  ScheduleService scheduleService;
  ServletContext sc;


  public SupporterScheduleController(ScheduleService scheduleService,
      ServletContext sc) {
    this.scheduleService = scheduleService;
    this.sc = sc;
  }


  @GetMapping("main")
  public void main(
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    int sno =2;
    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 9;
    
    int flag=1;
    List<Schedule> list = scheduleService.mysslist(sno, pageNo, pageSize);
    List<Schedule> flist = scheduleService.findSuggestsbyflag(sno, flag, pageNo, pageSize);
    flag = 2;
    List<Schedule> slist = scheduleService.findSuggestsbyflag(sno, flag, pageNo, pageSize);
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
    }   
    for (Schedule s : flist) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
    } 
    for (Schedule s : slist) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(hformat.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
    } 
    model.addAttribute("list", list);
    model.addAttribute("flist", flist);
    model.addAttribute("slist",slist);
  }


  @ResponseBody
  @RequestMapping("showDate")
  public List<Schedule> findunableSchedule(String date,Model model){

    int no = 2;
    List<Schedule> slist = scheduleService.findunableSchedule(date, no);
    SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    for (Schedule ps : slist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }
    return slist;
  }


  @ResponseBody
  @RequestMapping("showPossibleDate")
  public List<String> findableSchedule(String date,Model model){

    int no = 2;
    List<String> list = new ArrayList<>();
    List<Schedule> rlist = new ArrayList<>();
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

    System.out.println(list);
    return list;
  }



  @ResponseBody
  @RequestMapping("removeDate")
  public int removeStageDate(String[] stagedate, Model model){
    int no = 2;
    ArrayList<String> arr = new ArrayList<>();

    for(int i=0;i<stagedate.length;i++) {
      arr.add(stagedate[i]);
    }

    return scheduleService.removeStageDates(arr);
  }



  @ResponseBody
  @RequestMapping("insertDate")
  public int insertStageDate(String[] insertDate, String day, Model model){
    int size = insertDate.length;
    List<Schedule> rlist = new ArrayList<>();
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
      SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
      List<ScheduleTime> stlist = new ArrayList<>();
      
      Date td = new Date();
      
      for(int i=0;i<slist.getScheduletime().size();i++) {
        ScheduleTime st = new ScheduleTime();
        st.setSnsdt(format.format(slist.getScheduletime().get(i).getSsdt()));
        st.setSnedt(hformat.format(slist.getScheduletime().get(i).getSedt()));
        st.setSssno(slist.getScheduletime().get(i).getSssno());
        Date std = dformat.parse(dformat.format(slist.getScheduletime().get(i).getSsdt()));
        if(std.getTime()-td.getTime()<0) {
          st.setFlag(3);
        }else {
          st.setFlag((slist.getScheduletime().get(i).getFlag()));
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




}
