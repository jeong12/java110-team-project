package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.BuskerPromotion;

public interface BuskerPromotionDao {
  List<BuskerPromotion> findAll();
  List<BuskerPromotion> findByCity(String city);
  int add(BuskerPromotion buskerBoard);
  List<BuskerPromotion> findByTeamname(String teamname);
  BuskerPromotion findByBbno(int no);
  List<BuskerPromotion> list();
  BuskerPromotion findbbno(int bbno);
  List<BuskerPromotionComment> comtList(Map<String,Object> params);
  int insertComments(Map<String,Object> params);
  int totCommetList(int bbno);
  int deleteComment(int bcno);
  int findBbno(int bcno);
}
