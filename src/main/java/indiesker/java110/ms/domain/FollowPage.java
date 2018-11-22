package indiesker.java110.ms.domain;

public class FollowPage {

private int no; //넘겨줄 회원번호
private int pageSize; // 게시 글 수
private int startPageNo; // 시작 페이지 (페이징 네비 기준)
private int pageNo; // 페이지 번호
private int totalCount; // 게시 글 전체 수



public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getPageSize() {
	return pageSize;
}
public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}
public int getStartPageNo() {
	return startPageNo;
}
public void setStartPageNo(int startPageNo) {
	this.startPageNo = startPageNo;
}
public int getPageNo() {
	return pageNo;
}
public void setPageNo(int pageNo) {
	this.pageNo = pageNo;
}
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
	this.makePaging();
}


/*
 * 페이징 생성
 */
private void makePaging() {
    if (this.totalCount == 0) return; // 게시 글 전체 수가 없는 경우
    if (this.pageNo == 0) this.setPageNo(1); // 기본 값 설정
    if (this.pageSize == 0) this.setPageSize(10); // 기본 값 설정

    int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
    if (this.pageNo > finalPage) this.setPageNo(finalPage); // 기본 값 설정

    if (this.pageNo < 0 || this.pageNo > finalPage) this.pageNo = 1; // 현재 페이지 유효성 체크

    int startPage = ((pageNo - 1) / 10) * 10 + 1; // 시작 페이지 (페이징 네비 기준)
    int endPage = startPage + 10 - 1; // 끝 페이지 (페이징 네비 기준)

    if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
        endPage = finalPage;
    }
}

/*@Override
public String toString() {
    return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
}*/
}
