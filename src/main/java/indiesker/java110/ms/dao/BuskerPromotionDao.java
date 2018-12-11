package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.BuskerPromotion;

public interface BuskerPromotionDao {
  List<BuskerPromotion> findAll();
  List<BuskerPromotion> findByCity(Map<String, Object> params);
  List<BuskerPromotion> findByTeamname(Map<String, Object> params);
  int add(BuskerPromotion buskerBoard);
  BuskerPromotion findByBbno(int no);
  List<BuskerPromotion> list();
  BuskerPromotion findbbno(int bbno);
  List<BuskerPromotionComment> comtList(Map<String,Object> params);
  int insertComments(Map<String,Object> params);
  int totCommetList(int bbno);
  int deleteComment(int bcno);
  int findBbno(int bcno);
  int bcContentEdit(Map<String,Object> params);
}
