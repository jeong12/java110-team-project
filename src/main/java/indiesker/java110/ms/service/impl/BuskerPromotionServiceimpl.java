package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerPromotionDao;
import indiesker.java110.ms.domain.BuskerPromotion;
import indiesker.java110.ms.service.BuskerPromotionService;

@Service
public class BuskerPromotionServiceimpl implements BuskerPromotionService {

    @Autowired  BuskerPromotionDao buskerPromotionDao;
    
    @Override
    public List<BuskerPromotion> list(int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
        
        return buskerPromotionDao.findAll(params);
    }
    
   
}










