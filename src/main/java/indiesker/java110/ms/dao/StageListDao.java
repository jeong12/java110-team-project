package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;

import indiesker.java110.ms.domain.StageList;

public interface StageListDao {
  
  List<StageList> findAll(Map<String, Object> params);
  List<StageList> findByName(Map<String, Object> params);
  List<StageList> findByLocal(Map<String, Object> params);
  List<StageList> findByGenre(Map<String, Object> params);
}
