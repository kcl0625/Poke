package order;
import java.util.ArrayList;

public class OrderDTO extends ItemDTO {
	private int week;
	private String payment;
	private String totPrice;
	private String orderStatus;
	private String date;
	private String depositor;
	private ArrayList<ItemDTO> poke;

	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getTotPrice() {
		return totPrice;
	}
	public void setTotPrice(String totPrice) {
		this.totPrice = totPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public ArrayList<ItemDTO> getPoke() {
		return poke;
	}
	public void setPoke(ArrayList<ItemDTO> poke) {
		this.poke = poke;
	}
}