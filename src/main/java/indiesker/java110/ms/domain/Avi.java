package indiesker.java110.ms.domain;

import java.sql.Date;
import java.util.List;

public class Avi extends Busker{
  private static final long serialVersionUID = 1L;
  protected int aviboardno;
  protected String title;
  protected String content;
  protected int avilikecount;
  protected Date cdt;
  protected String url;
  protected String urlid;
  protected String thumbnail;
  protected int buskerno;
  protected int likeAvi;
  protected char flag;
  protected List<Comment> comments;
  protected int comtcount;
  
  
  public int getComtcount() {
    return comtcount;
  }
  public void setComtcount(int comtcount) {
    this.comtcount = comtcount;
  }
  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
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
  public int getAvilikecount() {
    return avilikecount;
  }
  public void setAvilikecount(int avilikecount) {
    this.avilikecount = avilikecount;
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
  public String getUrlid() {
    return urlid;
  }
  public void setUrlid(String urlid) {
    this.urlid = urlid;
  }
  public String getThumbnail() {
    return thumbnail;
  }
  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
  public int getBuskerno() {
    return buskerno;
  }
  public void setBuskerno(int buskerno) {
    this.buskerno = buskerno;
  }
  public int getLikeAvi() {
    return likeAvi;
  }
  public void setLikeAvi(int likeAvi) {
    this.likeAvi = likeAvi;
  }
  public List<Comment> getComments() {
    return comments;
  }
  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }


  
  
  
}
