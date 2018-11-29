package indiesker.java110.ms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Schedule;

public interface ScheduleDao {
  List<Schedule> findperschedule(Map<String,Object> params);
  void insertperschedule(Schedule perschedule);
  List<Schedule> findMyAllSchedule(Map<String,Object> params);
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
  void editperschedule(Schedule schedule);
  List<Schedule> showScedule();
  List<Integer> showSsnos(int no);
  List<Schedule> findPossibleStages(Map<String,Object> params);
  int ApplyStagesinBuskreq(Map<String,Object> params);
  List<Schedule> findMyAllSchedulebyflag(Map<String,Object> params);
  int ApplyStagesinBuskstag(Map<String,Object> params);
  int totFindreqschedule(int no);
  int totfindSuggestsbyflag(int no);
}
