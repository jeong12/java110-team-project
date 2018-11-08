package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.Avi;

public interface AviDao {
  List<Avi> findAll();
  int insert(Avi Avi);
  
}
