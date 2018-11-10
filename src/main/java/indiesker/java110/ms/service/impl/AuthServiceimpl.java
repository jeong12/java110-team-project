package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.AuthDao;
import indiesker.java110.ms.service.AuthService;

@Service
public class AuthServiceimpl implements AuthService{

  @Autowired AuthDao authDao;
  @Override
  public String getId(String email) {
    return authDao.findByEamil(email);
  }
  

}
