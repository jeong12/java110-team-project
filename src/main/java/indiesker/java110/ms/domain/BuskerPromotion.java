package indiesker.java110.ms.domain;

import java.sql.Date;

public class BuskerPromotion {

  protected String titl;
  protected String teamName;
  protected String genre;
  protected String city;
  protected Date sdt;
  protected Date edt;
  protected int cnt;
  protected String etc;
  protected String phot;
  
  public String getTitl() {
    return titl;
  }
  public void setTitl(String titl) {
    this.titl = titl;
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
  public Date getSdt() {
    return sdt;
  }
  public void setSdt(Date sdt) {
    this.sdt = sdt;
  }
  public Date getEdt() {
    return edt;
  }
  public void setEdt(Date edt) {
    this.edt = edt;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getEtc() {
    return etc;
  }
  public void setEtc(String etc) {
    this.etc = etc;
  }
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  
  
}
