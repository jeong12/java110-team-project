package indiesker.java110.ms.dao;

import java.util.List;

import indiesker.java110.ms.domain.Busker;

public interface TotalFeedDao {
	List<Busker> findTotalFeed();
	List<Busker> findByCity(String city);
	List<Busker> findByTeamname(String teamname);
	List<Busker> findByGenre(String teamgenre);
}
