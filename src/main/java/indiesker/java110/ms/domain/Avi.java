package indiesker.java110.ms.domain;

import java.sql.Date;

public class Avi extends Busker{
  protected int aviboardno;
  protected String title;
  protected String content;
  protected int avilikecount;
  protected Date cdt;
  protected String url;
  protected int buskerno;
  public int getAviboardno() {
    return aviboardno;
  }
  public void setAviboardno(int aviboardno) {
    this.aviboardno = aviboardno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getUrl() {
    return url;
  }
  public void setUrl(String url) {
    this.url = url;
  }
  public int getBuskerno() {
    return buskerno;
  }
  public void setBuskerno(int buskerno) {
    this.buskerno = buskerno;
  }
  public int getAvilikecount() {
    return avilikecount;
  }
  public void setAvilikecount(int avilikecount) {
    this.avilikecount = avilikecount;
  }

  
  

  
  
  
}
