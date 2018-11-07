package indiesker.java110.ms.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.Map;

public class Member implements Serializable {
  private static final long serialVersionUID = 1L;
  
  protected int no;
  protected String id;
  protected String email;
  protected String password;
  protected String name;
  protected String nickname;
  protected String photo;
  protected Map<String,String> genre;
  protected char yn;
  protected String memo;
  protected Date sdt;
  protected Date edt;
  
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public Map<String, String> getGenre() {
    return genre;
  }
  public void setGenre(Map<String, String> genre) {
    this.genre = genre;
  }
  public char getYn() {
    return yn;
  }
  public void setYn(char yn) {
    this.yn = yn;
  }
  public String getMemo() {
    return memo;
  }
  public void setMemo(String memo) {
    this.memo = memo;
  }
  
  
  
  

}
