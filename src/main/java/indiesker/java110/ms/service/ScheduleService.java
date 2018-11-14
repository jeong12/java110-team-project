package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleService {
    List<Schedule> myperlist(int pageNo, int pageSize);
    void addSchedule(Schedule perschedule);
    List<Schedule> mybslist(int pageNo, int pageSize);
    List<Schedule> findbydate(String no, String date);
    List<Schedule> findbyflag(String flag, int pageNo, int pageSize);
}
