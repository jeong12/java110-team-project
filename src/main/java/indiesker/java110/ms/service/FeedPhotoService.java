package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.FeedPhoto;

public interface FeedPhotoService {
//    List<FeedPhoto> feedPhoto();
    int recentPhotList2(int buskNo);
    FeedPhoto getfeedphotobyPbno(int no);
    void feedPhotoAndFileUpload(int bno, String cont,List<String> files);
    FeedPhoto getfeedphotobyPbnoNoComt(int no);
    List<FeedPhoto> recentPhotList(int buskNo, int pageNo, int pageSize);
    void delete(int pbno);
    
    void updateFeedPhoto(String filename, int fpno);
    void updateFeedContent(String content, int pbno);
    void insertOneFileUpload(String filename, int pbno);
    
    int insertPhotComt(int pbno, int mno, String cont);
    int revisePhotComment(String cont, int pcno);
    int deletePhotComment(int pcno);
}
