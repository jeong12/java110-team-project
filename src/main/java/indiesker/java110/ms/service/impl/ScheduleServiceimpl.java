package indiesker.java110.ms.service.impl;

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
      return scheduleDao.findbybrno(no);
    }
    
    
   
}










