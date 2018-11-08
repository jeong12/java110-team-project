package indiesker.java110.ms.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Schedule {
  protected int ssno;
  protected Timestamp sdt;
  protected Date edt;
  protected char flag;
  protected int sno;
  
  public int getSsno() {
    return ssno;
  }
  public void setSsno(int ssno) {
    this.ssno = ssno;
  }
  public Timestamp getSdt() {
    return sdt;
  }
  public void setSdt(Timestamp sdt) {
    this.sdt = sdt;
  }
  public Date getEdt() {
    return edt;
  }
  public void setEdt(Date edt) {
    this.edt = edt;
  }
  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  public int getSno() {
    return sno;
  }
  public void setSno(int sno) {
    this.sno = sno;
  }
  
  
}
