package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.MemberManager;

public interface MemberManagerDao {
  List<MemberManager> findAll(Map<String,Object> params); 
  List<MemberManager> findselect(Map<String,Object> params); 
}
