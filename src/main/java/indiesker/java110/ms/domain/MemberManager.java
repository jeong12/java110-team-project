package indiesker.java110.ms.domain;

import java.sql.Date;

public class MemberManager {
  protected String id;
  protected String nik;
  protected String email;
  protected char flag;
  protected String memo;
  protected Date cdt;
  protected String ncdt;
  protected String text;
  protected String type;

  public String getNcdt() {
    return ncdt;
  }
  public void setNcdt(String ncdt) {
    this.ncdt = ncdt;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
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
  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  public String getMemo() {
    return memo;
  }
  public void setMemo(String memo) {
    this.memo = memo;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  @Override
  public String toString() {
    return "MemberManager [id=" + id + ", nik=" + nik + ", email=" + email + ", flag=" + flag
        + ", memo=" + memo + ", cdt=" + cdt + ", ncdt=" + ncdt + ", text=" + text + ", type=" + type
        + "]";
  }
}
