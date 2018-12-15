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
  Member buskCheck(int no);
  Member findMemByNo(int no);
  int getType(int no);
  int followcomeon(Map<String,Object> params);
  int nonefollow(Map<String,Object> params);
  int searchfollow(Map<String,Object> params);
  int likecomeon(Map<String,Object> params);
  int nonelike(Map<String,Object> params);
  int searchlikecount(Map<String,Object> params);
  int searchlikeox(Map<String,Object> params);
  int busklcnt(Map<String,Object> params);
  int avilcnt(Map<String,Object> params);
  
  int updateavifavlcnt(Map<String,Object> params);
  int insertavifavlcnt(int no);
}
