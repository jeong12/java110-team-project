package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.MemberManager;

public interface MemberManagerService {
  List<MemberManager> listAll(int pageNo, int pageSize);
  List<MemberManager> listSelect (char flag,int pageNo, int pageSize);
  List<MemberManager> dateSelect (String flag, String text,String cdt1,String cdt2,int pageNo, int pageSize);

}
