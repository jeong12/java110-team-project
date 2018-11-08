package indiesker.java110.ms.dao;

import indiesker.java110.ms.domain.Member;

public interface MemberDao {
  int insert(Member member);
  int checkId(String id);

}
