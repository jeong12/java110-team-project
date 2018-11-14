package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.PerSchedule;

public interface PerScheduleDao {
  List<PerSchedule> findAll(Map<String,Object> params);
  void insert(PerSchedule perschedule);
}
