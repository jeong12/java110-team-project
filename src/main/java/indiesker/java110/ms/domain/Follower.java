package indiesker.java110.ms.domain;

public class Follower{
  
  protected int no;
  protected int bno;
  protected String teamname;
  protected String teamgenre;
  protected String city;
  protected String teamInfo;
  protected String teamPhoto;
  
  /** 한 페이지당 게시글 수 **/
  private int pageSize = 9;
  /** 한 블럭(range)당 페이지 수 **/
  private int rangeSize = 9;
  /** 현재 페이지 **/
  private int curPage = 1;
  /** 현재 블럭(range) **/
  private int curRange = 1;
  /** 총 게시글 수 **/
  private int listCnt;
  /** 총 페이지 수 **/
  private int pageCnt;
  /** 총 블럭(range) 수 **/
  private int rangeCnt;
  /** 시작 페이지 **/
  private int startPage = 1;
  /** 끝 페이지 **/
  private int endPage = 1;
  /** 시작 index **/
  private int startIndex = 0;
  /** 이전 페이지 **/
  private int prevPage;
  /** 다음 페이지 **/
  private int nextPage;



  
public int getNo() {
	return no;
}

public void setNo(int no) {
	this.no = no;
}

public int getBno() {
	return bno;
}

public void setBno(int bno) {
	this.bno = bno;
}

public String getTeamname() {
	return teamname;
}

public void setTeamname(String teamname) {
	this.teamname = teamname;
}

public String getTeamgenre() {
	return teamgenre;
}

public void setTeamgenre(String teamgenre) {
	this.teamgenre = teamgenre;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getTeamInfo() {
	return teamInfo;
}

public void setTeamInfo(String teamInfo) {
	this.teamInfo = teamInfo;
}

public String getTeamPhoto() {
	return teamPhoto;
}

public void setTeamPhoto(String teamPhoto) {
	this.teamPhoto = teamPhoto;
}

public int getPageSize() {
	return pageSize;
}

public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}

public int getRangeSize() {
	return rangeSize;
}

public void setRangeSize(int rangeSize) {
	this.rangeSize = rangeSize;
}

public int getCurPage() {
	return curPage;
}

public void setCurPage(int curPage) {
	this.curPage = curPage;
}

public int getCurRange() {
	return curRange;
}

public void setCurRange(int curRange) {
	this.curRange = curRange;
}

public int getListCnt() {
	return listCnt;
}

public void setListCnt(int listCnt) {
	this.listCnt = listCnt;
}

public int getPageCnt() {
	return pageCnt;
}

public void setPageCnt(int pageCnt) {
	this.pageCnt = pageCnt;
}

public int getRangeCnt() {
	return rangeCnt;
}

public void setRangeCnt(int rangeCnt) {
	this.rangeCnt = rangeCnt;
}

public int getStartPage() {
	return startPage;
}

public void setStartPage(int startPage) {
	this.startPage = startPage;
}

public int getEndPage() {
	return endPage;
}

public void setEndPage(int endPage) {
	this.endPage = endPage;
}

public int getStartIndex() {
	return startIndex;
}

public void setStartIndex(int startIndex) {
	this.startIndex = startIndex;
}

public int getPrevPage() {
	return prevPage;
}

public void setPrevPage(int prevPage) {
	this.prevPage = prevPage;
}

public int getNextPage() {
	return nextPage;
}

public void setNextPage(int nextPage) {
	this.nextPage = nextPage;
}

	public Follower(int listCnt, int curPage){
		
		/**
		 * 페이징 처리 순서
		 * 1. 총 페이지수
		 * 2. 총 블럭(range)수
		 * 3. range setting
		 */
		
		// 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
		/** 현재페이지 **/
		setCurPage(curPage);
		/** 총 게시물 수 **/
		setListCnt(listCnt);
		
		/** 1. 총 페이지 수 **/
		setPageCnt(listCnt);
		/** 2. 총 블럭(range)수 **/
		setRangeCnt(pageCnt);
		/** 3. 블럭(range) setting **/
		rangeSetting(curPage);
		
		/** DB 질의를 위한 startIndex 설정 **/
		setStartIndex(curPage);
	}

//기능 파악해서 구현 해야함
	/*블럭(range) 설정을 해준다. rangeSetting() 메소드에서 처리해주는데, 
	먼저 curPage(현재페이지)를 기준으로 현재 블럭(range)를 구해준다.*/


	private void rangeSetting(int curPage) {
		// TODO Auto-generated method stub
		
	}


}
