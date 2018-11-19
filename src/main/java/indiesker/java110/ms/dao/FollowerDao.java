package indiesker.java110.ms.dao;

import java.util.List;

import indiesker.java110.ms.domain.Follower;

public interface FollowerDao {
	
	List<Follower> findList(int no);
	Follower findDetail(int bno);
}
