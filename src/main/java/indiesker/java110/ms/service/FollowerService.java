package indiesker.java110.ms.service;

import java.util.List;

import indiesker.java110.ms.domain.Follower;

public interface FollowerService {
	
	//등록한 팔로워 번호 찾기
	int getFollwerNo(int no);
	
	//즐겨찾기 목록 보기
	List<Follower> findList(int bno);
	
	//즐겨찾기 우측 자세히 보기
	List<Follower> findDetail(int bno);
	
}
