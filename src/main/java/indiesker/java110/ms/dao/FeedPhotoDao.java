package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoDao {
/*  List<FeedPhoto> findByFeedPhoto();
  FeedPhoto findPhotoFile(int no);*/
  List<FeedPhoto> findRecentPhot(Map<String,Object> params);
  List<FeedPhoto> findRecentPhot2(int no);
  FeedPhoto findByImage(int no);
  FeedPhoto findfeedphotobyPbno(int no);
  int feedPhotoUpload(Map<String,Object> params);
  void feedPhotoFileUpload(Map<String,Object> params);
  FeedPhoto findfeedphotobyPbnoNC(int no);
  void deletePhoto(Map<String,Object> params);
  
  void revisephotocont(Map<String,Object> params);
  void revisephoto(Map<String,Object> params);
  void feedPhotoOneFileUpload(Map<String,Object> params);
  
}
