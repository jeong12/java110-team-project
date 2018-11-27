package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.FeedPhotoDao;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.service.FeedPhotoService;

@Service
public class FeedPhotoServiceImpl implements FeedPhotoService {

  @Autowired  FeedPhotoDao feedphotoDao;

  /*    @Override
    public List<FeedPhoto> feedPhoto() {

      return feedphotoDao.findByFeedPhoto();
    }*/

  @Override
  public List<FeedPhoto> recentPhotList(int buskNo, int pageNo, int pageSize) {
    System.out.println(buskNo);
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

}










