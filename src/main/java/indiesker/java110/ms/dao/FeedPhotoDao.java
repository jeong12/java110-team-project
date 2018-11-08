package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoDao {
  List<FeedPhoto> findByFeedPhoto();
  FeedPhoto findPhotoFile(int no);
}
