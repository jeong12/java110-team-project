package indiesker.java110.ms.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.BuskerService;

@Service
public class BuskerServiceImpl implements BuskerService {

  @Autowired  BuskerDao buskerDao;

//    @Override
//    public List<BuskerList> list(int pageNo, int pageSize) {
//      HashMap<String,Object> params = new HashMap<>();
//      params.put("rowNo", (pageNo - 1) * pageSize);
//      params.put("size", pageSize);
//      
//      return buskerlistDao.findAll(params);
//    }

  @Override
  public Busker get(int no) {
    return buskerDao.findByNo(no);
  }

  @Override
  public void add(Busker busker) {
    buskerDao.insert(busker);

  }

  @Override
  public List<Integer> checkBusker(int no) {
    return buskerDao.findByBusker(no);
  }

  @Override
  public void modiBusk(Busker busker) {
    buskerDao.updateBusk(busker);
  }

  @Override
  public List<Busker> getByBest() {
    return buskerDao.findByBest();
  }

  @Override
  public List<Busker> getByBest(Map<String,Object> params) {
    return buskerDao.findByBest(params);
  }

  @Override
  public List<Busker> getByBestDetail(int no) {
    return buskerDao.findByBestDetail(no);
  }

}










