package indiesker.java110.ms.domain;

import java.io.Serializable;
import java.util.List;

public class Member implements Serializable {
  private static final long serialVersionUID = 1L;
  
  protected int no;
  protected String id;
  protected String email;
  protected String password;
  protected String nickname;
  protected String photo;
  protected List<String> genre;
  protected char yn;
  protected String memo;
  protected String genre0;
  protected String genre1;
  protected String genre2;
  protected int membflag;
  
  
  
  public String getGenre0() {
    return genre0;
  }
  public void setGenre0(String genre0) {
    this.genre0 = genre0;
  }
  public String getGenre1() {
    return genre1;
  }
  public void setGenre1(String genre1) {
    this.genre1 = genre1;
  }
  public String getGenre2() {
    return genre2;
  }
  public void setGenre2(String genre2) {
    this.genre2 = genre2;
  }
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
  public List<String> getGenre() {
    return genre;
  }
  public void setGenre(List<String> genre) {
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
  
  @Override
  public String toString() {
    return "Member [no=" + no + ", id=" + id + ", email=" + email + ", password=" + password
        + ", nickname=" + nickname + ", photo=" + photo + ", genre=" + genre+", yn=" + yn
        + ", memo=" + memo + "]";
  }
  public int getMembflag() {
    return membflag;
  }
  public void setMembflag(int membflag) {
    this.membflag = membflag;
  }

}

