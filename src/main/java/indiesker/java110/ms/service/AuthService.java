package indiesker.java110.ms.service;

import java.util.Map;

public interface AuthService {
	
  //아이디 찾기
  String getId(String email);
  
  //비밀번호 찾기
  String checkEmail(String id);
  void update_pw(Map<String, String> update_pw_map);
  
//  Member update_pw(Member id);
}
