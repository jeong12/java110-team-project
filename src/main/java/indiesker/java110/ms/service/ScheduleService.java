package indiesker.java110.ms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleService {
    List<Schedule> myperlist(int pageNo, int pageSize);
    void addSchedule(Schedule schedule);
    List<Schedule> mybslist(int pageNo, int pageSize);
    List<Schedule> findbydate(String no, String date);
    List<Schedule> findbyflag(String flag, int pageNo, int pageSize);
    void addStageSchedule(Schedule schedule);
    List<Schedule> mysslist(int pageNo, int PageSize);
    Schedule myperdetail(int no);
    Schedule myreqdetail(int no);
    List<Schedule> chkStageDate(int no, String date);
    List<Schedule> findSuggestsbyflag(String flag, int pageNo, int pageSize);
    List<Schedule> findunableSchedule(String date, int no);
    void removeStageDatesinbuskStag(ArrayList<String> arr);
    void removeStageDatesinStagSche(ArrayList<String> arr);
    int chkremoveStageDates(ArrayList<String> arr);
    void insertStageDates(List<Schedule> rlist);
    int chkinsertDates(List<Schedule> rlist);
    void deleteReqSchedule(int no);
    void deletePerSchedule(int no);
    List<Schedule> findFeedPerSchedule(int no);
    List<Schedule> findFeedFixSchedule(int no);
}
