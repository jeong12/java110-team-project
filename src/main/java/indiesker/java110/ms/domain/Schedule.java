package indiesker.java110.ms.domain;

import java.sql.Timestamp;
import java.util.List;

public class Schedule {
  protected int sno;
  protected String shopname;
  protected String addr;
  protected Timestamp sdt;
  protected Timestamp edt;
  protected Timestamp cdt;
  protected String nsdt;
  protected String nedt;
  protected String ncdt;
  protected Long longsdt;
  protected int cnt;
  protected float x;
  protected float y;
  protected char flag;
  protected int subno;
  protected Busker busker;
  protected Supporter supporter;
  protected List<ScheduleTime> scheduletime;
  protected String date;
  protected List<StagePhoto> stagephotos;
  
  

  public List<StagePhoto> getStagephotos() {
    return stagephotos;
  }
  public void setStagephotos(List<StagePhoto> stagephotos) {
    this.stagephotos = stagephotos;
  }
  public List<ScheduleTime> getScheduletime() {
    return scheduletime;
  }
  public void setScheduletime(List<ScheduleTime> scheduletime) {
    this.scheduletime = scheduletime;
  }
  public String getDate() {
    return date;
  }
  public void setDate(String date) {
    this.date = date;
  }
  public Long getLongsdt() {
    return longsdt;
  }
  public void setLongsdt(Long longsdt) {
    this.longsdt = longsdt;
  }
  public int getSno() {
    return sno;
  }
  public void setSno(int sno) {
    this.sno = sno;
  }
  public Supporter getSupporter() {
    return supporter;
  }
  public void setSupporter(Supporter supporter) {
    this.supporter = supporter;
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
  public Busker getBusker() {
    return busker;
  }
  public void setBusker(Busker busker) {
    this.busker = busker;
  }
  @Override
  public String toString() {
    return "Schedule [sno=" + sno + ", shopname=" + shopname + ", addr=" + addr + ", sdt=" + sdt
        + ", edt=" + edt + ", cdt=" + cdt + ", nsdt=" + nsdt + ", nedt=" + nedt + ", ncdt=" + ncdt
        + ", longsdt=" + longsdt + ", cnt=" + cnt + ", x=" + x + ", y=" + y + ", flag=" + flag
        + ", subno=" + subno + ", busker=" + busker + ", supporter=" + supporter + ", scheduletime="
        + scheduletime + "]";
  }
  
  
  
}
