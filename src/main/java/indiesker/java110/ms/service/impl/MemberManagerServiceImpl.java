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

@Override
public List<MemberManager> dateSelect(String flag, String text,String ncdt1,String ncdt2,int pageNo, int pageSize) {
  HashMap<String,Object> params = new HashMap<>();
  System.out.println("============================");
  params.put("flag", flag);
  System.out.println(flag);
  params.put("text", text);
  System.out.println(text);
  params.put("cdt1",ncdt1);
  System.out.println(ncdt1);
  params.put("cdt2",ncdt2);
  System.out.println(ncdt2);
  params.put("rowNo", (pageNo - 1) * pageSize);
  params.put("size", pageSize);
  
  List<MemberManager> list = memberManagerDao.searchSelect(params);
  
  for (MemberManager m : list) {
   System.out.println("서비스임");
   System.out.println("****************");
   System.out.println(m.getCdt());
   System.out.println("****************");
   System.out.println(m);
  }
  
  return list;
}
  
}
