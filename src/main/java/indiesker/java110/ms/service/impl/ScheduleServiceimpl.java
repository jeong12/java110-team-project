package indiesker.java110.ms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.ScheduleDao;
import indiesker.java110.ms.domain.Schedule;
import indiesker.java110.ms.service.ScheduleService;

@Service
public class ScheduleServiceimpl implements ScheduleService {

    @Autowired  ScheduleDao scheduleDao;
    
    @Override
    public void addSchedule(Schedule schedule) {
      scheduleDao.insertperschedule(schedule);
      
    }
    
    @Override
    public List<Schedule> myperlist(int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
        
        return scheduleDao.findperschedule(params);
    }

    @Override
    public List<Schedule> mybslist(int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      params.put("no", 5);
      return scheduleDao.findMyAllSchedule(params);
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
    public List<Schedule> mysslist(int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);      
      return scheduleDao.findreqschedule(params);
    }

    @Override
    public Schedule myperdetail(int no) {
      return scheduleDao.findbypsno(no);
    }

    @Override
    public Schedule myreqdetail(int no) {
      System.out.println(no);
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
    public List<Schedule> findSuggestsbyflag(String flag,int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("flag", flag);
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize); 
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
    public void removeStageDatesinbuskStag(ArrayList<String> arr) {
      scheduleDao.removeStageDatesinbuskStag(arr);
      
    }

    @Override
    public void removeStageDatesinStagSche(ArrayList<String> arr) {
      scheduleDao.removeStageDatesinStagSche(arr);
    }
    
    @Override
    public int chkremoveStageDates(ArrayList<String> arr, int no) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("nos", arr);
      params.put("no", no);
      return scheduleDao.chkremoveStageDates(params);
    }

    @Override
    public void insertStageDates(List<Schedule> rlist) {
            
      scheduleDao.insertStageDates(rlist);
    }

    @Override
    public int chkinsertDates(List<Schedule> rlist, int no) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("no", no);
      params.put("dates", rlist);
      return scheduleDao.chkinsertDates(params);
    }
    
    @Override
    public void deleteReqSchedule(int no) {
      scheduleDao.buskstagdelete(no);
      scheduleDao.buskreqdelete(no);
    }

    @Override
    public void deletePerSchedule(int no) {
      scheduleDao.perscheduledelete(no);
    }
      
    //개인피드에 들어갈 개인스케줄
    @Override
    public List<Schedule> findFeedPerSchedule(int no) {
      return scheduleDao.findbynoperfeedschedule(no);
    }
    
    //개인피드에 들어갈 확정스케줄
    @Override
    public List<Schedule> findFeedFixSchedule(int no) {
    return scheduleDao.findbynofixfeedschedule(no);
    }

    
}