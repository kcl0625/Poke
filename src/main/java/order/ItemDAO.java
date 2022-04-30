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
	
	public ItemDTO getPoke(String name, String ingre) { //메뉴 수정
		ItemDTO poke = new ItemDTO();
		try {
			con = Config.getConnection();
			sql = "select name, ingre from poke where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) { //bowls에 있는 메뉴
				poke.setName(rs.getString("name"));
				
				String[] ingreArr = rs.getString("ingre").split("/");
				sql = "select name, price, cal, filename from ingre where name = ?";
				pstmt = con.prepareStatement(sql);
				ArrayList<IngreDTO> ingreList = new ArrayList<IngreDTO>();
				
				for (int i=0;i<ingreArr.length;i++) {
					pstmt.setString(1, ingreArr[i]);
					ResultSet rs2 = pstmt.executeQuery();
					
					while(rs2.next()) {
						IngreDTO dto = new IngreDTO();
						dto.setName(rs2.getString("name"));
						dto.setPrice(rs2.getInt("price"));
						dto.setCal(rs2.getDouble("cal"));
						dto.setFileName(rs2.getString("filename"));
						ingreList.add(dto);
					}
					poke.setIngreList(ingreList);
				}
			} else { //사용자가 직접 만든 메뉴
				con = Config.getConnection();
				sql = "select name, price, cal, filename from ingre where name = ?";
				pstmt = con.prepareStatement(sql);
				
				String[] ingreArr = ingre.split("/");
				ArrayList<IngreDTO> ingreList = new ArrayList<IngreDTO>();
				
				for(int i=0;i<ingreArr.length;i++) {
					pstmt.setString(1, ingreArr[i]);
					ResultSet rs2 = pstmt.executeQuery();
					
					while(rs2.next()) {
						IngreDTO dto = new IngreDTO();
						dto.setName(rs2.getString("name"));
						dto.setPrice(rs2.getInt("price"));
						dto.setCal(rs2.getDouble("cal"));
						dto.setFileName(rs2.getString("filename"));
						ingreList.add(dto);
					}
					poke.setIngreList(ingreList);
				}	
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return poke;
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
