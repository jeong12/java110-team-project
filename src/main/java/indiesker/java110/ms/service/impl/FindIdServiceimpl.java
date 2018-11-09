package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.FindIdDao;
import indiesker.java110.ms.dao.MemberDao;
import indiesker.java110.ms.service.FindIdService;

@Service
public class FindIdServiceimpl implements FindIdService{

  @Autowired FindIdDao findIdDao;
  @Autowired MemberDao memberDao;
  @Override
  public String getId(String email) {
    return findIdDao.id(email);
  }
  

}
