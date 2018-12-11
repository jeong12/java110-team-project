package indiesker.java110.ms.service;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.Paging;

public interface BuskerPromotionService {
    List<BuskerPromotion> list();
    List<BuskerPromotion> SearchByCity(Map<String, Object> params);
	List<BuskerPromotion> SearchByTeamname(Map<String, Object> params);
	void add(BuskerPromotion buskerBoard);
	BuskerPromotion get(int bbno);
	List<BuskerPromotionComment> comtList(int bbno, Paging paging);
	int insertComments(int no, int bbno, String comments);
	int totCommetList(int bbno);
	int deleteComment(int bcno);
	int findBbno(int bcno);
	int editbcomt(int bcno, String comment);
    
}
