package bbs;

public class PagingDTO {
	private int cur; //���� ������
	public int totalCnt; //��ü row ��
	private int start;
	private int end;
	private int displayItem; //�� �������� �� ���� ��� ������ ����
	private int displayRow; //����¡ ����
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
