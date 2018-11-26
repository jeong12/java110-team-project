package indiesker.java110.ms.domain;

import java.sql.Date;
import java.util.List;

public class FeedPhoto extends Busker{
  protected int pno;
  protected String cont;
  protected String lcnt;
  protected Date cdt;
  protected String firphot;
  protected List<FeedPhotoFile> feedphotoFiles;
  protected List<Comment> comments;
  
  
  public int getPno() {
    return pno;
  }
  public void setPno(int pno) {
    this.pno = pno;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = cont;
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
  @Override
  public String toString() {
    return "FeedPhoto [pno=" + pno + ", cont=" + cont + ", lcnt=" + lcnt + ", cdt=" + cdt
        + ", firphot=" + firphot + ", feedphotoFiles=" + feedphotoFiles + "]";
  }
  
  

  

  
  

}
