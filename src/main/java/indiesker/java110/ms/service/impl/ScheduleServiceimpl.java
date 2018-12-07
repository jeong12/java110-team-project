package indiesker.java110.ms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.ScheduleDao;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.ScheduleService;

@Service
public class ScheduleServiceimpl implements ScheduleService {

    @Autowired  ScheduleDao scheduleDao;    
    @Transactional(transactionManager="transactionManager",   
                   propagation=Propagation.REQUIRED,
                   rollbackFor=Exception.class)
    
    
    @Override
    public void addSchedule(Schedule schedule) {
      scheduleDao.insertperschedule(schedule);
      
    }
    
    @Override
    public List<Schedule> myperlist(int bno, int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("bno", bno);
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      
        return scheduleDao.findperschedule(params);
    }

    @Override
    public List<Schedule> mybslist(int bno, int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("bno", bno);
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      return scheduleDao.findMyReqSchedule(params);
    }
    
    

    @Override
    public List<Schedule> findbydate(String no, String date) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("bno", no);
      params.put("date", date);
      return scheduleDao.findbydate(params);
    }

    @Override
    public List<Schedule> findbyflag(String flag, int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      params.put("flag", flag);
      return scheduleDao.findbyflag(params);
    }

    @Override
    public void addStageSchedule(Schedule schedule) {
      scheduleDao.insertstageschedule(schedule);      
    }

    @Override
    public List<Schedule> mysslist(int no, Paging paging) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("paging", paging);
      return scheduleDao.findreqschedule(params);
    }

    @Override
    public Schedule myperdetail(int no) {
      return scheduleDao.findbypsno(no);
    }

    @Override
    public Schedule myreqdetail(int no) {
      return scheduleDao.findbybrno(no);
    }
    
    @Override
    public List<Schedule> chkStageDate(int no, String date) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("date", date);
      return scheduleDao.findunableSchedule(params);
    }

    @Override
    public List<Schedule> findSuggestsbyflag(int no, int flag, Paging paging) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("flag", flag);
      params.put("paging", paging);
      return scheduleDao.findSuggestsbyflag(params);
    }

    @Override
    public List<Schedule> findunableSchedule(String date, int no) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("date", date);
      return scheduleDao.findunableSchedule(params);
    }

    @Override
    public int removeStageDates(ArrayList<String> arr) {
      scheduleDao.removeStageDatesinbuskStag(arr);
      return scheduleDao.removeStageDatesinStagSche(arr);
    }
    
    @Override
    public int insertStageDates(List<Schedule> rlist) {
      return scheduleDao.insertStageDates(rlist);
    }
    
    @Override
    public int deleteReqSchedule(int no) {
      scheduleDao.buskstagdelete(no);
      return scheduleDao.buskreqdelete(no);
    }

    @Override
    public int deletePerSchedule(int no) {
      return scheduleDao.perscheduledelete(no);
    }
      
    //개인피드에 들어갈 개인스케줄
    @Override
    public List<Schedule> findFeedPerSchedule(int no) {
      return scheduleDao.findbynoperfeedschedule(no);
    }
    
    //개인피드에 들어갈 확정스케줄
    @Override
    public List<Schedule> findFeedFixSchedule(int no) {
    Map<String, Object> params=new HashMap<>(); 
      int sno = scheduleDao.checkperschedule(params);
      System.out.println(sno);
    return scheduleDao.findbynofixfeedschedule(no);
    }

    @Override
    public Schedule showDatail(int no) {
      return scheduleDao.showDatail(no);
    }

    @Override
    public List<Schedule> findTodaySchedule() {
      return scheduleDao.findTodaySchedule();
    }

    @Override
    public int consentapply(ArrayList<Integer> list) {
      return scheduleDao.consentapply(list);
    }

    @Override
    public int refuseapply(ArrayList<Integer> list) {
    return scheduleDao.refuseapply(list);
    }
    
    @Override
    public List<Schedule> showpast(int no, String date) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("no", no);
      params.put("date", date);
    return scheduleDao.showpast(params);
    }

    @Override
    public List<Schedule> findTodaySchedule(String city) {
      return scheduleDao.findTodaySchedule(city);
    }
    
      @Override
    public List<Schedule> showScedule(Paging paging) {
     Map<String,Object> params = new HashMap<>();
     params.put("paging", paging);
    return scheduleDao.showScedule(params);
    }
    
    @Override
    public List<Integer> showSsnos(int no) {
    return scheduleDao.showSsnos(no);
    }
    
    public int checkperschedule(String sdt, String edt, int no) {
      Map<String, Object> params=new HashMap<>();
      params.put("sdt", sdt);
      params.put("edt", edt);
      params.put("no", 5);
      
      return scheduleDao.checkperschedule(params);
    }
    
    @Override
    public int checkreqschedule(String sdt, String edt, int no) {
      Map<String, Object> params=new HashMap<>();
      params.put("sdt", sdt);
      params.put("edt", edt);
      params.put("no", 5);
      
      return scheduleDao.checkreqschedule(params);
    }

    @Override
    public int editperschedule(Schedule schedule) {
      int no =scheduleDao.editperschedule(schedule);
      return 1;
      
    }

    @Override
    public List<Schedule> findPossibleStages(int no, String date) {
      Map<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("date", date);      
    return scheduleDao.findPossibleStages(params);
    }
    
    @Override
    public int ApplyStages(int no, String cont, String count,ArrayList<Integer>ssno) {
      Map<String,Object> params = new HashMap<>();
      params.put("bno", no);
      params.put("cont", cont);
      params.put("count", count);
      scheduleDao.ApplyStagesinBuskreq(params);
      int brno = (int) params.get("brno");
      params.put("brno", brno);
      params.put("list", ssno);
      return scheduleDao.ApplyStagesinBuskstag(params);
    }

    public List<Schedule> mybslistbyflag(int flag, int bno, int pageNo, int pageSize) {
      Map<String,Object> params = new HashMap<>();
      params.put("flag", flag);
      params.put("bno", bno);
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      return scheduleDao.findMyAllSchedulebyflag(params);
    }
    
    // 통계 관련
    @Override
    @Scheduled(fixedDelay=100)
    public String weekOfAvi() {
      return "test";
    }

    @Override
    public int checkeditperschedule(String sdt, String edt, String nsdt, String nedt, int no) {
      Map<String, Object> params=new HashMap<>();
      params.put("sdt", sdt);
      params.put("edt", edt);
      params.put("nsdt", nsdt);
      params.put("nedt", nedt);
      params.put("no", no);
      
      return scheduleDao.checkeditperschedule(params);
    }

    @Override
    public int checkeditreqschedule(String sdt, String edt, String nsdt, String nedt, int no) {
      Map<String, Object> params=new HashMap<>();
      params.put("sdt", sdt);
      params.put("edt", edt);
      params.put("nsdt", nsdt);
      params.put("nedt", nedt);
      params.put("no", no);
      
      return scheduleDao.checkeditreqschedule(params);
    }
    
    @Override
    public List<Schedule> searchScehdule(String type, String keyword, String date) {
      Map<String,Object> params = new HashMap<>();
      params.put("type", type);
      params.put("keyword", keyword);
      params.put("date", date);
    return scheduleDao.searchSchedule(params);
    }
    
    @Override
    public List<Schedule> findoverdue(int no, Paging paging) {
      Map<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("paging", paging);
    return scheduleDao.findoverdue(params);
    }
    
    @Override
    public int totFindreqschedule(int no) {
    return scheduleDao.totFindreqschedule(no);
    }
    
    @Override
    public int totfindSuggestsbyflag(int no, int flag) {
      Map<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("flag", flag);
      return scheduleDao.totfindSuggestsbyflag(params);
    }
    
    @Override
    public int totfindoverdue(int no) {
    return scheduleDao.totfindoverdue(no);
    }
    
    @Override
    public int refuseAll(int no) {
      scheduleDao.refuseAllinBusk(no);
      return scheduleDao.refuseAllinReq(no);
    }
    public int totSchedule() {
    return scheduleDao.totSchedule();
    }

    @Override
    public int buskperscheduleCnt(int bno) {
      return scheduleDao.findperschedulecnt(bno);
    }

    @Override
    public int buskreqscheduleCnt(int bno) {
      return scheduleDao.findMyReqSchedulecnt(bno);
    }

    @Override
    public int buskbyflagscheduleCnt(int flag, int bno) {
      Map<String,Object> params = new HashMap<>();
      params.put("bno", bno);
      params.put("flag", flag);
      return scheduleDao.findMyAllSchedulebyflagcnt(params);
    }

    @Override
    public List<Schedule> findMyAllSchedule(int bno, int pageNo, int pageSize) {
      Map<String,Object> params = new HashMap<>();
      params.put("bno", bno);
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      return scheduleDao.findMyAllSchedule(params);
    }

    @Override
    public int findMyAllScheduleCnt(int bno) {
      System.out.println(bno);
      return scheduleDao.findMyAllSchedulecnt(bno);
    }
}