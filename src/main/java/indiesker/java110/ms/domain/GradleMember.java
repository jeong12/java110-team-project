package indiesker.java110.ms.domain;

public class GradleMember {
  protected String id;
  protected String nik;
  protected String name;
  protected String genre;
  protected String email;
  protected char flag;
  protected String sflag;
  protected String gradle;
  protected int sno;
  protected int bno;
  
  
  
  public int getSno() {
    return sno;
  }
  public void setSno(int sno) {
    this.sno = sno;
  }
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  public String getGradle() {
    return gradle;
  }
  public void setGradle(String gradle) {
    this.gradle = gradle;
  }
  public String getSflag() {
    return sflag;
  }
  public void setSflag(String sflag) {
    this.sflag = sflag;
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
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getGenre() {
    return genre;
  }
  public void setGenre(String genre) {
    this.genre = genre;
  }

  public char getFlag() {
    return flag;
  }
  public void setFlag(char flag) {
    this.flag = flag;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  @Override
  public String toString() {
    return "GradleMember [id=" + id + ", nik=" + nik + ", name=" + name + ", genre=" + genre
        + ", email=" + email + ", flag=" + flag + ", sflag=" + sflag + ", gradle=" + gradle
        + ", sno=" + sno + ", bno=" + bno + "]";
  }
 
  
  
  
}
