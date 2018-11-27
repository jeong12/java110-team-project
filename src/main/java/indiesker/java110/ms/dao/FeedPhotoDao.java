package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoDao {
/*  List<FeedPhoto> findByFeedPhoto();
  FeedPhoto findPhotoFile(int no);*/
  List<FeedPhoto> findRecentPhot(Map<String,Object> params);
  FeedPhoto findByImage(int no);
  FeedPhoto findfeedphotobyPbno(int no);
}
