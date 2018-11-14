package indiesker.java110.ms.domain;

import java.sql.Timestamp;

public class Schedule {
  protected int no;
  protected String shopname;
  protected String addr;
  protected Timestamp sdt;
  protected Timestamp edt;
  protected Timestamp cdt;
  protected String nsdt;
  protected String nedt;
  protected String ncdt;
  protected int cnt;
  protected float x;
  protected float y;
  protected char flag;
  protected int subno;
  protected String genre;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getShopname() {
    return shopname;
  }
  public void setShopname(String shopname) {
    this.shopname = shopname;
  }
  public String getAddr() {
    return addr;
  }
  public void setAddr(String addr) {
    this.addr = addr;
  }
  public Timestamp getSdt() {
    return sdt;
  }
  public void setSdt(Timestamp sdt) {
    this.sdt = sdt;
  }
  public Timestamp getEdt() {
    return edt;
  }
  public void setEdt(Timestamp edt) {
    this.edt = edt;
  }
  public Timestamp getCdt() {
    return cdt;
  }
  public void setCdt(Timestamp cdt) {
    this.cdt = cdt;
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
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public float getX() {
    return x;
  }
  public void setX(float x) {
    this.x = x;
  }
  public float getY() {
    return y;
  }
  public void setY(float y) {
    this.y = y;
  }
  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  public int getSubno() {
    return subno;
  }
  public void setSubno(int subno) {
    this.subno = subno;
  }
  public String getGenre() {
    return genre;
  }
  public void setGenre(String genre) {
    this.genre = genre;
  }
  
}
