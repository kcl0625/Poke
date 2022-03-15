package member;
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String nick;
	private String zip;
	private String add1;
	private String add2;
	private String tel;
	private String email;
	private int point;
	private int admin;
	
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	
	public String getPw() {return pw;}
	public void setPw(String pw) {this.pw = pw;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}

	public String getNick() {return nick;}
	public void setNick(String nick) {this.nick = nick;}
	
	public String getZip() {return zip;}
	public void setZip(String zip) {this.zip = zip;}
	
	public String getAdd1() {return add1;}
	public void setAdd1(String add1) {this.add1 = add1;}
	
	public String getAdd2() {return add2;}
	public void setAdd2(String add2) {this.add2 = add2;}
	
	public String getTel() {return tel;}
	public void setTel(String tel) {this.tel = tel;}
	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	public int getPoint() {return point;}
	public void setPoint(int point) {this.point = point;}
	
	public int getAdmin() {return admin;}
	public void setAdmin(int admin) {this.admin = admin;}
}