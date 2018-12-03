package indiesker.java110.ms.service;

import java.util.List;
import java.util.Map;

import indiesker.java110.ms.domain.Busker;

public interface TotalFeedService {
	List<Busker> findTotalFeed(String sortType);

	List<Busker> SearchByCity(Map<String, Object> params);

	List<Busker> SearchByTeamname(Map<String, Object> params);

	List<Busker> SearchByGenre(Map<String, Object> params);
}
