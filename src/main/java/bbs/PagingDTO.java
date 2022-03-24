package bbs;

public class PagingDTO {
	private int cur; //현재 페이지
	public int totalCnt; //전체 row 수
	private int start;
	private int end;
	private int displayItem; //한 페이지에 몇 개의 목록 보여줄 건지
	private int displayRow; //페이징 묶음
	public int getCur() {
		return cur;
	}
	public void setCur(int cur) {
		this.cur = cur;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getDisplayItem() {
		return displayItem;
	}
	public void setDisplayItem(int displayItem) {
		this.displayItem = displayItem;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
}
