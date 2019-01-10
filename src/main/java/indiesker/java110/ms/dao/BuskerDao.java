package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Busker;

public interface BuskerDao {
  Busker findByNo(int no);
  List<Busker> findAll(Map<String,Object> params);
  int insert(Busker busker);
  List<Integer> findByBusker(int no);
  void updateBusk(Busker busker);
  List<Busker> findByBest();
  List<Busker> findByBest(Map<String,Object> params);
  List<Busker> findByBestDetail(int no);
//  Busker findByEmail(String email);
//  int delete(int no);
//  Busker findByEmailPassword(Map<String,Object> params);
  Busker findBukserInfo(int no);
  int updateflag(int no);
  String showFileName(int no);
}
