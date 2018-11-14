package indiesker.java110.ms.dao;

import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;

public interface SupporterDao {
  int checkName(String name);
  int insert(Supporter supporter);
  int insertfile(StagePhoto stagephoto);
}
