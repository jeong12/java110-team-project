package indiesker.java110.ms.domain;

import java.sql.Timestamp;

public class Schedule {
  protected int ssno;
  protected Timestamp sdt;
  protected Timestamp edt;
  protected Timestamp cdt;
  protected String nsdt;
  protected String nedt;
  protected String ncdt;
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
  public Timestamp getEdt() {
    return edt;
  }
  public void setEdt(Timestamp edt) {
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
  
  
  
}
