package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.BuskerPromotion;

public interface BuskerPromotionDao {
  List<BuskerPromotion> findAll();
  List<BuskerPromotion> findByCity(String city);
}
