package indiesker.java110.ms.domain;

import java.sql.Date;

public class Busker extends Member{
  private static final long serialVersionUID = 1L;
  protected int bno;
  protected String teamname;
  protected String teamgenre;
  protected String city;
  protected String instrument; // 악기
  protected String streamingUrl; 
  protected String teamInfo;
  protected String teamPhoto;
  protected String avi1;
  protected String avi2;
  protected char permission; // 승인여부
  protected Date cdt; // 가입일
  protected int likecount;
  protected String tel;
  protected String message;
  


  
  
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getTeamname() {
    return teamname;
  }
  public void setTeamname(String teamname) {
    this.teamname = teamname;
  }
  public String getTeamgenre() {
    return teamgenre;
  }
  public void setTeamgenre(String teamgenre) {
    this.teamgenre = teamgenre;
  }
  public String getCity() {
    return city;
  }
  public void setCity(String city) {
    this.city = city;
  }
  public String getInstrument() {
    return instrument;
  }
  public void setInstrument(String instrument) {
    this.instrument = instrument;
  }
  public String getStreamingUrl() {
    return streamingUrl;
  }
  public void setStreamingUrl(String streamingUrl) {
    this.streamingUrl = streamingUrl;
  }
  public String getTeamInfo() {
    return teamInfo;
  }
  public void setTeamInfo(String teamInfo) {
    this.teamInfo = teamInfo;
  }
  public String getTeamPhoto() {
    return teamPhoto;
  }
  public void setTeamPhoto(String teamPhoto) {
    this.teamPhoto = teamPhoto;
  }
  public String getAvi1() {
    return avi1;
  }
  public void setAvi1(String avi1) {
    this.avi1 = avi1;
  }
  public String getAvi2() {
    return avi2;
  }
  public void setAvi2(String avi2) {
    this.avi2 = avi2;
  }
  public char getPermission() {
    return permission;
  }
  public void setPermission(char permission) {
    this.permission = permission;
  }
  public int getLikecount() {
    return likecount;
  }
  public void setLikecount(int likecount) {
    this.likecount = likecount;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  
  public String getMessage() {
    return message;
  }
  public void setMessage(String message) {
    this.message = message;
  }
  @Override
  public String toString() {
    return "Busker [bno=" + bno + ", teamname=" + teamname + ", teamgenre=" + teamgenre + ", city="
        + city + ", instrument=" + instrument + ", streamingUrl=" + streamingUrl + ", teamInfo="
        + teamInfo + ", teamPhoto=" + teamPhoto + ", avi1=" + avi1 + ", avi2=" + avi2
        + ", permission=" + permission + ", cdt=" + cdt + ", likecount=" + likecount + ", tel="
        + tel + ", message=" + message + "]";
  }


  
  
}
