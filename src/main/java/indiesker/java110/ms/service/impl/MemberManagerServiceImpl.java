package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.MemberManagerDao;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.service.MemberManagerService;

@Service
public class MemberManagerServiceImpl implements MemberManagerService{

  @Autowired MemberManagerDao memberManagerDao;
  
  
  @Override
  public List<MemberManager> listAll(int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("rowNo", (pageNo - 1) * pageSize);
      params.put("size", pageSize);
      
      return memberManagerDao.findAll(params);
  }

  @Override
  public List<MemberManager> listSelect(char flag,int pageNo, int pageSize) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("flag", flag);
    params.put("rowNo", (pageNo - 1) * pageSize);
    params.put("size", pageSize);
    
    
    return memberManagerDao.findselect(params);
  }


  
}
