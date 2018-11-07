package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerPromotion;

public interface BuskerPromotionDao {
  List<BuskerPromotion> findAll(Map<String,Object> params);

}
