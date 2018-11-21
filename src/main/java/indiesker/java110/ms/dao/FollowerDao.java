package indiesker.java110.ms.dao;

import java.util.List;
import java.util.Map;

import indiesker.java110.ms.domain.Follower;

public interface FollowerDao {
	
/*	List<Follower> findList(int no);*/
	Follower findDetail(int bno);
	List<Follower> followerPage(Map<String, Integer> page);
	int totalCount(int no);
	
/*	
	public class FollowPageDao {
		DBCP dbcp = new DBCP();
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  Statement stmt = null;
		  ResultSet rs = null;
		  String sql = null;
		   
		  public void closeDB() {
		    try {
		      if(rs != null) rs.close();
		      if(stmt != null) stmt.close();
		      if(pstmt != null) pstmt.close();
		      if(conn != null) conn.close();
		    } catch (SQLException e) {
		      e.printStackTrace();
		    }
		  }
		   
		  public ArrayList<Follower> getList(int startRow, int endRow) {
		 
		    ArrayList<Follower> list = new ArrayList<Follower>();
		     
		    try {
		      conn = dbcp.getConnection();
		       
		      sql = "select *, (select u_name from user where idx = writer_fk) writer, (select idx from answer where idx = answer_fk) answer from board order by idx desc limit "+startRow+", "+endRow;
		       
		      stmt = conn.createStatement();
		      rs = stmt.executeQuery(sql);
		       
		      while(rs.next()) {
		        int idx = rs.getInt("idx");
		        String title = rs.getString("title");
		        int count = rs.getInt("count");
		        String writer = rs.getString("writer");
		        String answer = rs.getString("answer");
		        String enroll = rs.getString("enroll");
		         
		        Follower dto = new Follower();
		        dto .setIdx(idx);
		        dto .setTitle(title);
		        dto .setCount(count);
		        dto .setWriter(writer);
		        dto .setAnswer(answer);
		        dto .setEnroll(enroll);
		        list.add(dto);
		      }
		       
		    } catch (Exception e){
		      e.printStackTrace();
		    } finally {
		      closeDB();
		    }
		    return list;
		  }
		   
		  public int getTotalCount(){
		    int total = 0;
		     
		    try {
		      conn = dbcp.getConnection();
		       
		      sql = "select count(*) from board";
		      pstmt = conn.prepareStatement(sql);
		       
		      rs = pstmt.executeQuery();
		      if(rs.next()){
		        total = rs.getInt(1);
		      }
		    } catch (Exception e){
		      e.printStackTrace();
		    } finally {
		      closeDB();
		    }
		    return total;
		  }

	}*/
}
