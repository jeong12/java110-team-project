package indiesker.java110.ms.domain;

import java.sql.Timestamp;

public class ScheduleTime {
  protected int sssno;
  protected Timestamp ssdt;
  protected Timestamp sedt;
  protected Timestamp scdt;
  protected String snsdt;
  protected String snedt;
  protected String sncdt;
  protected char flag;
  
  public int getSssno() {
    return sssno;
  }
  public void setSssno(int sssno) {
    this.sssno = sssno;
  }
  public Timestamp getSsdt() {
    return ssdt;
  }
  public void setSsdt(Timestamp ssdt) {
    this.ssdt = ssdt;
  }
  public Timestamp getSedt() {
    return sedt;
  }
  public void setSedt(Timestamp sedt) {
    this.sedt = sedt;
  }
  public Timestamp getScdt() {
    return scdt;
  }
  public void setScdt(Timestamp scdt) {
    this.scdt = scdt;
  }
  public String getSnsdt() {
    return snsdt;
  }
  public void setSnsdt(String snsdt) {
    this.snsdt = snsdt;
  }
  public String getSnedt() {
    return snedt;
  }
  public void setSnedt(String snedt) {
    this.snedt = snedt;
  }
  public String getSncdt() {
    return sncdt;
  }
  public void setSncdt(String sncdt) {
    this.sncdt = sncdt;
  }
  
  public int getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  @Override
  public String toString() {
    return "ScheduleTime [sssno=" + sssno + ", ssdt=" + ssdt + ", sedt=" + sedt + ", scdt=" + scdt
        + ", snsdt=" + snsdt + ", snedt=" + snedt + ", sncdt=" + sncdt + ", flag=" + flag + "]";
  }

  
 
  
  
}
