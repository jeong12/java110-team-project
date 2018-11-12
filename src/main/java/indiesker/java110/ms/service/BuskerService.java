package indiesker.java110.ms.service;

import indiesker.java110.ms.domain.Busker;

public interface BuskerService {
//    List<BuskerList> list(int pageNo, int pageSize);
    Busker get(int no);
    void add(Busker busker);
}
