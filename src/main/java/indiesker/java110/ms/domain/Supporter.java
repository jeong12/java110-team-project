package indiesker.java110.ms.domain;

import java.util.List;

public class Supporter extends Member {
  private static final long serialVersionUID = 1L;
  protected String name;
  protected String baseaddr;
  protected String postno;
  protected String detailaddr;
  protected String sgnere; // 어휴 ㅡㅡ
  protected int capa;
  protected String tel;
  protected char permission;
  protected String message;
  protected float x;
  protected float y;
  protected StagePhoto stagephoto;
  protected List<StagePhoto> stagephotos;
  protected int tcnt; //누적 인기 카운트
  
  public int getTcnt() {
    return tcnt;
  }
  public void setTcnt(int tcnt) {
    this.tcnt = tcnt;
  }
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
  public String getSgnere() {
    return sgnere;
  }
  public void setSgnere(String sgnere) {
    this.sgnere = sgnere;
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
  public StagePhoto getStagephoto() {
    return stagephoto;
  }
  public void setStagephoto(StagePhoto stagephoto) {
    this.stagephoto = stagephoto;
  }
  public List<StagePhoto> getStagephotos() {
    return stagephotos;
  }
  public void setStagesphoto(List<StagePhoto> stagephotos) {
    this.stagephotos = stagephotos;
  }
  @Override
  public String toString() {
    return "Supporter [name=" + name + ", baseaddr=" + baseaddr + ", postno=" + postno
        + ", detailaddr=" + detailaddr + ", sgnere=" + sgnere + ", capa=" + capa + ", tel=" + tel
        + ", permission=" + permission + ", message=" + message + ", x=" + x + ", y=" + y
        + ", stagephoto=" + stagephoto + ", stagesphoto=" + stagephotos + "]";
  }
}