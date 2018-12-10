package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.AviDao;
import indiesker.java110.ms.dao.BuskerDao;
import indiesker.java110.ms.domain.Avi;
import indiesker.java110.ms.service.AviService;

@Service
public class AviServiceImpl implements AviService {
    
    @Autowired BuskerDao buskerDao;
    @Autowired AviDao aviDao;

    @Transactional
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
    
    @Transactional
    @Override
    public void uploadAvi(int bno, String title, String content, String url) {
      Map<String,Object> params = new HashMap<>();
      params.put("title", title);
      params.put("content", content);
      params.put("urlid", url);
      params.put("buskerno",bno );
      
      aviDao.uploadAvi(params);
    }

    @Transactional
    @Override
    public void insertComment(int abno, int no, String cont) {
      Map<String,Object> params = new HashMap<>();
      params.put("cont", cont);
      params.put("mno", no);
      params.put("abno", abno);
      
      aviDao.insertcomt(params);
    }

    @Override
    public void delete(int abno) {
      int randomno= (int)((Math.random()+1)*10000);
      
      
      Map<String,Object> params= new HashMap<>();
      params.put("abno", abno);
      params.put("randomno", randomno);
      
      aviDao.deleteAvi(params);
    }

    @Override
    public void reviseAvi(String titl, String cont, String urlid, int no) {
      Map<String,Object> params= new HashMap<>();
      params.put("titl", titl);
      params.put("cont", cont);
      params.put("urlid", urlid);
      params.put("no", no);
      
      aviDao.reviseavi(params);
      
    }
   
}










