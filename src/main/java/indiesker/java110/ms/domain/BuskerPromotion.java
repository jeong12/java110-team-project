package indiesker.java110.ms.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class BuskerPromotion {

  protected String titl;
  protected String teamname;
  protected String genre;
  protected String city;
  protected Date sdt;
  protected Date edt;
  protected int cnt;
  protected Timestamp cdt;
  protected String etc;
  protected String phot;
  protected int bno;
  protected int bbno;
  protected String tel1;
  protected String tel2;
  protected String nsdt;
  protected String nedt;
  protected String ncdt;
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
  public Timestamp getCdt() {
    return cdt;
  }
  public void setCdt(Timestamp cdt) {
    this.cdt = cdt;
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
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  public int getBbno() {
    return bbno;
  }
  public void setBbno(int bbno) {
    this.bbno = bbno;
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
  public String getNsdt() {
    return nsdt;
  }
  public void setNsdt(String nsdt) {
    this.nsdt = nsdt;
  }
  public String getNedt() {
    return nedt;
  }
  public void setNedt(String nedt) {
    this.nedt = nedt;
  }
  public String getNcdt() {
    return ncdt;
  }
  public void setNcdt(String ncdt) {
    this.ncdt = ncdt;
  }
  @Override
  public String toString() {
    return "BuskerPromotion [titl=" + titl + ", teamname=" + teamname + ", genre=" + genre
        + ", city=" + city + ", sdt=" + sdt + ", edt=" + edt + ", cnt=" + cnt + ", cdt=" + cdt
        + ", etc=" + etc + ", phot=" + phot + ", bno=" + bno + ", bbno=" + bbno + ", tel1=" + tel1
        + ", tel2=" + tel2 + ", nsdt=" + nsdt + ", nedt=" + nedt + ", ncdt=" + ncdt + "]";
  }
  
  
  
  
  
  
  
}
