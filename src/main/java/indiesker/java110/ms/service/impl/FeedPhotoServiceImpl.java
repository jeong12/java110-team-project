package indiesker.java110.ms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import indiesker.java110.ms.dao.FeedPhotoDao;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.service.FeedPhotoService;

@Service
public class FeedPhotoServiceImpl implements FeedPhotoService {

    @Autowired  FeedPhotoDao feedphotoDao;

    @Override
    public List<FeedPhoto> feedPhoto() {
      
      return feedphotoDao.findByFeedPhoto();
    }
    
   
    
  
   
}









