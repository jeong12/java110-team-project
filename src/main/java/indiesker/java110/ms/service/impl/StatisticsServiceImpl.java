package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.AviDao;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.service.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService{

  @Autowired AviDao aviDao;
  
  /*   
       /초 분 시 일 월 요일 연도
       0   0   0   *   *   2   *  월요일 0시에 실행
       0/5 0   0   *   *   *    매일 5초간격으로 실행
       
   */
  @Override
  public void scheduleService() {
    List<Avi> lcnt = aviDao.statisticsAviLcnt();
    
    for(int i=0; i < lcnt.size(); i++) {
      HashMap<String,Object> params = new HashMap<>();
      
      params.put("abno",lcnt.get(i).getAviboardno());   
      params.put("lcnt", 0);
      
      aviDao.statisticsUpdateOfWeek(params);
    }
  }
}
