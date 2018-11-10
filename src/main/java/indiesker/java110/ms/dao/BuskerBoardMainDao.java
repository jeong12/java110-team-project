package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerBoardMain;

public interface BuskerBoardMainDao {
  List<BuskerBoardMain> findAll(Map<String,Object> params);
}
