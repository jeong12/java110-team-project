package indiesker.java110.ms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.AviDao;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.service.AviService;

@Service
public class AviServiceImpl implements AviService {

    @Autowired  AviDao aviDao;

    @Override
    public void add(Avi avi) {
      aviDao.insert(avi);
    }

    @Override
    public List<Avi> list() {
      return aviDao.findAll();
    }
    
   
}










