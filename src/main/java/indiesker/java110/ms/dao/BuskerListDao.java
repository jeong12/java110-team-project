package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerList;

public interface BuskerListDao {
  List<BuskerList> findAll(Map<String,Object> params);
}
