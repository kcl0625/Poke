package review;

public class ReviewDTO {
	private int no;
	private String id;
	private String nick;
	private int star;
	private String content;
	private String ingre;
	private String poke;
	private String fileName;
	private String date;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public String getPoke() {
		return poke;
	}
	public void setPoke(String poke) {
		this.poke = poke;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
