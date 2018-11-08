package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.PerScheduleDao;
import indiesker.java110.ms.domain.PerSchedule;
import indiesker.java110.ms.service.PerScheduleService;

@Service
public class PerScheduleServiceimpl implements PerScheduleService {

    @Autowired  PerScheduleDao perscheduleDao;
    
    @Override
    public List<PerSchedule> list(int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
        
        return perscheduleDao.findAll(params);
    }
    
   
}










