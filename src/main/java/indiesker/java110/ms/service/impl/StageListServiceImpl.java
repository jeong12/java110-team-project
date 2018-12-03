package indiesker.java110.ms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.StageListDao;
import indiesker.java110.ms.domain.StageList;
import indiesker.java110.ms.service.StageListService;

@Service
public class StageListServiceImpl implements StageListService {

    @Autowired  StageListDao stagelistdao;
    
    @Override
    public List<StageList> list(Map<String, Object> params) {
        return stagelistdao.findAll(params);
    }

	@Override
	public List<StageList> findByName(Map<String, Object> params) {
		return stagelistdao.findByName(params);
	}

	@Override
	public List<StageList> findByLocal(Map<String, Object> params) {
		return stagelistdao.findByLocal(params);
	}

	@Override
	public List<StageList> findByGenre(Map<String, Object> params) {
		return stagelistdao.findByGenre(params);
	}
    
    
}










