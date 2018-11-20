package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 9;

    List<Schedule> list = scheduleService.mysslist(pageNo, pageSize);
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
    for (Schedule s : list) {
      s.setNsdt(format.format(s.getSdt()));
      s.setNedt(format.format(s.getEdt()));
      s.setNcdt(dformat.format(s.getCdt()));
    }    
    model.addAttribute("list", list);
  }


  @ResponseBody
  @RequestMapping("chkFlag")
  public List<Schedule> findSuggestsbyflag(
      String flag, @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="9")int pageSize, Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 9;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");

    if(flag.equals("1")||flag.equals("2")) {
      List<Schedule> flist = scheduleService.findSuggestsbyflag(flag, pageNo, pageSize);
      for (Schedule ps : flist) {
        ps.setNsdt(format.format(ps.getSdt()));
        ps.setNedt(format.format(ps.getEdt()));
        ps.setNcdt(dformat.format(ps.getCdt()));
      }
      return flist;    
    }else{
      List<Schedule> flist = scheduleService.mysslist(pageNo, pageSize);
      for (Schedule fs : flist) {
        fs.setNsdt(format.format(fs.getSdt()));
        fs.setNedt(format.format(fs.getEdt()));
        fs.setNcdt(dformat.format(fs.getCdt()));
      }
      return flist;
    }
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
  public Schedule showDetail(String brno, Model model){
  int no = Integer.parseInt(brno);
  Schedule slist = scheduleService.showDatail(no);
  
  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
  SimpleDateFormat hformat = new SimpleDateFormat("HH:mm");
  List<ScheduleTime> stlist = new ArrayList<>();
  for(int i=0;i<slist.getScheduletime().size();i++) {
    ScheduleTime st = new ScheduleTime();
    st.setSnsdt(format.format(slist.getScheduletime().get(i).getSsdt()));
    st.setSnedt(hformat.format(slist.getScheduletime().get(i).getSedt()));
    stlist.add(st);
  }
  slist.setScheduletime(stlist);
  return slist;  
  }
  
  
  @RequestMapping("apply")
  public int applyReqs(String[] reqdates){
    
    int no = 2;
    
    List<String> arr = new ArrayList<>();
    for(int i=0;i<reqdates.length;i++) {
      arr.add(reqdates[i]);
    }
    
    for (String s : arr) {
      System.out.println(s);
    }
    
    return 0;
  }
  
  
  
  
}
