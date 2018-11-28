package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.GradleMember;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.domain.Supporter;

public interface MemberManagerDao {
  //////////////////////////list
  List<MemberManager> findAll(Map<String,Object> params); 
  List<MemberManager> findselect(Map<String,Object> params); 
  List<MemberManager> searchSelect(Map<String,Object> params);
  
  Member memListDetail(String nik);
  List<String> memListDetailByGenre(String nik);
  Supporter supListDetail(String nik);
  Busker buskListDetail(String nik);
  
  ///////////////////////////list
  //////////////////////////////gradle
  List<GradleMember> gradleBusker(Map<String,Object> params);
  List<GradleMember> gradleSupporter(Map<String,Object> params);
  List<GradleMember> gradleAjaxBusker(Map<String,Object>params);
  List<GradleMember> gradleAjaxSupporter(Map<String,Object>params);
  List<GradleMember> gradleAjaxBuskerSelect(Map<String,Object>params);
  List<GradleMember> gradleAjaxSupporterSelect(Map<String,Object>params);
  int update(Map<String,Object> params);
  Supporter findbyNo(int no);
  Busker fidnBuskbyNo(int no);
  int gradleBuskUpdate(Map<String,Object> params);
  int gradleSupUpdate(Map<String,Object> params);
  ////////////////////////////////gradle끝
  
  
  
}
