package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.FeedPhotoDao;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.service.FeedPhotoService;

@Service
public class FeedPhotoServiceImpl implements FeedPhotoService {

  @Autowired  FeedPhotoDao feedphotoDao;
  @Transactional(transactionManager="transactionManager",   
      propagation=Propagation.REQUIRED,
      rollbackFor=Exception.class)

  @Override
  public List<FeedPhoto> recentPhotList(int buskNo, int pageNo, int pageSize) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("no", buskNo);
    params.put("rowNo", (pageNo - 1) * pageSize);
    params.put("size", pageSize);
    
    return feedphotoDao.findRecentPhot(params);
  }
  
  @Override
  public FeedPhoto getfeedphotobyPbno(int no) {
    return feedphotoDao.findfeedphotobyPbno(no);
  }
  
  @Transactional
  @Override
  public void feedPhotoAndFileUpload(int bno, String cont,List<String> files) {
    Map<String, Object> params = new HashMap<>();
    params.put("cont", cont);
    params.put("no", bno);
    feedphotoDao.feedPhotoUpload(params);
    int pbno = (int)params.get("pbno");
    
    Map<String, Object> params2 = new HashMap<>();
    params2.put("photsrc", files);
    params2.put("pbno", pbno);
    
    feedphotoDao.feedPhotoFileUpload(params2);
  }

  @Override
  public FeedPhoto getfeedphotobyPbnoNoComt(int no) {
    return feedphotoDao.findfeedphotobyPbnoNC(no);
  }

  @Override
  public int recentPhotList2(int buskNo) {
    System.out.println("buskNo"+buskNo);
    int photosize = feedphotoDao.findRecentPhot2(buskNo);
    System.out.println("photosize:"+photosize);
    
    return photosize;
  }

  @Override
  public void delete(int pbno) {
    // 10000~20000 사이 숫자 랜덤
    int randomno = (int)((Math.random()+1)*10000000);
    
    Map<String,Object> params = new HashMap<>();
    params.put("pbno", pbno);
    params.put("randomno", randomno);
    
    feedphotoDao.deletePhoto(params);
  }

  @Override
  public void updateFeedPhoto(String filename, int fpno) {
    Map<String,Object> params = new HashMap<>();
    params.put("filename", filename);
    params.put("fpno", fpno);
    
    feedphotoDao.revisephoto(params);
  }

  @Override
  public void updateFeedContent(String content, int pbno) {
    Map<String,Object> params = new HashMap<>();
    params.put("cont", content);
    params.put("no", pbno);
    
    feedphotoDao.revisephotocont(params);
  }

  @Override
  public void insertOneFileUpload(String filename, int pbno) {
    Map<String,Object> params = new HashMap<>();
    params.put("filename", filename);
    params.put("pbno", pbno);
    
    feedphotoDao.feedPhotoOneFileUpload(params);
  }

  @Override
  public int insertPhotComt(int pbno, int mno, String cont) {
    Map<String,Object> params = new HashMap<>();
    params.put("cont", cont);
    params.put("mno", mno);
    params.put("pbno", pbno);
    
    return feedphotoDao.insertcomt(params);
  }

  @Override
  public int revisePhotComment(String cont, int pcno) {
    Map<String,Object> params = new HashMap<>();
    params.put("cont", cont);
    params.put("pcno", pcno);
    
    return feedphotoDao.revisecomt(params);
  }

  @Override
  public int deletePhotComment(int pcno) {
    return feedphotoDao.deletecomt(pcno);
  }
  
  
  
}










