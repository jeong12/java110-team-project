package indiesker.java110.ms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.TotalFeedDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.TotalFeedService;

@Service
public class TotalFeedServiceImpl implements TotalFeedService{

	@Autowired TotalFeedDao totalFeedDao;
	
	@Override
	public List<Busker> findTotalFeed() {
		return totalFeedDao.findTotalFeed();
	}

	@Override
	public List<Busker> SearchByCity(String city) {
		return totalFeedDao.findByCity(city);
	}

	@Override
	public List<Busker> SearchByTeamname(String teamname) {
		return totalFeedDao.findByTeamname(teamname);
	}

	@Override
	public List<Busker> SearchByGenre(String teamgenre) {
		return totalFeedDao.findByGenre(teamgenre);
	}
	
}
