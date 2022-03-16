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
	
	public ArrayList<IngreDTO> getIngreCate() {
		ArrayList<IngreDTO> cate = new ArrayList<IngreDTO>();
		try{
			con = Config.getConnection();
			sql = "select name from ingre_cate_tbl i order by i.order";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IngreDTO dto = new IngreDTO();
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
