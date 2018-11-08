package indiesker.java110.ms.domain;

import java.sql.Date;

public class BuskerBoard {
  protected int bbno;
  protected String titl;
  protected String teamname;
  protected String genre;
  protected String city;
  protected int cnt;
  protected Date sdt;
  protected Date edt; 
  protected String tel1;
  protected String tel2;
  protected String etc;
  protected Date cdt;
  protected String phot;
  protected String bno;
  
  
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
  public int getBbno() {
    return bbno;
  }
  public void setBbno(int bbno) {
    this.bbno = bbno;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getBno() {
    return bno;
  }
  public void setBno(String bno) {
    this.bno = bno;
  }
  
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  public String getTitl() {
    return titl;
  }
  public void setTitl(String titl) {
    this.titl = titl;
  }
  public String getTeamname() {
    return teamname;
  }
  public void setTeamname(String teamname) {
    this.teamname = teamname;
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
  public String getTel1() {
    return tel1;
  }
  public void setTel1(String tel1) {
    this.tel1 = tel1;
  }
  public String getTel2() {
    return tel2;
  }
  public void setTel2(String tel2) {
    this.tel2 = tel2;
  }
  public String getEtc() {
    return etc;
  }
  public void setEtc(String etc) {
    this.etc = etc;
  }
  
  
}
