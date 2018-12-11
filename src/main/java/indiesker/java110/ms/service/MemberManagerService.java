package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.GradleMember;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Supporter;

public interface MemberManagerService {
  List<MemberManager> listAll(Paging paging);
  List<MemberManager> listSelect (char flag,int pageNo, int pageSize);
  List<MemberManager> dateSelect (String flag, String text,String cdt1,String cdt2,Paging paging);
  int update(String memo,String nik);
  
  Member memListDetail(String nik);
  Supporter supListDetail(String nik);
  Busker buskListDetail(String nik);
  List<String> memListDetailByGenre(String nik);
  List<MemberManager>  memberAjax(int flag, Paging paging);
  List<GradleMember> gradleList (Paging paging);
  List<GradleMember> gradleBusker (Paging paging);
  List<GradleMember> gradleSupporter (Paging paging);
  List<GradleMember> gradleAjaxBusker(Paging paging);
  List<GradleMember> gradleAjaxSupporter(Paging paging);
  Supporter supGet(int no);
  Busker buskGet(int no);
  int gradleBuskUpdate(int no);
  int gradleSupUpdate(int no);
  
  List<GradleMember> gradleSelect(String flag, String text, int type);
  String getMemo(String nik);
  int totlist();
  int totlistFlag(int flag);
  void stopMem(String id, int flag);
  
  int totgradle();
  int totgradleAjaxBusker();
  int totgradleAjaxSupporter();
  Integer fingFlag(String flag, String text);
  int totdateSelect (String flag, String text,String cdt1,String cdt2);
}
