package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerBoardMainDao;
import indiesker.java110.ms.domain.BuskerBoardMain;
import indiesker.java110.ms.service.BuskerBoardMainService;

@Service
public class BuskerBoardMainIServiceImpl implements BuskerBoardMainService{
  
  @Autowired BuskerBoardMainDao buskerBoardMainDao;
  
  @Override
  public List<BuskerBoardMain> list(int pageNo, int pageSize) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("rowNo", (pageNo - 1) * pageSize);
    params.put("size", pageSize);
    
    return buskerBoardMainDao.findAll(params);
  }
  
  
  
}
