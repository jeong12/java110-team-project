package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.Busker;

public interface BuskerDao {
  Busker findByNo(int no);
  List<Busker> findAll(Map<String,Object> params);
//  int insert(Busker busker);
//  Busker findByEmail(String email);
//  int delete(int no);
//  Busker findByEmailPassword(Map<String,Object> params);
  
}
