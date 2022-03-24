package poke;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;

public class IngreDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	int res = 0;
	
	public ArrayList<IngreDTO> selectCate(String cate) {
		ArrayList<IngreDTO> ingreList = new ArrayList<IngreDTO>();
		try {
			con = Config.getConnection();
			sql = "select name, cal, price, origin, fileName from ingre where cate = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IngreDTO dto = new IngreDTO();
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setCal(rs.getDouble("cal"));
				dto.setOrigin(rs.getString("origin"));
				dto.setFileName(rs.getString("fileName"));
				ingreList.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ingreList;
	}
}
