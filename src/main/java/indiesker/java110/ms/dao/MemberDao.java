package indiesker.java110.ms.dao;

import java.util.Map;
import indiesker.java110.ms.domain.Member;

public interface MemberDao {
  int insert(Member member);
  int checkId(String id);
  int checkEmail(String email);
  int checkNickname(String nickname);
  Member findByEmailPassword(Map<String,Object> params);
  Member findByIdNick(Map<String,Object> params);
  int findNoById(String id);
  void updateMemb(Member member);

}
