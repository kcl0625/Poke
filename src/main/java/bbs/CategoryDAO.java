package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;

public class CategoryDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	int res = 0;
	
	public ArrayList<CategoryDTO> getCategory(String bbs) {
		ArrayList<CategoryDTO> cate = new ArrayList<CategoryDTO>();
		try{
			con = Config.getConnection();
			sql = "select name from category c where bbs = ? order by c.order";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setName(rs.getString("name"));
				cate.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return cate;
	}
}