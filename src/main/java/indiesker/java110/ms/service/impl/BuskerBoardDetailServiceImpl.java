package indiesker.java110.ms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerBoardDetailDao;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.service.BuskerBoardDetailService;

@Service
public class BuskerBoardDetailServiceImpl implements BuskerBoardDetailService{
  
  @Autowired BuskerBoardDetailDao buskerBoardDetailDao;

@Override
public BuskerBoardDetail get(int bbno) {
  return buskerBoardDetailDao.findbbno(bbno);
}

}
