package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.Paging;

public interface BuskerPromotionService {
    List<BuskerPromotion> list();
    List<BuskerPromotion> SearchByCity(String city);
	List<BuskerPromotion> SearchByTeamname(String teamname);
	void add(BuskerPromotion buskerBoard);
	BuskerPromotion get(int bbno);
	List<BuskerPromotionComment> comtList(int bbno, Paging paging);
	int insertComments(int no, int bbno, String comments);
	int totCommetList(int bbno);
	int deleteComment(int bcno);
	int findBbno(int bcno);
    
}
