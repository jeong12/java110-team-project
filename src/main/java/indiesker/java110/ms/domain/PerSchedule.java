package indiesker.java110.ms.domain;

public class PerSchedule extends Schedule {
  protected int psno;
  protected String shopname;
  protected String addr;
  protected float x;
  protected float y;
  protected int cnt;
  protected int bno;


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
