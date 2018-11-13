package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.BuskerBoardDetailDao;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.domain.Comment;
import indiesker.java110.ms.service.BuskerBoardDetailService;

@Service
public class BuskerBoardDetailServiceImpl implements BuskerBoardDetailService{
  
  @Autowired BuskerBoardDetailDao buskerBoardDetailDao;

@Override
public BuskerBoardDetail get(int bbno) {
  return buskerBoardDetailDao.findbbno(bbno);
}

@Override
public List<Comment> comtList(int bbno, int pageNo, int pageSize) {
  HashMap<String,Object> params = new HashMap<>();
  params.put("no",bbno);
  params.put("rowNo", (pageNo - 1) * pageSize);
  params.put("size", pageSize);
  
  return buskerBoardDetailDao.comtList(params);
}

}
