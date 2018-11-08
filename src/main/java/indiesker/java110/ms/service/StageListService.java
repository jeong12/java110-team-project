package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.StageList;

public interface StageListService {
    List<StageList> list(int pageNo, int pageSize);
    List<StageList> findByName(String name);
    List<StageList> findByLocal(String local);
}
