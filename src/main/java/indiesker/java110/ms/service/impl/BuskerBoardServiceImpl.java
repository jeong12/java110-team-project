package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.BuskerBoardDao;
import indiesker.java110.ms.domain.BuskerBoard;
import indiesker.java110.ms.service.BuskerBoardService;

@Service
public class BuskerBoardServiceImpl implements BuskerBoardService{
  
  @Autowired BuskerBoardDao buskerBoarDao;

  @Transactional
  @Override
  public void add(BuskerBoard buskerBoard) {
    buskerBoarDao.add(buskerBoard);
    
  }
}
