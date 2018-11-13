package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.BuskerService;

@Service
public class BuskerServiceImpl implements BuskerService {

    @Autowired  BuskerDao buskerDao;

//    @Override
//    public List<BuskerList> list(int pageNo, int pageSize) {
//      HashMap<String,Object> params = new HashMap<>();
//      params.put("rowNo", (pageNo - 1) * pageSize);
//      params.put("size", pageSize);
//      
//      return buskerlistDao.findAll(params);
//    }
    
    @Override
    public Busker get(int no) {
        return buskerDao.findByNo(no);
    }

@Override
public void add(Busker busker) {
buskerDao.insert(busker);
  
}

  
   
}










