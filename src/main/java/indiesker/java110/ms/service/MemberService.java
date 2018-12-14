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
    int getType(int no);
    int followComeOn(int mno, int bno);
    int noneFollow(int mno, int bno);
    int searchFollow(int mno, int bno);
    int likeComeOn(int mno, int bono, int flag);
    int noneLike(int mno, int bono, int flag);
    int searchLikeCount(int bono, int flag);
    int searchLikeOX(int mno, int bono, int flag);
}
