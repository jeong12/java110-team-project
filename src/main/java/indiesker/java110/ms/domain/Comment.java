package indiesker.java110.ms.domain;

import java.sql.Date;

//  사진,동영상,홍보 댓글
public class Comment {
  protected int pcno;
  protected int acno;
  protected int bcno;
  protected String cont;
  protected String phot;
  protected Date cdt;
  protected int mno;
  protected int pbno;
  protected int bbno;
  protected int abno;
  protected String nik;
  protected String comtphot;
  protected String comtname;
  protected String flag;
  protected String strcdt;
  
  
  
  public String getStrcdt() {
    return strcdt;
  }
  public void setStrcdt(String strcdt) {
    this.strcdt = strcdt;
  }
  public String getComtphot() {
    return comtphot;
  }
  public void setComtphot(String comtphot) {
    this.comtphot = comtphot;
  }
  public String getComtname() {
    return comtname;
  }
  public void setComtname(String comtname) {
    this.comtname = comtname;
  }
  public String getFlag() {
    return flag;
  }
  public void setFlag(String flag) {
    this.flag = flag;
  }
  public String getNik() {
    return nik;
  }
  public void setNik(String nik) {
    this.nik = nik;
  }
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  public int getPcno() {
    return pcno;
  }
  public void setPcno(int pcno) {
    this.pcno = pcno;
  }
  public int getAcno() {
    return acno;
  }
  public void setAcno(int acno) {
    this.acno = acno;
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
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public int getPbno() {
    return pbno;
  }
  public void setPbno(int pbno) {
    this.pbno = pbno;
  }
  public int getBbno() {
    return bbno;
  }
  public void setBbno(int bbno) {
    this.bbno = bbno;
  }
  public int getAbno() {
    return abno;
  }
  public void setAbno(int abno) {
    this.abno = abno;
  }
  
  
}
