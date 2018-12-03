package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;

import indiesker.java110.ms.domain.Busker;

public interface TotalFeedDao {
	List<Busker> findTotalFeed(String sortType);
	List<Busker> findByCity(Map<String, Object> params);
	List<Busker> findByTeamname(Map<String, Object> params);
	List<Busker> findByGenre(Map<String, Object> params);
}
