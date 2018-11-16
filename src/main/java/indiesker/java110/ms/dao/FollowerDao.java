package indiesker.java110.ms.dao;

import java.util.List;

import indiesker.java110.ms.domain.Follower;

public interface FollowerDao {
	
	int findFollwer (int no);
	List<Follower> findList(int bno);
	List<Follower> findDetail(int bno);
}
