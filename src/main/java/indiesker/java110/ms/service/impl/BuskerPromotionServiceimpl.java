package indiesker.java110.ms.service.impl;

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
    public List<BuskerPromotion> list() {
        return buskerPromotionDao.findAll();
    }

    @Override
    public List<BuskerPromotion> SearchByCity(String city) {
      return buskerPromotionDao.findByCity(city);
    }

}










