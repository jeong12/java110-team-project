package indiesker.java110.ms.domain;

public class FeedPhoto {
  protected int no;
  protected String teamName;
  protected String genre;
  protected String city;
  protected String content;
  protected String likecount;
  protected FeedPhotoFile feedphotoFile;
  
  
  
  public FeedPhotoFile getFeedphotoFile() {
    return feedphotoFile;
  }
  public void setFeedphotoFile(FeedPhotoFile feedphotoFile) {
    this.feedphotoFile = feedphotoFile;
  }
  public String getTeamName() {
    return teamName;
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
