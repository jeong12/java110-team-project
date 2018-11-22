package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.Avi;

public interface AviDao {
  int insert(Avi Avi);
  List<Avi> findAll();
  Avi findByNo(int no);
  Avi findByAviNo(int no);
  List<Avi> findRecent(int no);
  Avi findfeedavibyAbno(int no);
  
}
