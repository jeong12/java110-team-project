package indiesker.java110.ms.dao;

import indiesker.java110.ms.domain.Member;

public interface MemberDao {
  int insert(Member member);
  int checkId(String id);
  int checkEmail(String email);
  int checkNickname(String nickname);
  Member findNoById(String id);

}
