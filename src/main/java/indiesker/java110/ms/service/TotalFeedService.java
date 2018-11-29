package indiesker.java110.ms.service;

import java.util.List;

import indiesker.java110.ms.domain.Busker;

public interface TotalFeedService {
	List<Busker> findTotalFeed();

	List<Busker> SearchByCity(String city);

	List<Busker> SearchByTeamname(String teamname);

	List<Busker> SearchByGenre(String teamgenre);
}
