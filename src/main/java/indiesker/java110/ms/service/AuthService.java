package indiesker.java110.ms.service;

import indiesker.java110.ms.domain.Member;

public interface AuthService {
	
  //아이디 찾기
  Member getId(String email);
  
  //비밀번호 찾기
  String checkEmail(String id);
  void update_pw(String email);
  
//  Member update_pw(Member id);
}
