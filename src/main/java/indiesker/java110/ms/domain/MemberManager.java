package indiesker.java110.ms.domain;

import java.sql.Date;

public class MemberManager {
  protected String id;
  protected String nik;
  protected String email;
  protected char flag;
  protected String memo;
  protected Date cdt;
  
  
  
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getNik() {
    return nik;
  }
  public void setNik(String nik) {
    this.nik = nik;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getMemo() {
    return memo;
  }
  public void setMemo(String memo) {
    this.memo = memo;
  }
  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  
}
