package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.AviDao;
import indiesker.java110.ms.dao.BuskerDao;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.service.AviService;

@Service
public class AviServiceImpl implements AviService {
    
    @Autowired BuskerDao buskerDao;
    @Autowired AviDao aviDao;

    @Override
    public void add(Avi avi) {
      aviDao.insert(avi);
    }

    @Override
    public List<Avi> list() {
      return aviDao.findAll();
    }
    
    @Override
    public List<Avi> recentList(int no){
      
      return aviDao.findRecent(no);
    }

    @Override
    public Avi get(int no) {
      return aviDao.findByAviNo(no);
    }
    
    @Override
    public Avi getfeedavibyAbno(int no) {
      return aviDao.findfeedavibyAbno(no);
    }
    @Override
    public Avi getfeedavibyAbnoNoComt(int no) {
      return aviDao.findByFeedAviNoNC(no);
    }

    @Override
    public List<Avi> getAll() {
      return aviDao.findAll();
    }

    @Override
    public List<Avi> getPop() {
      return aviDao.findbypopul();
    }

    @Override
    public List<Avi> getFolAvi(int no) {
      return aviDao.findByFolAvi(no);
    }
    
    @Override
    public void uploadAvi(int bno, String title, String content, String url) {
      Map<String,Object> params = new HashMap<>();
      params.put("title", title);
      params.put("content", content);
      params.put("urlid", url);
      params.put("buskerno",bno );
      
      aviDao.uploadAvi(params);
    }

    
   
}










