package order;

public class ItemDTO {
	private int no;
	private String type;
	private String name;
	private String ingre;
	private String day;
	private double cal;
	private int price;
	private int week;
	
	private String id;
	private int custom;
	private int quantity;
	private String description;
	private String filename;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getDay() {
		return day;
	}
	public double getCal() {
		return cal;
	}
	public void setCal(double cal) {
		this.cal = cal;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCustom() {
		return custom;
	}
	public void setCustom(int custom) {
		this.custom = custom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}