package indiesker.java110.ms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleDao {
  List<Schedule> findperschedule(Map<String,Object> params); // 스케줄
  void insertperschedule(Schedule perschedule);
  List<Schedule> findMyReqSchedule(Map<String,Object> params); // 스케줄
  List<Schedule> findbydate(Map<String,Object> params);
  List<Schedule> findbyflag(Map<String,Object> params);  
  void insertstageschedule(Schedule schedule);
  List<Schedule> findreqschedule(Map<String,Object> params);
  List<Schedule> findunableSchedule(Map<String,Object> params);
  Schedule findbybrno(int no);
  Schedule findbypsno(int no);
  List<Schedule> findSuggestsbyflag(Map<String,Object> params);
  int removeStageDatesinbuskStag(ArrayList<String> arr);
  int removeStageDatesinStagSche(ArrayList<String> arr);
  int insertStageDates(List<Schedule> list);
  int buskstagdelete(int no);
  int buskreqdelete(int no);
  int perscheduledelete(int no);
  List<Schedule> findbynoperfeedschedule(int no);
  List<Schedule> findbynofixfeedschedule(int no);
  Schedule showDatail(int no);
  List<Schedule> findTodaySchedule();
  List<Schedule> findTodaySchedule(String city);
  int consentapply(ArrayList<Integer> list);
  int refuseapply(ArrayList<Integer> list);
  List<Schedule> showpast(Map<String,Object> params);
  List<Schedule> findAll(Map<String,Object> params);
  int checkperschedule(Map<String, Object> params);
  int checkreqschedule(Map<String, Object> params);
  int editperschedule(Schedule schedule);
  List<Schedule> showScedule(Map<String,Object> params);
  List<Integer> showSsnos(int no);
  List<Schedule> findPossibleStages(Map<String,Object> params);
  int ApplyStagesinBuskreq(Map<String,Object> params);
  List<Schedule> findMyAllSchedulebyflag(Map<String,Object> params); // 스케줄
  int ApplyStagesinBuskstag(Map<String,Object> params);
  int totFindreqschedule(int no);
  int totfindSuggestsbyflag(Map<String, Object> params);
  int checkeditperschedule(Map<String, Object> params);
  int checkeditreqschedule(Map<String, Object> params); 
  List<Schedule> searchSchedule(Map<String,Object> params);
  List<Schedule> findoverdue(Map<String,Object> params);
  int totfindoverdue(int no);
  int refuseAllinReq(int no);
  int refuseAllinBusk(int no);
  int totSchedule();
  int findperschedulecnt(int bno);
  int findMyReqSchedulecnt(int bno);
  int findMyAllSchedulebyflagcnt(Map<String,Object> params);
  List<Schedule> findMyAllSchedule(Map<String,Object> params);
  int findMyAllSchedulecnt(int bno);
  List<Schedule> findAllSchedule();//Test용입니다.
  List<Schedule> findSearchAllSchedule(Map<String,Object> params);//Test용입니다.
  List<Schedule> findTodayAllSchedule();
  List<Schedule> findTodaySearchSchedule(Map<String,Object> params);
  int totsearchSchedule(Map<String,Object> params);
  List<Schedule> findbywordSearchAllSchedule(String keyword);
  
}
