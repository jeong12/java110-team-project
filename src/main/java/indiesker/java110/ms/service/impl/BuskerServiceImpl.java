package indiesker.java110.ms.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.BuskerDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.BuskerService;

@Service
public class BuskerServiceImpl implements BuskerService {

  @Autowired  BuskerDao buskerDao;
  @Transactional(transactionManager="transactionManager",   
      propagation=Propagation.REQUIRED,
      rollbackFor=Exception.class)

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
    buskerDao.updateflag(busker.getNo());
  }

  @Override
  public List<Integer> checkBusker(int no) {
    return buskerDao.findByBusker(no);
  }

  @Override
  public void modiBusk(Busker busker) {
    System.out.println(busker);
    buskerDao.updateBusk(busker);
  }
  
  @Override
  public Busker findInfo(int no) {
    return buskerDao.findBukserInfo(no);
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










