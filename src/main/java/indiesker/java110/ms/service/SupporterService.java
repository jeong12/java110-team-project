package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;

public interface SupporterService {
  int checkName(String name);
  int insert(Supporter s);
  List<Integer> checkSupporter(int no);
  void modiSup(Supporter supporter);
  void modiSupPho(StagePhoto stagephoto);
  int[] getSpno(int no);
  Supporter get(int no);
  StagePhoto[] getPhoto(int no);
  Supporter findInfo(int no);
}
