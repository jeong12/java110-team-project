package indiesker.java110.ms.domain;

import java.sql.Date;
import java.util.List;

public class FeedPhoto {
  protected int no;
  protected String teamName;
  protected String genre;
  protected String city;
  protected String content;
  protected String likecount;
  protected Date cdt;
  protected List<FeedPhotoFile> feedphotoFiles;

  
  public String getTeamName() {
    return teamName;
  }
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public List<FeedPhotoFile> getFeedphotoFile() {
    return feedphotoFiles;
  }
  public void setFeedphotoFile(List<FeedPhotoFile> feedphotoFiles) {
    this.feedphotoFiles = feedphotoFiles;
  }
  public void setTeamName(String teamName) {
    this.teamName = teamName;
  }
  public String getGenre() {
    return genre;
  }
  public void setGenre(String genre) {
    this.genre = genre;
  }
  public String getCity() {
    return city;
  }
  public void setCity(String city) {
    this.city = city;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getLikecount() {
    return likecount;
  }
  public void setLikecount(String likecount) {
    this.likecount = likecount;
  }
  

  
  

}
