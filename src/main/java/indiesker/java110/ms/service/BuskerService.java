package indiesker.java110.ms.service;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Busker;

public interface BuskerService {
//    List<BuskerList> list(int pageNo, int pageSize);
    Busker get(int no);
    void add(Busker busker);
    List<Integer> checkBusker(int no);
    void modiBusk(Busker busker);
    List<Busker> getByBest();
    List<Busker> getByBest(Map<String,Object> params);
    List<Busker> getByBestDetail(int no);
    Busker findInfo(int no);
    String showFileName(int no);
}
