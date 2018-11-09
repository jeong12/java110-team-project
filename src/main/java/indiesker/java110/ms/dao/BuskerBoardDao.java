package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.BuskerBoard;

public interface BuskerBoardDao {
   int add(BuskerBoard buskerBoard);
   BuskerBoard findByBbno(int no);
   List<BuskerBoard> list();
}
