package indiesker.java110.ms.service.impl;

import java.util.ArrayList;
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
    public int insert(Supporter s) {
      List<StagePhoto> list = new ArrayList<>();
      StagePhoto sp = new StagePhoto();
      for(int i=0;i<3;i++) {
        sp.setSno(s.getStagephotos().get(i).getSno());
        sp.setPhoto(s.getStagephotos().get(i).getPhoto());
        list.add(sp);
      }
      
      supporterDao.insert(s);
      return supporterDao.insertfile(list);
    }

    @Override
    public List<Integer> checkSupporter(int no) {
      return supporterDao.findBySupporter(no);
    }

    @Override
    public void modiSup(Supporter supporter) {
      supporterDao.updateSup(supporter);
    }

    @Override
    public void modiSupPho(StagePhoto stagephoto) {
      supporterDao.updateFile(stagephoto);
    }

    @Override
    public int[] getSpno(int no) {
      return supporterDao.findBySpno(no);
    }

    @Override
    public Supporter get(int no) {
      return supporterDao.findAll(no);
    }

    @Override
    public StagePhoto[] getPhoto(int no) {
      return supporterDao.findbyPhoto(no);
    }
    
    
    @Override
    public Supporter findInfo(int no) {
    return supporterDao.findInfo(no);
    }
    
}










