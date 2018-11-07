package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerScheduleDao;
import indiesker.java110.ms.domain.BuskerSchedule;
import indiesker.java110.ms.service.BuskerScheduleService;

@Service
public class BuskerScheduleServiceimpl implements BuskerScheduleService {

    @Autowired  BuskerScheduleDao buskerscheduleDao;
    
    @Override
    public List<BuskerSchedule> list(int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
        
        return buskerscheduleDao.findAll(params);
    }
    
   
}










