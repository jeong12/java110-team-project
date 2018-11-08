package indiesker.java110.ms.domain;

import java.sql.Date;

public class PerSchedule extends Schedule {
  protected int psno;
  protected String shopname;
  protected String addr;
  protected float x;
  protected float y;
  protected int cnt;
  protected Date cdt;
  protected int bno;
  
  
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getShopname() {
    return shopname;
  }
  public void setShopname(String shopname) {
    this.shopname = shopname;
  }
  public int getPsno() {
    return psno;
  }
  public void setPsno(int psno) {
    this.psno = psno;
  }
  public String getAddr() {
    return addr;
  }
  public void setAddr(String addr) {
    this.addr = addr;
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
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  
  
}
