package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.FollowerDao;
import indiesker.java110.ms.domain.Follower;
import indiesker.java110.ms.service.FollowerService;

@Service
public class FollwerServiceImpl implements FollowerService{

	@Autowired FollowerDao followerDao;


	@Override
	public List<Follower> findList(int no, int pageNo, int pageSize) {
        HashMap<String,Object> params = new HashMap<>();
        //System.out.println("서비스 임플"+no);
        params.put("no", no);
        params.put("rowNo", (pageNo - 1) * pageSize);
        params.put("size", pageSize);
		
		return followerDao.findList(params);
	}

	@Override
	public Follower findDetail(int bno) {
		return followerDao.findDetail(bno);
	}

	@Override
	public int totalCount(int no) {
		return followerDao.totalCount(no);
	}

/*@Override
public List<Follower> followerPage(Map<String, Integer> page) {
	return followerDao.followerPage(page);
}


*/	
	
}
