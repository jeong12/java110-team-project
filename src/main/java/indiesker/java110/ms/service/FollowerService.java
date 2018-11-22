package indiesker.java110.ms.service;

import java.util.List;

import indiesker.java110.ms.domain.Follower;

public interface FollowerService {
	
	//즐겨찾기 목록 보기
	List<Follower> findList(int no, int pageNo, int pageSize);
	
	//즐겨찾기 우측 자세히 보기
	Follower findDetail(int bno);
	
	//토탈 게시글 수 찾기
	int totalCount(int no);
	
	//즐겨찾기 페이징 처리하기
/*	List<Follower> followerPage(Map<String, Integer> page);

	int totalCount(int no);*/
	
}
