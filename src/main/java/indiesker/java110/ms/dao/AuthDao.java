package indiesker.java110.ms.dao;

import indiesker.java110.ms.domain.Member;

public interface AuthDao {
  Member findByEamil(String email);
}
