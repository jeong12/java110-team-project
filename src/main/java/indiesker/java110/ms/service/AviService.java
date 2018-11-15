package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.Avi;

public interface AviService {
  List<Avi> list();
  void add(Avi avi);
  Avi get(int no);
  List<Avi> recentList(int no);
}
