package indiesker.java110.ms.dao;

import indiesker.java110.ms.domain.Member;

public interface AuthDao {
  Member findByEamil(String email);
  String checkEmail(String id);
  void update_pw(String Email);
	
	/*@Transactional
	public int update_pw(Member member) throws Exception{
		return sqlsession.update("member.update_pw", member);
	}*/

}
