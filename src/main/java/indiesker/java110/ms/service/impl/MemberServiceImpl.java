package indiesker.java110.ms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.MemberDao;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

  @Autowired MemberDao memberDao;

  @Transactional
  @Override
  public void add(Member member) {

    memberDao.insert(member);
  }

  @Override
  public int checkId(String id) {

    return memberDao.checkId(id);
  }

  @Override
  public int checkEmail(String email) {
    return memberDao.checkEmail(email);
  }

  @Override
  public int checkNickname(String nickname) {
    return memberDao.checkNickname(nickname);
  }

  @Override
  public Member getMember(String id, String password) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("id", id);
    params.put("password", password);
    return memberDao.findByEmailPassword(params);
  }

  @Override
  public Member getApiMember(Map<String,Object> params) {

    Member member = null;
    System.out.println(params.get("id").toString());
    if(memberDao.checkId(params.get("id").toString()) == 1) {
      System.out.println("이전에 로그인한적이 있는지 체크");
      member = memberDao.findByIdNick(params);
    }


    Member newbie = createMember(params);
    if(member != null)
      return member;

    memberDao.insert(newbie);
    return newbie;

  }

  private Member createMember(Map<String,Object> params) {
    Member mem = new Member();
    ArrayList<String> genre = new ArrayList<>();
    genre.add("jazz");
    genre.add("dance");
    genre.add("rock");
    if(params.containsKey("email") == false) {
      mem.setEmail(params.get("id").toString()+"@test.com");
    } else {
      mem.setEmail(params.get("email").toString());
    }
    mem.setId(params.get("id").toString());
    mem.setNickname(params.get("nickname").toString());
    if(params.containsKey("phot") == false) {
      mem.setPhoto(null);
    } else {
      mem.setPhoto(params.get("phot").toString());
    }
    mem.setPassword("1234qwer!");
    mem.setGenre(genre);

    return mem;
  }

  @Override
  public int findNoById(String id) {
    return memberDao.findNoById(id);
  }

  @Override
  public void modiMem(Member member) {
    memberDao.updateMemb(member);
  }
  
  @Override
  public boolean isBusker(int no) {
    int flag = (memberDao.buskCheck(no)).getMembflag();
    
    if(flag == 2) {
      return true;
    } else {
      return false;
    }
  }

  @Override
  public Member getMember(int no) {
    return memberDao.findMemByNo(no);
  }

  @Override
  public int getType(int no) {
    int type = memberDao.getType(no);
    return type;
  }

  @Override
  public int followComeOn(int mno, int bno) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bno", bno);
    
    return memberDao.followcomeon(params);
  }

  @Override
  public int noneFollow(int mno, int bno) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bno", bno);
    
    return memberDao.nonefollow(params);
  }

  @Override
  public int searchFollow(int mno, int bno) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bno", bno);
    
    return memberDao.searchfollow(params);
  }

  // 좋아요 관련
  @Override
  public int likeComeOn(int mno, int bono, int flag) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bono", bono);
    params.put("flag", flag);
    
    return memberDao.likecomeon(params);
  }

  @Override
  public int noneLike(int mno, int bono, int flag) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bono", bono);
    params.put("flag", flag);
    
    return memberDao.nonelike(params);
  }

  @Override
  public int searchLikeCount(int bono, int flag) {
    Map<String,Object> params = new HashMap<>();
    params.put("bono", bono);
    params.put("flag", flag);
    
    return memberDao.searchlikecount(params);
  }

  @Override
  public int searchLikeOX(int mno, int bono, int flag) {
    Map<String,Object> params = new HashMap<>();
    params.put("mno", mno);
    params.put("bono", bono);
    params.put("flag", flag);
    
    return memberDao.searchlikeox(params);
  }

  @Override
  public void buskLikeCount(int lcnt,int bono) {
    Map<String,Object> params = new HashMap<>();
    params.put("lcnt", lcnt);
    params.put("bono", bono);
    
    memberDao.busklcnt(params);
  }

  @Override
  public void aviLikeCount(int lcnt,int bono) {
    Map<String,Object> params = new HashMap<>();
    params.put("lcnt", lcnt);
    params.put("bono", bono);
    
    memberDao.avilcnt(params);
  }

  @Override
  public void inaviFavLikeCount(int bono) {
    
    memberDao.insertavifavlcnt(bono);
  }

  @Override
  public void upaviFavLikeCount(int lcnt, int bono) {
    Map<String,Object> params = new HashMap<>();
    params.put("lcnt", lcnt);
    params.put("abno", bono);
    
    memberDao.updateavifavlcnt(params);
  }


}










