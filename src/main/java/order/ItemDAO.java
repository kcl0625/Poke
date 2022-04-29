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
	
	public ArrayList<ItemDTO> getEtc(String cate) { //카테고리 선택
		ArrayList<ItemDTO> shop = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, name, price, filename from shop where category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getString("no"));
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
	
	public ArrayList<ItemDTO> getEtc() { //전체 보기
		ArrayList<ItemDTO> shop = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, name, price, filename from shop";
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getString("no"));
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
	
	public ArrayList<ItemDTO> getPoke() {
		ArrayList<ItemDTO> shop = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select no, name, price, ingre, description, filename from poke";
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setIngre(rs.getString("ingre"));
				dto.setDescription(rs.getString("description"));
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
			sql = "select name, price, description, filename from shop where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setDescription(rs.getString("description"));
				item.setFilename(rs.getString("filename"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return item;
	}
}
