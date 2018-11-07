package indiesker.java110.ms.domain;

import java.sql.Date;

public class StageList {

  protected String photoName;
  protected String name;
  protected Date startDate;
  protected Date endDate;
  protected String local;
  protected String genre;
  public String getPhotoName() {
    return photoName;
  }
  public void setPhotoName(String photoName) {
    this.photoName = photoName;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public Date getStartDate() {
    return startDate;
  }
  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }
  public Date getEndDate() {
    return endDate;
  }
  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }
  public String getLocal() {
    return local;
  }
  public void setLocal(String local) {
    this.local = local;
  }
  public String getGenre() {
    return genre;
  }
  public void setGenre(String genre) {
    this.genre = genre;
  }
  
  
  
  
}
