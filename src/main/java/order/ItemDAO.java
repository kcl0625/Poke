package order;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import config.Config;

public class ItemDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	
	public ArrayList<ItemDTO> getShop(String cate) {
		ArrayList<ItemDTO> shop = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, name, price, filename from shop where category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setFilename(rs.getString("filename"));
				shop.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return shop;
	}
	
	public ArrayList<ItemDTO> getShop() {
		ArrayList<ItemDTO> shop = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, name, price, filename from shop";
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setFilename(rs.getString("filename"));
				shop.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return shop;
	}
	
	public ItemDTO showView(int no){
		ItemDTO item = new ItemDTO();
		try {
			con = Config.getConnection();
			sql = "select name, price, description from shop where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setDescription(rs.getString("description"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return item;
	}
	
	public void addCart(ItemDTO dto, String id, String date) { //plan
		try	{
			con = Config.getConnection();
			sql = "insert into cartitem(type, name, ingre, price, cal, id, date, custom) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getIngre());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setDouble(5, dto.getCal());
			pstmt.setString(6, id);
			pstmt.setString(7, date);
			pstmt.setInt(8, dto.getCustom());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addCart(ItemDTO dto, int quantity, String id, String date) { //plan
		try	{
			con = Config.getConnection();
			sql = "insert into cartitem(type, name, price, id, date, quantity) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, id);
			pstmt.setString(5, date);
			pstmt.setInt(6, dto.getQuantity());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ItemDTO> getCart(String id) { //etc
		ArrayList<ItemDTO> cart = new ArrayList<ItemDTO>();
		try{
			con = Config.getConnection();
			sql = "select * from cartitem where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setIngre(rs.getString("ingre"));
				dto.setPrice(rs.getInt("price"));
				dto.setCustom(rs.getInt("custom"));
				dto.setQuantity(rs.getInt("quantity"));
				cart.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return cart;
	}
	
	public void deleteItem(int no, String id) {
		try {
			con = Config.getConnection();
			sql = "delete from cartitem where no = ? and id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
