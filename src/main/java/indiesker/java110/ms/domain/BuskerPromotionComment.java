package indiesker.java110.ms.domain;

import java.sql.Timestamp;

public class BuskerPromotionComment {
  
  protected String name;
  protected int bcno;
  protected String cont;
  protected int mno;
  protected Timestamp cdt;
  protected String ncdt;
  protected String phot;
  protected String nik;
  protected int flag;
  protected String type;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getBcno() {
    return bcno;
  }
  public void setBcno(int bcno) {
    this.bcno = bcno;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = cont;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public Timestamp getCdt() {
    return cdt;
  }
  public void setCdt(Timestamp cdt) {
    this.cdt = cdt;
  }
  public String getNcdt() {
    return ncdt;
  }
  public void setNcdt(String ncdt) {
    this.ncdt = ncdt;
  }
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  public String getNik() {
    return nik;
  }
  public void setNik(String nik) {
    this.nik = nik;
  }
  public int getFlag() {
    return flag;
  }
  public void setFlag(int flag) {
    this.flag = flag;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  @Override
  public String toString() {
    return "BuskerPromotionComment [name=" + name + ", bcno=" + bcno + ", cont=" + cont + ", mno="
        + mno + ", cdt=" + cdt + ", ncdt=" + ncdt + ", phot=" + phot + ", nik=" + nik + ", flag="
        + flag + ", type=" + type + "]";
  }
  
 
  
  
}
