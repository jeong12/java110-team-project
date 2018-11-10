package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerBoardMain;

public interface BuskerBoardMainService {
  List<BuskerBoardMain> list(int pageNo , int pageSize);

}
