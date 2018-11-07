package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.StageListDao;
import indiesker.java110.ms.domain.StageList;
import indiesker.java110.ms.service.StageListService;

@Service
public class StageListServiceImpl implements StageListService {

    @Autowired  StageListDao stagelistdao;
    
    @Override
    public List<StageList> list(int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
        
        return stagelistdao.findAll(params);
    }
    
   
}










