package indiesker.java110.ms.domain;

public class BuskerSchedule extends Schedule{

  protected int brno;
  protected String name;
  protected String addr;
  protected String cnt;
  protected float x;
  protected float y;
  
  public int getBrno() {
    return brno;
  }
  public void setBrno(int brno) {
    this.brno = brno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getAddr() {
    return addr;
  }
  public void setAddr(String addr) {
    this.addr = addr;
  }
  public String getCnt() {
    return cnt;
  }
  public void setCnt(String cnt) {
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
  
}
