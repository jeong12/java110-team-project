package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.Avi;

public interface AviService {
  List<Avi> list();
  void add(Avi avi);
  Avi get(int no);
  List<Avi> recentList(int no);
  Avi getfeedavibyAbno(int no);
  List<Avi> getAll();
  List<Avi> getPop();
  void uploadAvi(int bno, String title, String content, String url);
  Avi getfeedavibyAbnoNoComt(int no);
}
