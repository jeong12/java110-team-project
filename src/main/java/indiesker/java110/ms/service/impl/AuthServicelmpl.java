package indiesker.java110.ms.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import indiesker.java110.ms.dao.AuthDao;
import indiesker.java110.ms.service.AuthService;

@Service
public class AuthServicelmpl implements AuthService{

	@Autowired AuthDao authDao;
	  
	@Override
	public String getId(String email) {
	  return authDao.findByEamil(email);
	}

	@Override
	public String checkEmail(String id) {
		return authDao.checkEmail(id);
	}
	
	@Override
	public void update_pw(Map<String, String> update_pw_map) {
		
		authDao.update_pw(update_pw_map);
	}

	  
/*	@Override
	public Member update_pw(Member id) {
		return authDao.update_pw(id);
	}
	*/
	 // 비밀번호 찾기
}