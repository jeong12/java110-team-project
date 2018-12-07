package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.domain.Comment;

public interface BuskerBoardDetailService {
  
  BuskerBoardDetail get(int bbno);
  List<Comment> comtList(int bbno, int pageNo, int pageSize);
  int insertComments(int no, int bbno, String comments);
}
