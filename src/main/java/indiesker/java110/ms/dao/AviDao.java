package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Avi;

public interface AviDao {
  int insert(Avi Avi);
  List<Avi> findAll();
  List<Avi> findbypopul();
  Avi findByNo(int no);
  Avi findByAviNo(int no);
  List<Avi> findRecent(int no);
  Avi findfeedavibyAbno(int no);
  List<Avi> findByFolAvi(int no);
  int uploadAvi(Map<String, Object> param);
  Avi findByFeedAviNoNC(int no);
  void insertcomt(Map<String,Object> params);
  List<Avi> statisticsAviLcnt();
  void statisticsUpdateOfWeek(Map<String,Object> params);
  void deleteAvi(Map<String,Object> params);
  void reviseavi(Map<String, Object> params);
  int totList(int no);
  List<Avi> moreList(Map<String, Object> params);
  int revisecomt(Map<String,Object> params);
  int deletecomt(int acno);
  List<Avi> printabno();
}
