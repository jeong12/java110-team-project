package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerListDao;
import indiesker.java110.ms.domain.BuskerList;
import indiesker.java110.ms.service.BuskerListService;

@Service
public class BuskerListServiceimpl implements BuskerListService {

    @Autowired  BuskerListDao buskerlistDao;

    @Override
    public List<BuskerList> list(int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      
      return buskerlistDao.findAll(params);
    }
    
   
    
  
   
}










