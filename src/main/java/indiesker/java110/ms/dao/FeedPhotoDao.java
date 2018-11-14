package indiesker.java110.ms.dao;

import java.util.List;
import indiesker.java110.ms.domain.FeedPhoto;
import indiesker.java110.ms.domain.FeedPhotoFile;

public interface FeedPhotoDao {
/*  List<FeedPhoto> findByFeedPhoto();
  FeedPhoto findPhotoFile(int no);*/
  List<FeedPhoto> findRecentPhot(int no);
  List<FeedPhotoFile> selectFiles(int no);
}
