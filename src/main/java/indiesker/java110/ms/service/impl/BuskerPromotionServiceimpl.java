package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerPromotionDao;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.domain.BuskerPromotionComment;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.service.BuskerPromotionService;

@Service
public class BuskerPromotionServiceimpl implements BuskerPromotionService {

    @Autowired  BuskerPromotionDao buskerPromotionDao;
    
    @Override
    public List<BuskerPromotion> list() {
        return buskerPromotionDao.findAll();
    }
	
	@Override
	public List<BuskerPromotion> SearchByCity(Map<String, Object> params) {
		return buskerPromotionDao.findByCity(params);
	}
	
	@Override
	public List<BuskerPromotion> SearchByTeamname(Map<String, Object> params) {
		return buskerPromotionDao.findByTeamname(params);
	}
	
	@Override
	  public void add(BuskerPromotion buskerBoard) {
	  buskerPromotionDao.add(buskerBoard);
	    
	  }
	  
	  @Override
	  public BuskerPromotion get(int bbno) {
	    return buskerPromotionDao.findbbno(bbno);
	  }

	  @Override
	  public List<BuskerPromotionComment> comtList(int bbno, Paging paging) {
	    HashMap<String,Object> params = new HashMap<>();
	    params.put("no",bbno);
	    params.put("paging", paging);
	    List<BuskerPromotionComment> list = buskerPromotionDao.comtList(params);
	    System.out.println(list);
	    return list;
	  }

	  @Override
	  public int insertComments(int no, int bbno, String comments) {
	    HashMap<String,Object> params = new HashMap<>();
	    params.put("no", no);
	    params.put("bbno", bbno);
	    params.put("comments", comments);
	    return buskerPromotionDao.insertComments(params);
	  }
	  
	  @Override
	  public int totCommetList(int bbno) {
	  return buskerPromotionDao.totCommetList(bbno);
	  }
	  
	  @Override
	  public int deleteComment(int bcno) {
	  return buskerPromotionDao.deleteComment(bcno);
	  }
	  
	  @Override
	  public int findBbno(int bcno) {
	  Integer bbno = buskerPromotionDao.findBbno(bcno);
	  System.out.println("bbno"+bbno);
	  return bbno;
	  
	  }

    @Override
    public int editbcomt(int bcno, String comment) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("bcno", bcno);
      params.put("comment", comment);
      return buskerPromotionDao.bcContentEdit(params);
    }
    
    
    @Override
    public int deletePage(int bbno) {
    return buskerPromotionDao.deletePage(bbno);
    }

    
    @Override
    public int findBno(int bbno) {
    return buskerPromotionDao.findBno(bbno);
    }
    

    @Override
    public int editPge(BuskerPromotion bp) {
    return buskerPromotionDao.updatePromotion(bp);
    }
    
    
    @Override
    public BuskerPromotion toEdit(int bbno) {
    return buskerPromotionDao.toEdit(bbno);
    }
    
    @Override
    public int deleteCommetFor(int bbno) {
    return buskerPromotionDao.deleteCommentFor(bbno);
    }
    
}










