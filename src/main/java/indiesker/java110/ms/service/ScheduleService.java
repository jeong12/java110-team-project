package indiesker.java110.ms.service;

import java.util.ArrayList;
import java.util.List;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleService {
    List<Schedule> myperlist(int bno, int pageNo, int pageSize);
    void addSchedule(Schedule schedule);
    List<Schedule> mybslist(int bno, int pageNo, int pageSize);
    List<Schedule> findbydate(int bno, String date);
    List<Schedule> findbyflag(String flag, int pageNo, int pageSize);
    void addStageSchedule(Schedule schedule);
    List<Schedule> mysslist(int no, Paging paging);
    Schedule myperdetail(int no);
    Schedule myreqdetail(int no);
    List<Schedule> chkStageDate(int no, String date);
    List<Schedule> findSuggestsbyflag(int no, int flag, Paging paging);
    List<Schedule> findunableSchedule(String date, int no);
    int removeStageDates(ArrayList<String> arr);
    int insertStageDates(List<Schedule> rlist);
    int deleteReqSchedule(int no);
    int deletePerSchedule(int no);
    List<Schedule> findFeedPerSchedule(int no);
    List<Schedule> findFeedFixSchedule(int no);
    Schedule showDatail(int no);
    List<Schedule> findTodaySchedule();
    List<Schedule> findTodaySchedule(String city);
    int consentapply(ArrayList<Integer> list);
    int refuseapply(ArrayList<Integer> list);
    List<Schedule> showpast(int no, String date);
    int checkperschedule(String sdt, String edt, int no);
    int checkreqschedule(String sdt, String edt, int no);
    int editperschedule(Schedule schedule);
    List<Schedule> showScedule(Paging paging);
    List<Integer> showSsnos(int no);
    List<Schedule> findPossibleStages(int no, String date);
    int ApplyStages(int no, String cont, String count, ArrayList<Integer>ssno);
    String weekOfAvi();
    List<Schedule> mybslistbyflag(int flag, int bno,int pageNo, int pageSize);
    int checkeditperschedule(String sdt, String edt, String nsdt, String nedt, int no);
    int checkeditreqschedule(String sdt, String edt, String nsdt, String nedt, int no);
    List<Schedule> searchScehdule(String type, String keyword, String date,Paging paging);
    List<Schedule> findoverdue(int no, Paging paging);
    int totFindreqschedule(int no);
    int totfindSuggestsbyflag(int no, int flag);
    int totfindoverdue(int no);
    int refuseAll(int no);
    int totSchedule();
    int buskperscheduleCnt(int bno);
    int buskreqscheduleCnt(int bno);
    int buskbyflagscheduleCnt(int flag, int bno);
    List<Schedule> findMyAllSchedule(int bno, int pageNo, int pageSize);
    int findMyAllScheduleCnt(int bno);
    List<Schedule> findAllSchedule();//test용
    List<Schedule> findSearchAllSchedule(String keyword1, String keyword2);//test용
    List<Schedule> findTodayAllSchedule();
    List<Schedule> findTodaySearchAllSchedule(String keyword, String keyword2);
    int totsearchScehdule(String type, String keyword, String date);
    List<Schedule> findbywordSearchAllSchedule(String keyword);
    int chkRemovePossible(int sno);
}
