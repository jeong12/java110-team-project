package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoService {
//    List<FeedPhoto> feedPhoto();

    List<FeedPhoto> recentPhotList(int buskno,int pageNo, int pageSize);
}
