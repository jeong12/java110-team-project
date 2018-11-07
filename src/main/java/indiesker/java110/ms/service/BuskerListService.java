package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerList;

public interface BuskerListService {
    List<BuskerList> list(int pageNo, int pageSize);
}
