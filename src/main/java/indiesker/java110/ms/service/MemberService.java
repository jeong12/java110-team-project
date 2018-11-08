package indiesker.java110.ms.service;

import indiesker.java110.ms.domain.Member;

public interface MemberService {
    void add(Member member);
    int checkId(String id);
}
