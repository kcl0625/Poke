package order.cart;

import config.Config;
import order.ItemDTO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	
	public ArrayList<ItemDTO> getPokeCart(String id) {
		ArrayList<ItemDTO> cart = new ArrayList<ItemDTO>();
		try{
			con = Config.getConnection();
			sql = "select c.*, p.filename";
			sql += " from poke p";
			sql += " right outer join cart c";
			sql += " on p.no = c.no";
			sql += " where id = ? and type = 'poke'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getString("no"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setIngre(rs.getString("ingre"));
				dto.setPrice(rs.getInt("price"));
				dto.setCustom(rs.getInt("custom"));
				dto.setFilename(rs.getString("filename"));
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
	
	public ArrayList<ItemDTO> getEtcCart(String id) {
		ArrayList<ItemDTO> cart = new ArrayList<ItemDTO>();
		try{
			con = Config.getConnection();
			sql = "select c.*, e.filename";
			sql += " from cart c, etc e";
			sql += " where c.id = ?";
			sql += " and type = 'etc'";
			sql += " and c.no = e.no";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getString("no"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setIngre(rs.getString("ingre"));
				dto.setPrice(rs.getInt("price"));
				dto.setCustom(rs.getInt("custom"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setFilename(rs.getString("filename"));
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
	
	public String addCart(ItemDTO dto, String id, String date) { //plan
		String res = "";
		try	{
			con = Config.getConnection();
			String no = dto.getNo();
			
			sql = "select * from cart where no = ? and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setString(2, id);
			
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			if(!rs.next()) { //중복 메뉴 없음
				sql = "insert into cart(no, type, name, ingre, price, cal, id, date, custom) values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNo());
				pstmt.setString(2, dto.getType());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getIngre());
				pstmt.setInt(5, dto.getPrice());
				pstmt.setDouble(6, dto.getCal());
				pstmt.setString(7, id);
				pstmt.setString(8, date);
				pstmt.setInt(9, dto.getCustom());
				
				pstmt.executeUpdate();
				res = "y";
			} else {
				res = "n";
			}
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public String addCart(ItemDTO dto, int quantity, String id, String date) { //etc
		String res = "";
		try	{
			con = Config.getConnection();
			
			sql = "select * from cart where no = ? and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNo());
			pstmt.setString(2, id);
			
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				sql = "insert into cart(no, type, name, price, id, date, quantity) values(?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNo());
				pstmt.setString(2, dto.getType());
				pstmt.setString(3, dto.getName());
				pstmt.setInt(4, dto.getPrice());
				pstmt.setString(5, id);
				pstmt.setString(6, date);
				pstmt.setInt(7, dto.getQuantity());
				
				pstmt.executeUpdate();
				res = "y";
			} else {
				res = "n";
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public void modMenu(ItemDTO dto, String no, String id, String date) { //etc
		try	{
			con = Config.getConnection();
			
			sql = "select * from cart where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			if(!rs.next()) { //중복 메뉴 없음
				sql = "insert into cart(no, type, name, ingre, price, cal, id, date, custom) values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, no);
				pstmt.setString(2, dto.getType());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getIngre());
				pstmt.setInt(5, dto.getPrice());
				pstmt.setDouble(6, dto.getCal());
				pstmt.setString(7, id);
				pstmt.setString(8, date);
				pstmt.setInt(9, dto.getCustom());
			} else {
				sql = "update cart set ";
				sql += "name = ?, ";
				sql += "ingre = ?, ";
				sql += "cal = ?, ";
				sql += "price = ? ";
				
				sql += "where no = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getIngre());
				pstmt.setDouble(3, dto.getCal());
				pstmt.setInt(4, dto.getPrice());
				pstmt.setString(5, no);
				
			}
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delCart(String no, String id) {
		try {
			con = Config.getConnection();
			sql = "delete from cart where no = ? and id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
