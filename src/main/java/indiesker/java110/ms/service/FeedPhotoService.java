package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoService {
//    List<FeedPhoto> feedPhoto();
    List<FeedPhoto> recentPhotList(int buskNo,int pageNo, int pageSize);
    FeedPhoto getfeedphotobyPbno(int no);
    void feedPhotoAndFileUpload(int bno, String cont,List<String> files);
    FeedPhoto getfeedphotobyPbnoNoComt(int no);
}
