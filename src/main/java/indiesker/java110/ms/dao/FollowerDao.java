package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;

import indiesker.java110.ms.domain.Follower;

public interface FollowerDao {
	
	List<Follower> findList(Map<String,Object> params);
	Follower findDetail(int bno);
	int totalCount(int no);
/*	List<Follower> followerPage(Map<String, Integer> page);
	*/
	
}
