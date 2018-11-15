package indiesker.java110.ms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.MemberDao;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

  @Autowired MemberDao memberDao;

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
    if(memberDao.checkId(params.get("id").toString()) == 1) {
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
  public Member findNoById(String id) {
    return memberDao.findNoById(id);
  }

  @Override
  public void modiMem(Member member) {
    memberDao.updateMemb(member);
  }

}










