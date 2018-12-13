package indiesker.java110.ms.domain;

import java.sql.Date;
import java.util.List;

public class FeedPhoto extends Busker{
  protected int pbno;
  protected String feedcont;
  protected String lcnt;
  protected Date cdt;
  protected String firphot;
  protected List<FeedPhotoFile> feedphotoFiles;
  protected List<Comment> comments;
  protected int comtcount;
  protected String strcdt;
  
  
  
  public String getStrcdt() {
    return strcdt;
  }
  public void setStrcdt(String strcdt) {
    this.strcdt = strcdt;
  }
  public int getComtcount() {
    return comtcount;
  }
  public void setComtcount(int comtcount) {
    this.comtcount = comtcount;
  }
  public int getPbno() {
    return pbno;
  }
  public void setPbno(int pbno) {
    this.pbno = pbno;
  }
  public String getFeedcont() {
    return feedcont;
  }
  public void setFeedcont(String feedcont) {
    this.feedcont = feedcont;
  }
  public String getLcnt() {
    return lcnt;
  }
  public void setLcnt(String lcnt) {
    this.lcnt = lcnt;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getFirphot() {
    return firphot;
  }
  public void setFirphot(String firphot) {
    this.firphot = firphot;
  }
  public List<FeedPhotoFile> getFeedphotoFiles() {
    return feedphotoFiles;
  }
  public void setFeedphotoFiles(List<FeedPhotoFile> feedphotoFiles) {
    this.feedphotoFiles = feedphotoFiles;
  }
  public List<Comment> getComments() {
    return comments;
  }
  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }
  
  

  

  
  

}
