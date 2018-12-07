package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;
import indiesker.java110.ms.domain.BuskerBoardDetail;
import indiesker.java110.ms.domain.Comment;

public interface BuskerBoardDetailDao {
  BuskerBoardDetail findbbno(int bbno);
  List<Comment> comtList(Map<String,Object> params);
  int insertComments(Map<String,Object> params);
}
