package indiesker.java110.ms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.SupporterDao;
import indiesker.java110.ms.domain.StagePhoto;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.SupporterService;

@Service
public class SupporterServiceImpl implements SupporterService {

    @Autowired SupporterDao supporterDao;

    @Override
    public int checkName(String name) {
      
      return supporterDao.checkName(name);
      }

    @Override
    public int add(Supporter supporter) {
      return supporterDao.insert(supporter);
    }

    @Override
    public int insert(StagePhoto stagephoto) {
      return supporterDao.insertfile(stagephoto);
    }

    @Override
    public List<Integer> checkSupporter(int no) {
      return supporterDao.findBySupporter(no);
    }
}










