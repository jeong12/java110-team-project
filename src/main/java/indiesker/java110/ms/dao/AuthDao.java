package indiesker.java110.ms.dao;

import java.util.Map;

public interface AuthDao {
  String findByEamil(String email);
  String checkEmail(String id);
  void update_pw(Map<String, String> update_pw_map);
  //void update_pw(String email,String password);
	
	/*@Transactional
	public int update_pw(Member member) throws Exception{
		return sqlsession.update("member.update_pw", member);
	}*/

}
