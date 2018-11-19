package indiesker.java110.ms.service.impl;

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
	public List<Follower> findList(int no) {
		return followerDao.findList(no);
	}

	@Override
	public Follower findDetail(int bno) {
		return followerDao.findDetail(bno);
	}
	
}
