package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.AuthDao;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.AuthService;

@Service
public class AuthServiceimpl implements AuthService{

	@Autowired AuthDao authDao;
	  
	@Override
	public Member getId(String email) {
	  return authDao.findByEamil(email);
	}

	@Override
	public String checkEmail(String id) {
		return authDao.checkEmail(id);
	}
	
	@Override
	public void update_pw(String email) {
		authDao.update_pw(email);
	}

	  
/*	@Override
	public Member update_pw(Member id) {
		return authDao.update_pw(id);
	}
	*/
	 // 비밀번호 찾기
}