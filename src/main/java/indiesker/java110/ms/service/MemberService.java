package indiesker.java110.ms.service;

import java.util.Map;
import indiesker.java110.ms.domain.Member;

public interface MemberService {
    void add(Member member);
    int checkId(String id);
    int checkEmail(String email);
    int checkNickname(String nickname);
    Member getMember(String id, String password);
    Member getApiMember(Map<String,Object> params);
    int findNoById(String id);
    void modiMem(Member member);
    boolean isBusker(int no);
    Member getMember(int no);
}
