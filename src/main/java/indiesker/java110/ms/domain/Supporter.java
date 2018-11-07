package indiesker.java110.ms.domain;

public class Supporter extends Member {
  private static final long serialVersionUID = 1L;
  
  protected String name;
  protected String baseaddr;
  protected String postno;
  protected String detailaddr;
  protected String genre;
  protected int capa;
  protected String tel;
  protected char permission;
  protected String message;
  protected float x;
  protected float y;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getBaseaddr() {
    return baseaddr;
  }
  public void setBaseaddr(String baseaddr) {
    this.baseaddr = baseaddr;
  }
  public String getPostno() {
    return postno;
  }
  public void setPostno(String postno) {
    this.postno = postno;
  }
  public String getDetailaddr() {
    return detailaddr;
  }
  public void setDetailaddr(String detailaddr) {
    this.detailaddr = detailaddr;
  }
  public String getSupgenre() {
    return genre;
  }
  public void setSupgenre(String genre) {
    this.genre = genre;
  }
  public int getCapa() {
    return capa;
  }
  public void setCapa(int capa) {
    this.capa = capa;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public char getPermission() {
    return permission;
  }
  public void setPermission(char permission) {
    this.permission = permission;
  }
  public String getMessage() {
    return message;
  }
  public void setMessage(String message) {
    this.message = message;
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
