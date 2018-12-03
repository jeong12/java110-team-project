package indiesker.java110.ms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.TotalFeedDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.TotalFeedService;

@Service
public class TotalFeedServiceImpl implements TotalFeedService{

	@Autowired TotalFeedDao totalFeedDao;
	
	@Override
	public List<Busker> findTotalFeed(String sortType) {
		return totalFeedDao.findTotalFeed(sortType);
	}

	@Override
	public List<Busker> SearchByCity(Map<String, Object> params) {
		return totalFeedDao.findByCity(params);
	}

	@Override
	public List<Busker> SearchByTeamname(Map<String, Object> params) {
		return totalFeedDao.findByTeamname(params);
	}

	@Override
	public List<Busker> SearchByGenre(Map<String, Object> params) {
		return totalFeedDao.findByGenre(params);
	}
	
}
