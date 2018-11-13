package indiesker.java110.ms.service;

import indiesker.java110.ms.domain.Member;

public interface AuthService {
  Member getId(String email);
}
